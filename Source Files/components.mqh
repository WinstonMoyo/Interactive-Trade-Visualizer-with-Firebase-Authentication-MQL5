//+------------------------------------------------------------------+
//|                                                   components.mqh |
//|                        Copyright 2022, MetaQuotes Software Corp. |
//|                                             https://www.mql4.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Software Corp."
#property link      "https://www.mql4.com"
#property version   "1.00"
#property strict
class components
  {
private:
ulong ticket;
double sl;
double tp;
string entry;
double open;
double trailPrice;

public:
                     components();
                    ~components();
                    ulong getticket();
double getsl();
double gettp();
string getentry();
double getopen();
double gettrailPrice();
void setticket(ulong tick);
void setsl(double SL);
void settp(double TP);
void setentry(string entry);
void setopen(double op);
void settrailPrice(double trail);
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
components::components()
  {
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
components::~components()
  {
  }
//+------------------------------------------------------------------+
ulong components::getticket(void)
{
return ticket;
}

string components::getentry(void)
{
return entry;
}

double components::gettp(void)
{
return tp;
}

double components::getsl(void)
{
return sl;
}

double components::gettrailPrice(void)
{
return trailPrice;
}

double components::getopen(void)
{
return open;
}
void components::setentry(string en)
{
entry = en;
}
void components::setopen(double op)
{
open = op;
}
void components::setsl(double SL)
{
sl = SL;
}
void components::settp(double TP)
{
tp = TP;
}
void components::settrailPrice(double trail)
{
trailPrice = trail;
}
void components::setticket(ulong tick)
{
ticket = tick;
}


