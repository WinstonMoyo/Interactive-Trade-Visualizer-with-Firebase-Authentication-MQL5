//+------------------------------------------------------------------+
//|                                                          GUI.mqh |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#include "incgui_v3.mqh"

class GUI
  {
private:

bool hideSl;
bool isBreaking;
bool trail;
bool lines;
string comment;
long numTrades;
string spread;
string Reward;
string Risk;
string lotsize;
string amount;
string riskPercent;
string pipsSL;
string sl;
string trailAm;
int numberPresets;
string accName;
string serialN;
string cutLoss;
string profit;
string d_profit;
string defaultB;
string message;


public:
                     GUI(string name, string serialNumber);
                    ~GUI();
                    void tradePage();
                    void settingsGeneralPage();
                    void settingsPresetsPage();
                    void infoPage();
                    void closePage();
                   void changeToHomePage();
                   void changeToGeneralSettingsPage();
                   void showCalculations(string reward, string risk, string riskAmount, string lot);
                   void breakEvenButton(bool switching);
                   void hideButton(bool hiding);
                   void linesButton(bool theLines);
                   void trailButton(bool tr);
                   void showCalculationsReward(string reward);
                   void GUI::showCalculationsDefault(string def);
                void GUI::showCalculationsAmount(string riskAmount);
               void GUI::showCalculationsPips(string sl_pips);  
               void showTrailAmount();   
               void editTrail(string trailEd);
               void setCutLoss(string cutLosses);
               void setProfitLock(string profitLock);
               void setDProfit(string dProfit);
               void updateProfit(string prof);
               void setStop(string lossStop);
               void showBuy(int TP,int open,int stop_loss, int myX, string uprofit, string loss, string TPpips, string TPprice);
               void showSell(int TP,int open,int stop_loss, int myX, string uprofit, string loss, string TPpips, string TPprice);
               void showMessageBox(string message);
               void deleteSim();
              
                           
                   
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
GUI::GUI(string name, string serialNumbers)
  {
  isBreaking = true;
  hideSl = false;
  comment = "Comment: ";
  numTrades = 1;
  spread = string(SymbolInfoInteger(_Symbol, SYMBOL_SPREAD));
  Reward = "5";
  Risk = "1";
  amount = "1000";
  lotsize = "";
  riskPercent = "1";
  pipsSL = string(1 + int(spread));
  lines = true;
  trail = false;
  trailAm = "1";
  numberPresets = 5;
  accName = name;
  serialN = serialNumbers;
  d_profit = "";
  profit = "";
  cutLoss = "";
  defaultB = "2";
  message = "No Message";
  
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
GUI::~GUI()
  {
  }
//+------------------------------------------------------------------+
void GUI::tradePage()
{
w.Frame("topFrame", 0, 20, 150, 600, 80, accName + " " + serialN, 100, clrWhiteSmoke, clrBlack ,clrBlack);
w.Frame("Frame1", 0, 20, 230, 600, 50, "", 100, clrWhiteSmoke, clrBlack ,clrBlack);
w.Frame("Frame2", 0, 20, 280, 600, 100, "", 100, clrWhiteSmoke, clrBlack ,clrBlack);
w.Frame("Frame3", 0, 20, 380, 600, 350, "", 100, clrWhiteSmoke, clrBlack ,clrBlack);
w.Button("tradeScreenBtn", 0, 20, 200, 200, 30, "Controls", clrDarkBlue, clrWhite);
w.Button("SettingsScreenBtn", 0, 220, 200, 200, 30, "Settings", clrLightBlue, clrBlack);
w.Label("spread", 0, 430, 160, "Spread: " + spread, clrBlack, 10, "Arial");
//w.Label("reward", 0, 50, 310, "R/TP ", clrWhite, 10, "Arial");
//w.Label("risk", 0, 150, 310, "R/SL ", clrWhite, 10, "Arial");
//w.Label("amount", 0, 320, 310, "RISK USD", clrWhite, 10, "Arial");
w.Button("CalcLotBtn", 0, 410, 300, 150, 40, "Calculate Trade", clrLightGray, clrBlack);
w.Label("minLot", 0, 50, 350, "min lot: 0.01", clrBlack, 8, "Arial");
w.Label("cutLoss", 0, 50, 450, "Cut Loss: $", clrBlack, 10, "Arial");
w.Label("profitLock", 0, 50, 500, "Profit Lock: $", clrBlack, 10, "Arial");
w.Label("Dprofit", 0, 50, 550, "DProfit: $", clrBlack, 10, "Arial");
w.Edit("cutLossEdit", 0, 220, 452, 200, 30, cutLoss, clrWhite, clrBlack, 8, "Arial");
w.Edit("profitLockEdit", 0, 220, 502, 200, 30, profit, clrWhite, clrBlack, 8, "Arial");
w.Edit("dProfitEdit", 0, 220, 552, 200, 30, d_profit, clrWhite, clrBlack, 8, "Arial");
w.Label("stopLoss", 0, 420, 240, "SL-pips:", clrBlack, 10, "Arial");
w.Edit("pipsSlEdit", 0, 530, 240, 70, 30, pipsSL, clrWhite, clrBlack);
if(lines == true)
{
w.Delete("LinesBtn");
w.Button("LinesBtn", 0, 420, 200, 200, 30, "Draw Lines", clrDarkBlue, clrWhite);
}
if(lines == false)
{
w.Delete("LinesBtn");
w.Button("LinesBtn", 0, 420, 200, 200, 30, "Draw Lines", clrLightBlue, clrBlack);
}

//w.Label("comment", 0, 50, 410, "Comment" , clrWhite, 10, "Arial");
//w.Edit("commentEdit", 0, 50, 450, 750, 30, comment, clrWhite, clrBlack, 8, "Arial");
w.Label("LotDisplay", 0, 50, 240, "Lots: "+lotsize, clrBlack, 10, "Arial");
w.Button("sellBtn", 0, 50, 300, 150, 40, "SELL", clrRed, clrWhite);
w.Button("buyBtn", 0, 230, 300, 150, 40, "BUY", clrBlue , clrWhite);
w.Button("closeAllBtn", 0, 50, 600, 150, 40, "CLOSE ALL", clrRed, clrWhite);
//w.Edit("numTrades", 0, 320, 570, 50, 30, string(numTrades), clrWhite, clrBlack, 8, "Arial");
//w.Label("NumPositons", 0, 50, 570, "Number of Positions:", clrWhite, 10, "Arial");
//showCalculations(Reward, Risk, amount, lotsize);
   if(isBreaking == false)
   { 
   w.Delete("breakevenBtn");
w.Button("breakevenBtn", 0, 230, 600, 150, 40, "BREAKEVEN", clrLightBlue, clrBlack);
   }
   else if(isBreaking == true)
   {
   
   w.Delete("breakevenBtn");
w.Button("breakevenBtn", 0, 230, 600, 150, 40, "BREAKEVEN", clrDarkBlue, clrWhite);
   }
   
   if(trail)
   {
   w.Delete("trailStop");
   w.Delete("trailEdit");
   showTrailAmount();
   w.Button("trailStop", 0, 410, 600, 150, 40, "TRAILING SL", clrDarkBlue, clrWhite);
   }
   else if(!trail)
   {
   w.Delete("trailStop");
   w.Delete("trailEdit");
   w.Button("trailStop", 0, 410, 600, 150, 40, "TRAILING SL", clrLightBlue, clrBlack);  
}
showMessageBox(message);
w.Redraw();
}

void GUI::settingsGeneralPage(void)
{
w.Frame("topFrame", 0, 20, 150, 600, 80, accName + " " + serialN, 100, clrWhiteSmoke, clrBlack ,clrBlack);
w.Frame("Frame1", 0, 20, 230, 600, 500, "", 100, clrWhiteSmoke, clrBlack ,clrBlack);
w.Button("tradeScreenBtn", 0, 20, 200, 200, 30, "Controls", clrLightBlue, clrBlack);
w.Button("SettingsScreenBtn", 0, 220, 200, 200, 30, "Settings", clrDarkBlue, clrWhite);
w.Label("default", 0, 50, 400, "Default Breakeven R/R 1:", clrBlack, 10, "Arial");
w.Edit("defaultEdit", 0, 365, 400, 50, 30, defaultB, clrWhite, clrBlack);
w.Label("RR", 0, 50, 500, "Risk/Reward: 1:", clrBlack, 10, "Arial");
w.Edit("RRedit", 0, 250, 500, 50, 30, Reward, clrWhite, clrBlack, 8, "Arial");
w.Label("riskAmount", 0, 50, 300, "Risk Amount:  $", clrBlack, 10, "Arial");
w.Edit("riskEdit", 0, 250, 300, 100, 30, amount, clrWhite, clrBlack);
w.Label("hideSl", 0, 30, 400, "HIDE SL: OFF", clrBlack, 10, "Arial");
w.Button("hideSlBtn", 0, 250, 400, 150, 30, "TURN ON", clrDarkBlue, clrWhite);

   
   if(hideSl == false)
   { 
   w.Delete("hideSl");
   w.Delete("hideSlBtn");
w.Label("hideSl", 0, 50, 600, "HIDE SL: OFF", clrBlack, 10, "Arial");
   w.Button("hideSlBtn", 0, 250, 600, 150, 30, "TURN ON", clrLightBlue, clrBlack);
   }
   else if(hideSl == true)
   {
   
   w.Delete("hideSl");
   w.Delete("hideSlBtn");
w.Label("hideSl", 0, 50, 600, "HIDE SL: ON", clrBlack, 10, "Arial");
   w.Button("hideSlBtn", 0, 250, 600, 150, 30, "TURN OFF", clrDarkBlue, clrWhite);
   }
w.Redraw();
}

void GUI::settingsPresetsPage(void)
{
w.Frame("topFrame", 0, 20, 150, 800, 220, accName + " " + serialN, 50, clrGray, clrWhite ,clrWhite);
w.Frame("midFrame", 0, 20, 300, 800, 300, "", 50, clrGray, clrWhite ,clrBlack);
w.Frame("bottomFrame", 0, 20, 600, 800, 100, "", 50, clrGray, clrWhite ,clrBlack);
w.Button("tradeScreenBtn", 0, 20, 200, 200, 30, "Trade", clrLightBlue, clrBlack);
w.Button("CloseScreenBtn", 0, 220, 200, 200, 30, "Close", clrLightBlue, clrBlack);
w.Button("SettingsScreenBtn", 0, 420, 200, 200, 30, "Settings", clrDarkBlue, clrWhite);
w.Button("InfoScreenBtn", 0, 620, 200, 200, 30, "Info", clrLightBlue, clrBlack);
w.Button("GeneralBtn", 0, 20, 270, 200, 30, "General", clrLightBlue, clrBlack);
w.Button("presetsBtn", 0, 220, 270, 200, 30, "Load Presets", clrDarkBlue, clrWhite);
w.Button("loadBtn", 0, 30, 630, 150, 50, "Load Presets", clrDarkBlue, clrWhite);
w.Redraw();
}

void GUI::changeToHomePage(void)
{

w.FrameDelete("topFrame");
w.FrameDelete("Frame1");
w.FrameDelete("Frame2");
w.FrameDelete("Frame3");
w.Delete("tradeScreenBtn");
w.Delete("CloseScreenBtn");
w.Delete("SettingsScreenBtn");
w.Delete("InfoScreenBtn");
w.Delete("GeneralBtn");
w.Delete("presetsBtn");
w.Delete("presets");
w.Delete("loadBtn");
w.Delete("stopLoss");
w.Delete("pipsSlEdit");
w.Delete("riskPerc");
w.Delete("riskPercEdit");
w.Delete("RR");
w.Delete("RRedit");
w.Delete("minLot");
w.Delete("riskAmount");
w.Delete("riskEdit");
w.Delete("saveBtn");
w.Delete("hideSl");
w.Delete("hideSlBtn");
w.Delete("breakeven");
w.Delete("breakevenBtn");
w.Delete("profitCount");
w.Delete("cutLoss");
w.Delete("profitLock");
w.Delete("Dprofit");
}

void GUI::changeToGeneralSettingsPage(void)
{
w.FrameDelete("topFrame");
w.FrameDelete("Frame1");
w.FrameDelete("Frame2");
w.FrameDelete("Frame3");
w.Delete("tradeScreenBtn");
w.Delete("CloseScreenBtn");
w.Delete("SettingsScreenBtn");
w.Delete("InfoScreenBtn");
w.Delete("GeneralBtn");
w.Delete("presetsBtn");
w.Delete("presets");
w.Delete("loadBtn");
w.Delete("stopLoss");
w.Delete("pipsSlEdit");
w.Delete("default");
w.Delete("defaultEdit");
w.Delete("RR");
w.Delete("RRedit");
w.Delete("minLot");
w.Delete("riskAmount");
w.Delete("riskEdit");
w.Delete("saveBtn");
w.Delete("hideSl");
w.Delete("hideSlBtn");
w.Delete("breakeven");
w.Delete("breakevenBtn");
w.Delete("spread");
w.Delete("reward");
w.Delete("risk");
w.Delete("amount");
w.Delete("amountEdit");
w.Delete("rewardEdit");
w.Delete("riskEdit");
w.Delete("CalcLotBtn");
w.Button("LinesBtn");
w.Delete("comment");
w.Delete("commentEdit");
w.Delete("LotDisplay");
w.Delete("entry");
w.Delete("entryEdit");
w.Delete("slEdit");
w.Delete("tpEdit");
w.Delete("PriceBtn");
w.Delete("sellBtn");
w.Delete("buyBtn");
w.Delete("closeSellBtn");
w.Delete("closeAllBtn");
w.Delete("closeBuyBtn");
w.Button("deleteOrdersBtn");
w.Button("closePercBtn");
w.Delete("percEdit");
w.Delete("breakevenBtn");
w.Delete("numTrades");
w.Delete("NumPositons");
w.Delete("rward");
w.Delete("rsk");
w.Delete("riskAm");
w.Delete("trailLabel");
w.Delete("trailEdit");
w.Delete("trailStop");
w.Delete("savePreset");
w.Delete("profitCount");
w.Delete("cutLoss");
w.Delete("profitLock");
w.Delete("Dprofit");
w.Delete("cutLossEdit");
w.Delete("profitLockEdit");
w.Delete("dProfitEdit");
w.Delete("lotsEdit");
w.Delete("slPrice");
w.Delete("slPriceEdit");
w.Delete("myMessage");


}

void GUI::showCalculations(string reward,string risk,string riskAmount, string lot)
{
Reward = reward;
Risk = risk;
amount = riskAmount;
lotsize = lot;
w.Delete("LotDisplay");
w.Label("LotDisplay", 0, 50, 240, "Lots: "+ lotsize, clrBlack, 10, "Arial");
}
void GUI::showCalculationsReward(string reward)
{
Reward = reward;
w.Delete("RRedit");
w.Edit("RRedit", 0, 250, 400, 50, 30, Reward, clrWhite, clrBlack);
}
void GUI::showCalculationsDefault(string def)
{
defaultB = def;
w.Delete("defaultEdit");
w.Edit("defaultEdit", 0, 365, 400, 50, 30, defaultB, clrWhite, clrBlack);
}
void GUI::showCalculationsAmount(string riskAmount)
{

amount = riskAmount;
w.Delete("riskEdit");
w.Edit("riskEdit", 0, 650, 400, 100, 30, amount, clrWhite, clrBlack);
}
void GUI::showCalculationsPips(string sl_pips)
{
pipsSL = string((int(sl_pips)) + int(spread));
w.Delete("pipsSlEdit");
w.Edit("pipsSlEdit", 0, 250, 330, 50, 30, pipsSL, clrWhite, clrBlack);
}

void GUI::breakEvenButton(bool switching)
{

isBreaking = switching;


}
void GUI::hideButton(bool hiding)
{

hideSl = hiding;
}

void GUI::linesButton(bool theLines)
{
lines = theLines;
}
void GUI::trailButton(bool tr)
{
trail = tr;
}

void GUI::showTrailAmount()
{
w.Label("trailLabel", 0, 50, 670, "Trail Amount (pips):", clrBlack, 10, "Arial");
w.Edit("trailEdit", 0, 300, 672, 100, 30, trailAm, clrWhite, clrBlack, 8, "Arial");
}

void GUI::editTrail(string trailEd)
{
trailAm = trailEd;
}
void GUI::setCutLoss(string cutLosses)
{
cutLoss = cutLosses;
}
void GUI::setProfitLock(string profitLock)
{
profit = profitLock;
}
void GUI::setDProfit(string dProfit)
{
d_profit = dProfit;
}

void GUI::updateProfit(string prof)
{

if(prof == "0")
{
w.Delete("profitCount");
w.Label("profitCount", 0, 50, 400, "Profit: $0", clrBlack, 10, "Arial");
}
else
{
w.Delete("profitCount");
w.Label("profitCount", 0, 50, 400, "Profit: $"+prof, clrBlack, 10, "Arial");
}

}

void GUI::setStop(string lossStop)
{
sl = lossStop;
w.Delete("slPrice");
w.Label("slPrice", 0, 230, 240, "SL: "+ lossStop, clrBlack, 10, "Arial");
}


void GUI::showBuy(int TP,int open,int stop_loss, int myX, string uprofit, string loss, string TPpips, string TPprice)
{
w.Delete("FrameTP");
w.Delete("FrameProfit");
w.Delete("FrameOpen");
w.Delete("switchButton");
w.Delete("FrameLoss");
w.Delete("FrameSL");
w.Delete("openLabel");
w.Delete("stopLabel");
w.Delete("profitLabel");
w.Frame("FrameTP", 0, myX + 70, TP-30, 320, 30, "", 0, clrGreen, clrGreen, clrWhite);
w.Label("profitLabel", 0, myX+ 80, TP-30, "TP "+TPpips+" | "+ uprofit + " USD | "+ TPprice, clrWhite, 7, "Arial");
w.Frame("FrameProfit", 0, myX+70, TP, 320, open - TP, "", 0, clrWhiteSmoke, clrNONE, clrBlack);
w.Frame("FrameOpen", 0, myX+70, open-30, 320, 30, "", 0, clrGreen, clrGreen, clrWhite);
w.Label("openLabel", 0, myX + 140, open - 30, "Buy | Lot "+lotsize+" | "+string(SymbolInfoDouble(_Symbol, SYMBOL_ASK)), clrWhite, 7, "Arial");
w.Button("switchButton", 0, myX +70  , open - 30, 50, 30, "R", clrGreen, clrWhite, 7, "Arial");
w.Frame("FrameLoss", 0, myX+70, open, 320, stop_loss - open, "", 0, clrLightGray, clrNONE, clrBlack);
w.Frame("FrameSL", 0, myX+70, stop_loss, 320, 30, "", 0, clrGreen, clrGreen, clrWhite);
w.Label("stopLabel", 0, myX+ 80, stop_loss, "SL "+pipsSL+" | "+ loss + " USD | "+ sl, clrWhite, 7, "Arial");
}

void GUI::showSell(int TP,int open,int stop_loss, int myX , string uprofit, string loss, string TPpips, string TPprice)
{
w.Delete("FrameTP");
w.Delete("FrameProfit");
w.Delete("FrameOpen");
w.Delete("switchButton");
w.Delete("FrameLoss");
w.Delete("FrameSL");
w.Delete("openLabel");
w.Delete("stopLabel");
w.Delete("profitLabel");
w.Frame("FrameTP", 0, myX+70, TP-30, 320, 30, "", 0, clrBlue, clrBlue, clrWhite);
w.Label("profitLabel", 0, myX+ 80, TP-30, "TP "+TPpips+" | "+ uprofit + " USD | "+ TPprice, clrWhite, 7, "Arial");
w.Frame("FrameProfit", 0, myX+70, open, 320, (TP - 30) - open, "", 0, clrWhiteSmoke, clrNONE, clrBlack);
w.Frame("FrameOpen", 0, myX+70, open-30, 320, 30, "", 0, clrBlue, clrBlue, clrWhite);
w.Label("openLabel", 0, myX + 140, open - 30, "Sell | Lot "+lotsize+" | "+string(SymbolInfoDouble(_Symbol, SYMBOL_BID)), clrWhite, 7, "Arial");
w.Button("switchButton", 0, myX+70 , open - 30, 50, 30, "R", clrBlue, clrWhite, 7, "Arial");
w.Frame("FrameLoss", 0, myX+70, stop_loss, 320, (open-30) - stop_loss, "", 0, clrLightGray, clrNONE, clrBlack);
w.Frame("FrameSL", 0, myX+70, stop_loss-30, 320, 30, "", 0, clrBlue, clrBlue, clrWhite);
w.Label("stopLabel", 0, myX+ 80, stop_loss-30,  "SL "+pipsSL+" | "+ loss + " USD | "+ sl, clrWhite, 7, "Arial");
}

void GUI::showMessageBox(string messageB)
{
w.Delete("myMessage");
w.Edit("myMessage", 0, 450, 390, 150, 50, messageB, clrWhite, clrBlack, 8, "Arial");
g.SetReadOnly(0, "myMessage", true);
}

void GUI::deleteSim(void)
{
w.FrameDelete("FrameTP");
w.FrameDelete("FrameProfit");
w.FrameDelete("FrameOpen");
w.Delete("switchButton");
w.FrameDelete("FrameLoss");
w.FrameDelete("FrameSL");
w.Delete("openLabel");
w.Delete("stopLabel");
w.Delete("profitLabel");
}
