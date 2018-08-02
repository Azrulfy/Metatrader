//+------------------------------------------------------------------+
//|                                KeltnerPullbackTraderSettings.mqh |
//|                                 Copyright © 2017, Matthew Kastor |
//|                                 https://github.com/matthewkastor |
//+------------------------------------------------------------------+
#property copyright "Matthew Kastor"
#property link      "https://github.com/matthewkastor"
#property strict

input int KeltnerPullbackMaPeriod=30;
input int KeltnerPullbackMaShift=0;
input ENUM_MA_METHOD KeltnerPullbackMaMethod=MODE_EMA;
input ENUM_APPLIED_PRICE KeltnerPullbackMaAppliedPrice=PRICE_TYPICAL;
input color KeltnerPullbackMaColor=clrHotPink;

input int KeltnerPullbackAtrPeriod=30;
input double AtrSkew=0; // Atr Skew
input double KeltnerPullbackAtrMultiplier=3;
input color KeltnerPullbackAtrColor=clrAquamarine;
input int KeltnerPullbackShift=0;

input double KeltnerPullbackMinimumTpSlDistance=5; // Tp/Sl minimum distance, in spreads.
input int KeltnerPullbackParallelSignals=2; // Quantity of parallel signals to use.
#include <EA\PortfolioManagerBasedBot\BasicSettings.mqh>
