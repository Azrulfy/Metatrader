//+------------------------------------------------------------------+
//|                                              BasicEATemplate.mqh |
//|                                 Copyright © 2017, Matthew Kastor |
//|                                 https://github.com/matthewkastor |
//+------------------------------------------------------------------+
#property copyright "Matthew Kastor"
#property link      "https://github.com/matthewkastor"
#property strict

#include <EA\PortfolioManagerBasedBot\BasePortfolioManagerBotConfig.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void GetBasicConfigs(BasePortfolioManagerBotConfig &config)
  {
   config.watchedSymbols=WatchedSymbols;
   config.lots=Lots;
   config.profitTarget=ProfitTarget;
   config.maxLoss=MaxLoss;
   config.slippage=Slippage;
   config.startDay=Start_Day;
   config.endDay=End_Day;
   config.startTime=Start_Time;
   config.endTime=End_Time;
   config.scheduleIsDaily=ScheduleIsDaily;
   config.tradeAtBarOpenOnly=TradeAtBarOpenOnly;
   config.pinExits=PinExits;
   config.switchDirectionBySignal=SwitchDirectionBySignal;

   config.backtestConfig.InitialScore=InitialScore;
   config.backtestConfig.GainsStdDevLimitMin=GainsStdDevLimitMin;
   config.backtestConfig.GainsStdDevLimitMax=GainsStdDevLimitMax;
   config.backtestConfig.LossesStdDevLimitMin=LossesStdDevLimitMin;
   config.backtestConfig.LossesStdDevLimitMax=LossesStdDevLimitMax;
   config.backtestConfig.NetProfitRangeMin=NetProfitRangeMin;
   config.backtestConfig.NetProfitRangeMax=NetProfitRangeMax;
   config.backtestConfig.ExpectancyRangeMin=ExpectancyRangeMin;
   config.backtestConfig.ExpectancyRangeMax=ExpectancyRangeMax;
   config.backtestConfig.TradesPerDayRangeMin=TradesPerDayRangeMin;
   config.backtestConfig.TradesPerDayRangeMax=TradesPerDayRangeMax;
   config.backtestConfig.LargestLossPerTotalGainLimit=LargestLossPerTotalGainLimit;
   config.backtestConfig.MedianLossPerMedianGainPercentLimit=MedianLossPerMedianGainPercentLimit;

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void deinit()
  {
   delete bot;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTick()
  {
   bot.Execute();
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double OnTester()
  {
   return bot.CustomTestResult();
  }
//+------------------------------------------------------------------+
