//+------------------------------------------------------------------+
//|                              RT_MA_Pullback_StrategySettings.mqh |
//|                                 Copyright © 2017, Matthew Kastor |
//|                                 https://github.com/matthewkastor |
//+------------------------------------------------------------------+
#property copyright "Matthew Kastor"
#property link      "https://github.com/matthewkastor"
#property strict

sinput string RT_MA_Pullback_StrategySettings1; // ####
sinput string RT_MA_Pullback_StrategySettings2; // #### Signal Settings
sinput string RT_MA_Pullback_StrategySettings3; // ####

input int MAPeriod=120; // Period of directional bias MA. (slow)
input color MAColor=clrHotPink; // Color of directional bias indcator.
input int MAPullbackPeriod=40; // Period of Area of Value MA. (fast)
input int MAPullbackTests=3; // How many times should price test the Area of Value?
input color MAPullbackColor=clrTurquoise; // Color of Area of Value MA.
input int MAThresholdPeriod=50; // Period of Area of Value MA lower boundary. (medium)
input color MAThresholdColor=clrRed; // Color of Area of Value MA lower boundary.
input double MinimumTpSlDistance=3; // Tp/Sl minimum distance, in spreads.
input int ExitsByHighLowPeriod=60; // Period for set exits by high and low. (Trend trader mode = false).
input color ExitSignalColor=clrGoldenrod; // Color of the exit signal indicator.
input bool FollowTrend=false; // Enable trend trader mode?
input int FollowTrendTrailingStopPeriod=60; // Period for trend follower trailing stop.
input bool InitializeTrailingStopTo1Atr=true; // Set initial trend follower trailing stop to 1 Atr away.

#include <EA\PortfolioManagerBasedBot\BasicSettings.mqh>
//+------------------------------------------------------------------+
