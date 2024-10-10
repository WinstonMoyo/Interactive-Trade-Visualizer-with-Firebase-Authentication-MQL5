//+------------------------------------------------------------------+
//|                                               tradeFunctions.mqh |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#include "components.mqh"
#include "GUI.mqh"

class tradeFunctions
  {
private:
int slPips;
int tpPips;
int riskReward;
double riskRewardPrices[];
int defB;
double riskAmount;
bool hideSL;
bool breakeven;
string comment;
double lotSize;
components *item[]; 
bool trading;
double nextReward;
double destination;
string signal;
string symbol;
double tickSize;
MqlTradeRequest myreq;
MqlTradeResult myres;
int reward_i;
double trailAmount;
bool opened;
bool trailing;
long myLevel;
double cutLoss;
double pLock;
double profit_d;
double stop;
int numTrades;
double openPrice;

public:
                     tradeFunctions();
                    ~tradeFunctions();
                    void closeAll();
                    void breakEven();
                    void calculateLots();
                    void openSell();
                    void openBuy();
                    void calculateRiskToReward(string signalTrading, double open);
                    void alwaysOn();
                    void setLines(GUI *graphic, bool myLines, string type);
                    void deleteLines();
                    void setBreakeven(bool breakven);
                    string getReward();
                    string getRiskAmount();
                    string getLots();
                    void setSlPips(int pips);
                    void setriskReward(int rwd);
                    void setDef(int d);
                    void setAmount(double amount);
                    void setHideSL(bool slHide);
                    void setTrailAmount(double trail);
                    void trailStop();
                    bool getOpened();
                    void setOpened(bool setting);
                    void setTrailing(bool ttrr);
                    void setLevel(long l);
                    void setCutLoss(double cutLossAmount);
                    void setProfit(double lock);
                    void setDprofit(double dee_profit);
                    double getSL();
                    void drawLines(bool drawLinesCheck);
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
tradeFunctions::tradeFunctions()
  {
  slPips = 1;
  slPips = slPips + int(SymbolInfoInteger(symbol, SYMBOL_SPREAD));
  riskReward = 5;
  tpPips = riskReward*slPips;
  defB = 2;
  riskAmount = 1000.00;
  hideSL = false;
  breakeven = true;
  comment = "";
  lotSize = 0.01;
  trading = false;
  reward_i = 0;
  nextReward = 0;
  opened = false;
  trailing = false;
  myLevel = 0;
  profit_d = 0;
  pLock = 0;
  cutLoss = 0;
  numTrades = 0;
  symbol = _Symbol;
  ZeroMemory(item);
  ArrayResize(riskRewardPrices, riskReward);
  trailAmount = 5000;
  
  
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
tradeFunctions::~tradeFunctions()
  {
  }
//+------------------------------------------------------------------+
void tradeFunctions::breakEven()
{
   
      if(item.Size() == 0)
      {
      trading = false;
      }
      else if((trading && signal == "buy" && SymbolInfoDouble(symbol, SYMBOL_ASK) > nextReward) || (trading && signal == "sell" && SymbolInfoDouble(symbol, SYMBOL_BID) < nextReward))
      {
      
         for(int i = 0 ; i < ArraySize(item); i++)
         {
         myreq.action = TRADE_ACTION_SLTP;
         myreq.position = item[i].getticket();
         myreq.sl = item[i].getopen();
         if(!OrderSend(myreq, myres))
         {
         Alert("Cannot go into breakeven");
         }
         else
         {
            Alert("stop loss at breakeven");
         }
         
         }
         
      }
   
   
}

void tradeFunctions::openBuy()
{
numTrades = numTrades + 1;

ArrayResize(item, int(numTrades));
      calculateLots();
      item[numTrades-1] = new components();
      item[numTrades-1].setopen(SymbolInfoDouble(symbol, SYMBOL_ASK));
      calculateRiskToReward("buy", item[numTrades-1].getopen());
      item[numTrades-1].setentry("buy");
      item[numTrades-1].setsl(stop);
      myreq.action = TRADE_ACTION_DEAL;
       myreq.type = ORDER_TYPE_BUY;
      myreq.comment = comment;
      myreq.magic = 22072909;
      myreq.deviation = 0;
      if(hideSL)
      {
      myreq.sl = 0;
      }
      else if(!hideSL)
      {
      myreq.sl = item[numTrades-1].getsl();
      }
      myreq.volume = lotSize;
      
      item[numTrades-1].settp(destination);
      myreq.tp = item[numTrades-1].gettp();
      myreq.symbol = symbol;
      myreq.price = item[numTrades-1].getopen();
      
      if(!OrderSend(myreq, myres))
      {
      Alert("could not open trades");
      delete item[numTrades-1];
      numTrades = numTrades -1;
      }
      else
      {
      item[numTrades-1].setticket(myres.order);
       item[numTrades-1].settrailPrice(item[numTrades-1].getopen());
       openPrice = item[numTrades-1].getopen();
      drawLines(true);
      Alert("trades Opened");
      trading = true;
      opened = true;
      signal = "buy";
      }
   
   



}


void tradeFunctions::openSell()
{
numTrades = numTrades + 1;

ArrayResize(item, int(numTrades));
      calculateLots();
      item[numTrades-1] = new components();
      item[numTrades-1].setopen(SymbolInfoDouble(symbol, SYMBOL_BID));
      calculateRiskToReward("sell", item[numTrades-1].getopen());
      item[numTrades-1].setentry("sell");
      item[numTrades-1].setsl(stop);
      myreq.action = TRADE_ACTION_DEAL;
      myreq.type = ORDER_TYPE_SELL;
      myreq.comment = comment;
      myreq.magic = 22072909;
      myreq.deviation = 0;
      if(hideSL)
      {
      myreq.sl = 0;
      }
      else if(!hideSL)
      {
      myreq.sl = item[numTrades-1].getsl();
      }
      myreq.volume = lotSize;
      
      item[numTrades-1].settp(destination);
      
      myreq.price = item[numTrades-1].getopen();
      myreq.tp = item[numTrades-1].gettp();
      myreq.symbol = symbol;
      
      if(!OrderSend(myreq, myres))
      {
      Alert("could not open trades");
      
      delete item[numTrades-1];
      numTrades = numTrades -1;
      }
      else
      {
      item[numTrades-1].setticket(myres.order);
      item[numTrades-1].settrailPrice(item[numTrades-1].getopen());
      openPrice = item[numTrades-1].getopen();
      drawLines(true);
      Alert("trades Opened");
      trading = true;
      opened = true;
      signal = "sell";
      }
   
   
   


}


void tradeFunctions::calculateLots(void)
{

tickSize = SymbolInfoDouble(symbol, SYMBOL_TRADE_TICK_SIZE);

double tickValue = SymbolInfoDouble(symbol, SYMBOL_TRADE_TICK_VALUE);
double point = Point();
double pipValue = (tickValue*point)/tickSize;
tickSize = tickSize *slPips;

lotSize = (riskAmount)/(slPips*pipValue);
lotSize = floor(lotSize);

}

void tradeFunctions::calculateRiskToReward(string signalTrading, double open)
{

if(signalTrading == "buy")
{
ZeroMemory(riskRewardPrices);
   for(int i = 0; i < riskReward; i++)
   {
  
   riskRewardPrices[i] = (tickSize * (i+1)) + open;
   
   
   
   }
   stop = open - tickSize;
   destination = (tickSize * riskReward) + open;
}
else if(signalTrading == "sell")
{
ZeroMemory(riskRewardPrices);
   for(int i = 0; i < riskReward; i++)
   {
   
   riskRewardPrices[i] = open - (tickSize * (i+1));
   
   
   
   }
   stop = open + tickSize;
   destination = open - (tickSize * riskReward);
}

}

void tradeFunctions::alwaysOn(void)
{
   if(trading)
   {
   
   trailStop();
      if(signal == "buy" && nextReward == 0)
      {
         nextReward = riskRewardPrices[reward_i];
      }
      else if(signal == "buy" && SymbolInfoDouble(symbol, SYMBOL_ASK) > nextReward)
      {
      reward_i = reward_i + 1;
      nextReward = riskRewardPrices[reward_i];
      Alert("At RR"+string(reward_i));
      if(reward_i == defB)
      {
      breakEven();
      }
      
      }
      
      
      
      if(signal == "sell" && nextReward == 0)
      {
         nextReward = riskRewardPrices[reward_i];
           
      
      }
      else if(signal == "sell" && SymbolInfoDouble(symbol, SYMBOL_BID) < nextReward)
      {
      
      reward_i = reward_i + 1;
      nextReward = riskRewardPrices[reward_i];
      Alert("At RR"+string(reward_i));
      if(reward_i == defB)
      {
      breakEven();
      }
      }
      
      
      if( pLock != 0 && AccountInfoDouble(ACCOUNT_PROFIT) > pLock)
      {
      closeAll();
      }
      else if( cutLoss != 0 && AccountInfoDouble(ACCOUNT_PROFIT) < (cutLoss*-1))
      {
      closeAll();
      }
      
      

      
      
      
   
   }
   else
   {
      trading = false;
      numTrades = 0;
      ArrayFree(item);
      ZeroMemory(myreq);
      ZeroMemory(myres);
      nextReward = 0;
      
   ZeroMemory(riskRewardPrices);
   }
   
   if(AccountInfoDouble(ACCOUNT_BALANCE) == AccountInfoDouble(ACCOUNT_MARGIN_FREE))
      {
      trading = false;
      numTrades = 0;
      ArrayFree(item);
      ZeroMemory(myreq);
      ZeroMemory(myres);
      nextReward = 0;
      }


}
string tradeFunctions::getReward(void)
{
return string(riskReward);
}

string tradeFunctions::getRiskAmount(void)
{
return string(riskAmount);
}
string tradeFunctions::getLots(void)
{

return string(lotSize);
}

void tradeFunctions::setBreakeven(bool breakven)
{
breakeven = breakven;
}

void tradeFunctions::setHideSL(bool slHide)
{
hideSL = slHide;
if(trading && !hideSL)
{
   for(int i = 0; i < ArraySize(item); i++)
   {
      myreq.action = TRADE_ACTION_SLTP;
      myreq.sl = item[i].getsl();
      myreq.position = item[i].getticket();
      if(!OrderSend(myreq, myres))
      {
         Alert("Cannot show SL");
      }
      else
      {
      Alert("SL is showing");
      }
   }
}
if(trading && hideSL)
{
   for(int i = 0; i < ArraySize(item); i++)
   {
      myreq.action = TRADE_ACTION_SLTP;
      myreq.sl = 0;
      myreq.position = item[i].getticket();
      if(!OrderSend(myreq, myres))
      {
         Alert("Cannot hide SL");
      }
      else
      {
      Alert("SL is hiding");
      }
   }
}

}
void tradeFunctions::setAmount(double amount)
{
riskAmount = amount;
}

void tradeFunctions::setDef(int d)
{
defB = d;
}

void tradeFunctions::setriskReward(int rwd)
{
ArrayFree(riskRewardPrices);
ArrayResize(riskRewardPrices, rwd);
riskReward = rwd;
}

void tradeFunctions::setSlPips(int pips)
{
slPips = pips + int(SymbolInfoInteger(symbol, SYMBOL_SPREAD));
tpPips = riskReward*slPips;
}

void tradeFunctions::trailStop(void)
{
if( signal == "buy" && breakeven && trading && trailing && myLevel >= 2)
{
   for( int i = 0; i < ArraySize(item); i++)
   {
         myreq.action = TRADE_ACTION_SLTP;
         myreq.position = item[i].getticket();
         myreq.sl = item[i].gettrailPrice() + (SymbolInfoDouble(symbol, SYMBOL_TRADE_TICK_SIZE)*trailAmount);
         if(!OrderSend(myreq, myres))
         {
         
         }
         else
         {
            Alert("trailing stop loss updated");
            item[i].settrailPrice(myreq.sl);
         }
   
   
   }
   

}
else if( signal == "sell" && breakeven && trading && trailing)
{
   for( int i = 0; i < ArraySize(item); i++)
   {
         myreq.action = TRADE_ACTION_SLTP;
         myreq.position = item[i].getticket();
         myreq.sl = item[i].gettrailPrice() - (SymbolInfoDouble(symbol, SYMBOL_TRADE_TICK_SIZE)*trailAmount);
         if(!OrderSend(myreq, myres))
         {
         
         }
         else
         {
            Alert("trailing stop loss updated");
            item[i].settrailPrice(myreq.sl);
         }
   
   
   }
   

}

}

void tradeFunctions::setLines(GUI *graphic, bool myLines, string type)
{

if(myLines == true && type == "buy")
      {
      if(!trading)
      {
      calculateLots();
      calculateRiskToReward(type, SymbolInfoDouble(_Symbol, SYMBOL_ASK));
      int x;
      int sl_y;
      int o_y;
      int tp_y;
      ChartTimePriceToXY(0, 0, iTime(_Symbol, PERIOD_CURRENT, 0), stop, x, sl_y);
      ChartTimePriceToXY(0, 0, iTime(_Symbol, PERIOD_CURRENT, 0), SymbolInfoDouble(_Symbol, SYMBOL_ASK), x, o_y);
      ChartTimePriceToXY(0, 0, iTime(_Symbol, PERIOD_CURRENT, 0), riskRewardPrices[riskReward-1], x, tp_y);
      ObjectDelete(0, "stopLossLine");
      ObjectDelete(0, "openLine");
      ObjectDelete(0, "takeProfitLine");
      ObjectCreate(0, "stopLossLine", OBJ_HLINE, 0, iTime(_Symbol, PERIOD_CURRENT, 0), stop);
      ObjectCreate(0, "openLine", OBJ_HLINE, 0, iTime(_Symbol, PERIOD_CURRENT, 0), SymbolInfoDouble(_Symbol, SYMBOL_ASK));
      ObjectCreate(0, "takeProfitLine", OBJ_HLINE, 0, iTime(_Symbol, PERIOD_CURRENT, 0), riskRewardPrices[riskReward-1]);
      ObjectSetInteger(0, "takeProfitLine", OBJPROP_BACK, true);
      ObjectSetInteger(0, "stopLossLine", OBJPROP_BACK, true);
      ObjectSetInteger(0, "openLine", OBJPROP_BACK, true);
      string take = string(riskRewardPrices[riskReward-1]);
int i = StringFind(take, ".", 0);
take = StringSubstr(take, 0, i + 3);
      graphic.showBuy(tp_y, o_y, sl_y, x, string((int(riskAmount)*riskReward)), string(riskAmount), string(tpPips), take);
      
      }
          else if(trading)
      {
      
      int x;
      int sl_y;
      int o_y;
      int tp_y;
      ChartTimePriceToXY(0, 0, iTime(_Symbol, PERIOD_CURRENT, 0), stop, x, sl_y);
      ChartTimePriceToXY(0, 0, iTime(_Symbol, PERIOD_CURRENT, 0), openPrice, x, o_y);
      ChartTimePriceToXY(0, 0, iTime(_Symbol, PERIOD_CURRENT, 0), riskRewardPrices[riskReward-1], x, tp_y);
      ObjectDelete(0, "stopLossLine");
      ObjectDelete(0, "openLine");
      ObjectDelete(0, "takeProfitLine");
      ObjectCreate(0, "stopLossLine", OBJ_HLINE, 0, iTime(_Symbol, PERIOD_CURRENT, 0), stop);
      ObjectCreate(0, "openLine", OBJ_HLINE, 0, iTime(_Symbol, PERIOD_CURRENT, 0), openPrice);
      ObjectCreate(0, "takeProfitLine", OBJ_HLINE, 0, iTime(_Symbol, PERIOD_CURRENT, 0), riskRewardPrices[riskReward-1]);
      ObjectSetInteger(0, "takeProfitLine", OBJPROP_BACK, true);
      ObjectSetInteger(0, "stopLossLine", OBJPROP_BACK, true);
      ObjectSetInteger(0, "openLine", OBJPROP_BACK, true);
      string take = string(riskRewardPrices[riskReward-1]);
int i = StringFind(take, ".", 0);
take = StringSubstr(take, 0, i + 3);
      graphic.showBuy(tp_y, o_y, sl_y, x, string((int(riskAmount)*riskReward)), string(riskAmount), string(tpPips), take);
      
      }
      
      
      }
      else if(myLines == true && type == "sell")
      {
      
            if(!trading)
      {
      calculateLots();
      calculateRiskToReward(type, SymbolInfoDouble(_Symbol, SYMBOL_BID));
      int x;
      int sl_y;
      int o_y;
      int tp_y;
      ChartTimePriceToXY(0, 0, iTime(_Symbol, PERIOD_CURRENT, 0), stop, x, sl_y);
      ChartTimePriceToXY(0, 0, iTime(_Symbol, PERIOD_CURRENT, 0), SymbolInfoDouble(_Symbol, SYMBOL_BID), x, o_y);
      ChartTimePriceToXY(0, 0, iTime(_Symbol, PERIOD_CURRENT, 0), riskRewardPrices[riskReward-1], x, tp_y);
      ObjectDelete(0, "stopLossLine");
      ObjectDelete(0, "openLine");
      ObjectDelete(0, "takeProfitLine");
      ObjectCreate(0, "stopLossLine", OBJ_HLINE, 0, iTime(_Symbol, PERIOD_CURRENT, 0), stop);
      ObjectCreate(0, "openLine", OBJ_HLINE, 0, iTime(_Symbol, PERIOD_CURRENT, 0), SymbolInfoDouble(_Symbol, SYMBOL_BID));
      ObjectCreate(0, "takeProfitLine", OBJ_HLINE, 0, iTime(_Symbol, PERIOD_CURRENT, 0), riskRewardPrices[riskReward-1]);
      ObjectSetInteger(0, "takeProfitLine", OBJPROP_BACK, true);
      ObjectSetInteger(0, "stopLossLine", OBJPROP_BACK, true);
      ObjectSetInteger(0, "openLine", OBJPROP_BACK, true);
      string take = string(riskRewardPrices[riskReward-1]);
int i = StringFind(take, ".", 0);
take = StringSubstr(take, 0, i + 3);
      graphic.showSell(tp_y, o_y, sl_y, x, string((int(riskAmount)*riskReward)), string(riskAmount), string(tpPips), take);
      
      }
          else if(trading)
      {
      
      int x;
      int sl_y;
      int o_y;
      int tp_y;
      ChartTimePriceToXY(0, 0, iTime(_Symbol, PERIOD_CURRENT, 0), stop, x, sl_y);
      ChartTimePriceToXY(0, 0, iTime(_Symbol, PERIOD_CURRENT, 0), openPrice, x, o_y);
      ChartTimePriceToXY(0, 0, iTime(_Symbol, PERIOD_CURRENT, 0), riskRewardPrices[riskReward-1], x, tp_y);
      ObjectDelete(0, "stopLossLine");
      ObjectDelete(0, "openLine");
      ObjectDelete(0, "takeProfitLine");
      ObjectCreate(0, "stopLossLine", OBJ_HLINE, 0, iTime(_Symbol, PERIOD_CURRENT, 0), stop);
      ObjectCreate(0, "openLine", OBJ_HLINE, 0, iTime(_Symbol, PERIOD_CURRENT, 0), openPrice);
      ObjectCreate(0, "takeProfitLine", OBJ_HLINE, 0, iTime(_Symbol, PERIOD_CURRENT, 0), riskRewardPrices[riskReward-1]);
      ObjectSetInteger(0, "takeProfitLine", OBJPROP_BACK, true);
      ObjectSetInteger(0, "stopLossLine", OBJPROP_BACK, true);
      ObjectSetInteger(0, "openLine", OBJPROP_BACK, true);
      string take = string(riskRewardPrices[riskReward-1]);
int i = StringFind(take, ".", 0);
take = StringSubstr(take, 0, i + 3);
      graphic.showSell(tp_y, o_y, sl_y, x, string((int(riskAmount)*riskReward)), string(riskAmount), string(tpPips), take);
      
      }
      
      }


}

bool tradeFunctions::getOpened(void)
{
return opened;
}

void tradeFunctions::setOpened(bool setting)
{
opened = setting;
}

void tradeFunctions::closeAll(void)
{
Alert(string(ArraySize(item)));
if(ArraySize(item) != 0)
{

ZeroMemory(myreq);
ZeroMemory(myres);
for(int i = 0; i < ArraySize(item); i++)
{


         if(signal == "buy")
         {
         
         myreq.price = SymbolInfoDouble(_Symbol, SYMBOL_BID);
         myreq.action = TRADE_ACTION_DEAL;
         myreq.symbol = symbol;
         myreq.deviation = 10;
         myreq.volume = lotSize;
         myreq.type = ORDER_TYPE_SELL;
         myreq.position = item[i].getticket();
         if(!OrderSend(myreq, myres))
         {
         Alert("Cannot close trades: Try Again");
         }
         else
         {
            Alert("Trades closed");
           
            trading = false;
            ZeroMemory(myreq);
            ZeroMemory(myres);
            ObjectsDeleteAll(0, 0, OBJ_HLINE);
         }
         
         }
         else if(signal == "sell")
         {
         myreq.price = SymbolInfoDouble(_Symbol, SYMBOL_ASK);
         myreq.symbol = symbol;
         myreq.action = TRADE_ACTION_DEAL;
         myreq.deviation = 10;
         myreq.volume = lotSize;
         myreq.type = ORDER_TYPE_BUY;
         myreq.position = item[i].getticket();
         if(!OrderSend(myreq, myres))
         {
         Alert("Cannot close trades: Try Again");
         Alert(string(GetLastError()));
         }
         else
         {
            Alert("Trades closed");
            
            trading = false;
            ZeroMemory(myreq);
            ZeroMemory(myres);
            ObjectsDeleteAll(0, 0, OBJ_HLINE);
         }
         
         
         }


}



}





}

void tradeFunctions::setTrailing(bool ttrr)
{
trailing = ttrr;
}

void tradeFunctions::setTrailAmount(double trail)
{
trailAmount = trail;
}

void tradeFunctions::setLevel(long l)
{
myLevel = l;
}

void tradeFunctions::setProfit(double lock)
{
pLock = lock;
}

void tradeFunctions::setCutLoss(double cutLossAmount)
{
cutLoss = cutLossAmount;
}

void tradeFunctions::setDprofit(double dee_profit)
{
profit_d = dee_profit;
}

double tradeFunctions::getSL()
{
return stop;
}

void tradeFunctions::drawLines(bool drawLinesCheck)
{

if(drawLinesCheck == true)
{

for(int i = 0; i < riskReward-1; i++)
{
ObjectDelete(0, "rr"+string(i));
ObjectCreate(0, "rr"+string(i), OBJ_HLINE, 0, iTime(_Symbol, PERIOD_CURRENT, 0), riskRewardPrices[i]);
ObjectSetInteger(0, "rr"+string(i), OBJPROP_BACK, true);
}

}
else if(drawLinesCheck == false)
{

for(int i = 0; i < riskReward-1; i++)
{
ObjectDelete(0, "rr"+string(i));
}

}


}
