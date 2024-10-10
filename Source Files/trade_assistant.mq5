//+------------------------------------------------------------------+
//|                                        EA_with_serial_number.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
//below are global variables used to hold the current serial number
#include "JAson.mqh"
#include "incgui_v3.mqh"
#include "GUI.mqh"
#include "tradeFunctions.mqh"

string trialDate = "";
string serialNumber = "";
bool firstTime = false;
bool isTrading = false;
bool isBreak = true;
bool isHide = false;
bool isDraw = true;
bool isTrail = false;
datetime myDate  = iTime(_Symbol, PERIOD_CURRENT, 0);
string myType = "buy";
bool isSimulate = true;


GUI *myGUI;
tradeFunctions tf;
long numberOfTrades;
datetime dt;
string tempForAll;
long level = 2;
bool mainPage = true;
double profit = 0.0;

string testDate = string(myDate);

int OnInit()
  {
//---
ObjectsDeleteAll(0, 0, -1);
ChartSetInteger(0, CHART_SHIFT, true);
EventSetTimer(2);
for( int i = 0; i < 2; i ++)
   {
   serialNumber = serialNumber + string(rand()/10);
   }
myGUI = new GUI(AccountInfoString(ACCOUNT_NAME), serialNumber);
myGUI.tradePage();
testDate = StringSubstr(testDate, 0, 10);
tf.setLevel(level);
tf.calculateLots();

 /*if(getRequestAndCheckAccount(AccountInfoString(ACCOUNT_NAME), string(AccountInfoInteger(ACCOUNT_LOGIN)), int(StringSubstr(testDate, 3, 2)), int(StringSubstr(testDate, 0, 2)) ))
   {
   firstTime = false;
   myGUI = new GUI(AccountInfoString(ACCOUNT_NAME), serialNumber);
  myGUI.tradePage();
   }
   else
   {
   
   if(firstTime == true)
   {
   
   for( int i = 0; i < 2; i ++)
   {
   serialNumber = serialNumber + string(rand()/10);
   }
   
  if(putRequest(AccountInfoString(ACCOUNT_NAME), string(AccountInfoInteger(ACCOUNT_LOGIN)), serialNumber, testDate))
  {
  myGUI = new GUI(AccountInfoString(ACCOUNT_NAME), serialNumber);
  myGUI.tradePage();
  }
  
   }
   
   
   
   }

   
 */  
   
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
myGUI.changeToGeneralSettingsPage();
myGUI.changeToHomePage();
delete myGUI;
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---

   
  }
  
void OnTimer()
{
ObjectsDeleteAll(0, 0, OBJ_ARROW);
if(AccountInfoDouble(ACCOUNT_BALANCE) == AccountInfoDouble(ACCOUNT_MARGIN_FREE))
      {
     isTrading = false;
      }
     else{
     isTrading = true;
     }


if(isTrading)
{
tf.drawLines(isDraw);
}

if(isSimulate)
{
tf.setLines(myGUI, isDraw, myType);
}

tf.alwaysOn();
profit = AccountInfoDouble(ACCOUNT_EQUITY) - (AccountInfoDouble(ACCOUNT_BALANCE) + AccountInfoDouble(ACCOUNT_CREDIT));
if(tf.getOpened())
{
tf.setOpened(false);
}

if(mainPage)
{
//myGUI.changeToGeneralSettingsPage();
//myGUI.tradePage();
string myProfit = string(profit);
string stopL = string(tf.getSL());
int i = StringFind(myProfit, ".", 0);
myProfit = StringSubstr(myProfit, 0, i + 3);
myGUI.updateProfit(myProfit);
 i = StringFind(stopL, ".", 0);
stopL = StringSubstr(stopL, 0, i + 3);
myGUI.setStop(stopL);
}

}
//+------------------------------------------------------------------+

bool putRequest(string name, string mtAccount, string serialNum, string todaysDate)
{
CJAVal data;
data["48 Hour Trial Start Date"]=todaysDate;
data["Serial Number"]=serialNumber;
data["MT5 Account Number"]=mtAccount;


string url = "https://ninth-quarter-335016-default-rtdb.firebaseio.com/users/" + name + ".json";

   uchar jsonData[];
   ArrayResize(jsonData, StringToCharArray(data.Serialize(), jsonData, 0, WHOLE_ARRAY)-1);

  char serverResult[];

   string serverHeaders = "content-type: application/json;\n";

   int res = WebRequest("PUT", url, "", "", 10000, jsonData, ArraySize(jsonData), serverResult, serverHeaders);

   if(res == 200)
   {
   Alert("Successfully registered! Your 48 Hour Free Trial Starts Now.");
   
   return true;
   }
   
Alert("Error:Something unexpected occured. Reload the EA.");

return false;
}


bool getRequestAndCheckAccount(string name, string mtAccount, int nowMonth, int nowDay)
{
  char serverResult[];
  CJAVal result;
  char jsonData[];
  string url = "https://ninth-quarter-335016-default-rtdb.firebaseio.com/users/" + name + ".json";

   string serverHeaders = "content-type: application/json;\n";

   int res = WebRequest("GET", url, "", "", 10000, jsonData, 0, serverResult, serverHeaders);
   
   if(res == 200)
   {
   string needToDeserialise = result.GetStr(serverResult,0 , ArraySize(serverResult)); 
   result.Deserialize(needToDeserialise);
   if(result["MT5 Account Number"].ToStr() == mtAccount && result["Serial Number"].ToStr() != "")
   {
   serialNumber = result["Serial Number"].ToStr();
   Alert("Your serial number is: " + serialNumber);
   trialDate = result["48 Hour Trial Start Date"].ToStr();
   level = StringToInteger(result["Level"].ToStr());
   Alert("Your trial started on :" + trialDate);
   int day;
   int month;
   day = int(StringSubstr(trialDate, 0, 2));
   month = int(StringSubstr(trialDate, 3, 2));
   
   if(nowMonth == month && day == nowDay && level == 0)
   {
   Alert("Trial Still Active: 48 Hours Remaining");
 
   return true;
   }
   else if(nowMonth == month && (day + 1) == nowDay && level == 0)
   {
   Alert("Trial Still Active: 24 Hours Remaining");
 
   return true;
   }
   else if(nowMonth == month && (day + 2) == nowDay && level == 0)
   {
   Alert("Trial Ended: 0 Hours Remaining");
  
   return true;
   }
   else if(nowMonth == month && (day + 2) < nowDay && level == 0)
   {
   Alert("Trial Ended");
   
   return true;
   }
   
   }
   else
   {
   Alert("Wrong MT5 Account for user with this name");
   
   }
   
   
   }
   
   firstTime = true;
   
   
   Alert("No Account with these details found: error");
   
   return false;
}

void checkPipe()
{
 ObjectCreate(0, "arrowDown", OBJ_ARROW_DOWN, 0,iTime(_Symbol,PERIOD_CURRENT, 0), SymbolInfoDouble(_Symbol, SYMBOL_BID), clrRed);
  char serverResult[];
  level = 2;
  CJAVal result;
  char jsonData[];
  string url = "https://eo3vl7moo8gxa5f.m.pipedream.net";

   string serverHeaders = "content-type: application/json";

   int res = WebRequest("GET", url, "", "", 10000, jsonData, 0, serverResult, serverHeaders);
   
   if(res == 200 && level >= 1)
   {
   string needToDeserialise = result.GetStr(serverResult,0 , ArraySize(serverResult)); 
   result.Deserialize(needToDeserialise);
   if(result["Type"].ToStr() == "BUY")
   {
   Alert("buying");
   ObjectDelete(0, "arrowUp");
   ObjectCreate(0, "arrowUp", OBJ_ARROW_UP, 0, iTime(_Symbol,PERIOD_CURRENT, 0), SymbolInfoDouble(_Symbol, SYMBOL_ASK), clrGreen);
   }
   else if(result["Type"].ToStr() == "SELL")
   {
   Alert("selling");
   ObjectDelete(0, "arrowDown");
   ObjectCreate(0, "arrowDown", OBJ_ARROW_DOWN, 0,iTime(_Symbol,PERIOD_CURRENT, 0), SymbolInfoDouble(_Symbol, SYMBOL_BID), clrRed);
   }
   
   }


}


void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)
{
if(id == CHARTEVENT_OBJECT_CLICK)
{
   if(sparam == "tradeScreenBtn")
   {
   if(!mainPage)
   {
   mainPage = true;
   }
   myGUI.changeToGeneralSettingsPage();
   myGUI.tradePage();
   }
   else if(sparam == "SettingsScreenBtn")
   {
   if(mainPage)
   {
   mainPage = false;
   }
   myGUI.changeToGeneralSettingsPage();
   myGUI.settingsGeneralPage();
   }
   else if(sparam == "sellBtn")
   {
   if(myType == "buy")
   {
   Alert("Buy trade is still showing");
   }
   else if(myType == "sell")
   {
   tf.openSell();
   myGUI.changeToGeneralSettingsPage();
   myGUI.tradePage();
   } 
   
   }
   else if(sparam == "buyBtn")
   {
   
   if(myType == "sell")
   {
   Alert("Sell trade is still showing");
   }
   else if(myType == "buy")
   {
   tf.openBuy();
   myGUI.changeToGeneralSettingsPage();
   myGUI.tradePage();
   }
   
   }
   else if(sparam == "CalcLotBtn")
   {
   myGUI.changeToGeneralSettingsPage();
   myGUI.tradePage();
   tf.calculateLots();
   myGUI.showCalculations(tf.getReward(), "1", tf.getRiskAmount(), tf.getLots());
   }
   else if(sparam == "breakevenBtn")
   {
     tf.breakEven();
     myGUI.changeToGeneralSettingsPage();
     myGUI.tradePage();

   }
      else if(sparam == "hideSlBtn")
   {
     if(isHide == true)
     {
     isHide = false;
     Alert("Hide Stop Loss turned off.");
     myGUI.hideButton(isHide);
     tf.setHideSL(false);
     myGUI.changeToGeneralSettingsPage();
     myGUI.settingsGeneralPage();
     }
     else if(isHide == false)
     {
     isHide = true;
     Alert("Hide Stop Loss turned on.");
     myGUI.hideButton(isHide);
      tf.setHideSL(true);
     myGUI.changeToGeneralSettingsPage();
     myGUI.settingsGeneralPage();
     }
   }
   else if(sparam == "LinesBtn")
   {
   if(isTrading)
   {
    if(isSimulate && isDraw == true)
      {
      isDraw = false;
      tf.drawLines(isDraw);
      myGUI.deleteSim();
      isSimulate = false;
      myGUI.linesButton(isDraw);
      myGUI.changeToGeneralSettingsPage();
     myGUI.tradePage();
      }
      else if(!isSimulate && isDraw == false)
      {
      isDraw = true;
      tf.drawLines(isDraw);
      isSimulate = true;
      myGUI.linesButton(isDraw);
      myGUI.changeToGeneralSettingsPage();
     myGUI.tradePage();
      }
   }
   else if(!isTrading)
   {
   
   if(isSimulate)
   {
   isSimulate = false;
   myGUI.linesButton(isSimulate);
   myGUI.deleteSim();
   ObjectsDeleteAll(0, 0, OBJ_HLINE);
   myGUI.changeToGeneralSettingsPage();
     myGUI.tradePage();
   }
   else if(!isSimulate)
   {
   isSimulate = true;
   myGUI.linesButton(isSimulate);
   myGUI.changeToGeneralSettingsPage();
     myGUI.tradePage();
   
   }
   
   }
   
   }
   else if(sparam == "closeAllBtn")
   {
   tf.closeAll();
   myGUI.changeToGeneralSettingsPage();
     myGUI.tradePage();
   }
   else if(sparam == "trailStop")
   {
   
   if(isTrail)
   {
   isTrail = false;
   myGUI.trailButton(isTrail);
   tf.setTrailing(isTrail);
   myGUI.changeToGeneralSettingsPage();
   myGUI.tradePage();
   
   }
   else if(!isTrail)
   {
   isTrail = true;
   myGUI.trailButton(isTrail);
   tf.setTrailing(isTrail);
   myGUI.changeToGeneralSettingsPage();
   myGUI.tradePage();
   }
   
   }
   else if(sparam == "switchButton")
   {
   if(myType == "buy")
   {
   myType = "sell";
   }
   else if(myType == "sell")
   {
   myType = "buy";
   }
   
   
   }
   

}

if(id == CHARTEVENT_OBJECT_ENDEDIT)
{
   if(sparam == "defaultEdit")
   {
   
   g.Attach("defaultEdit", 0);
   int defau = 0;
   for(long i = 0; i < StringToInteger(g.Text()); i++)
   {
   defau = defau + 1;
   }
   tf.setDef(defau);
   myGUI.showCalculationsDefault(g.Text());
    myGUI.changeToGeneralSettingsPage();
  myGUI.changeToHomePage();
  myGUI.settingsGeneralPage();
   }
   else if(sparam == "pipsSlEdit")
   {
   Sleep(3000);
   g.Attach("pipsSlEdit", 0);
   int pips = 0;
   for(long i = 0; i < StringToInteger(g.Text()); i++)
   {
   pips = pips + 1;
   }
   tf.setSlPips(pips);
   myGUI.showCalculationsPips(g.Text());
    myGUI.changeToGeneralSettingsPage();
  myGUI.changeToHomePage();
  myGUI.tradePage();
   }
   else if(sparam == "RRedit")
   {
   g.Attach("RRedit", 0);
   int rr = 0;
   for(long i = 0; i < StringToInteger(g.Text()); i++)
   {
   rr = rr + 1;
   }
   tf.setriskReward(rr);
   myGUI.showCalculationsReward(g.Text());
    myGUI.changeToGeneralSettingsPage();
  myGUI.changeToHomePage();
  myGUI.settingsGeneralPage();
   }
   else if(sparam == "riskEdit")
   {
   g.Attach("riskEdit", 0);
   tf.setAmount(StringToDouble(g.Text()));
   myGUI.showCalculationsAmount(g.Text());
   myGUI.changeToGeneralSettingsPage();
  myGUI.changeToHomePage();
  myGUI.settingsGeneralPage();
   }
   else if(sparam == "trailEdit")
   {
   
    g.Attach("trailEdit", 0);
  myGUI.editTrail(g.Text());
  tf.setTrailAmount(StringToDouble(g.Text()));
  myGUI.changeToGeneralSettingsPage();
  myGUI.changeToHomePage();
  myGUI.tradePage();
   }
   else if(sparam == "cutLossEdit")
   {
   
     g.Attach("cutLossEdit", 0);
     if((-1 * StringToDouble(g.Text())) > AccountInfoDouble(ACCOUNT_PROFIT))
     {
     Alert("Cut Loss is greater than loss amount");
     }
     else
     {
  myGUI.setCutLoss(g.Text());
  tf.setCutLoss(StringToDouble(g.Text()));
  myGUI.changeToGeneralSettingsPage();
  myGUI.changeToHomePage();
  myGUI.tradePage();
  }
  
   }
   else if(sparam == "profitLockEdit")
   {
    g.Attach("profitLockEdit", 0);
     if((-1 * StringToDouble(g.Text())) < AccountInfoDouble(ACCOUNT_PROFIT))
     {
     Alert("Profit Lock is less than profit amount");
     }
     else
     {
  myGUI.setProfitLock(g.Text());
  tf.setProfit(StringToDouble(g.Text()));
  myGUI.changeToGeneralSettingsPage();
  myGUI.changeToHomePage();
  myGUI.tradePage();
  }
  
   }
   else if(sparam == "dProfitEdit")
   {
    g.Attach("dProfitEdit", 0);
  myGUI.setDProfit(g.Text());
  tf.setDprofit(StringToDouble(g.Text()));
  myGUI.changeToGeneralSettingsPage();
  myGUI.changeToHomePage();
  myGUI.tradePage();
   }
   


}







}
