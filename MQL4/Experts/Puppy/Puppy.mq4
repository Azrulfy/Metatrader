//+------------------------------------------------------------------+
//|                                                        Puppy.mq4 |
//|                                 Copyright © 2017, Matthew Kastor |
//|                                 https://github.com/matthewkastor |
//+------------------------------------------------------------------+
#property copyright "Matthew Kastor"
#property link      "https://github.com/matthewkastor"
#property description "Does Magic."
#property strict

#include <EA\Puppy\Puppy.mqh>
#include <EA\Puppy\PuppySettings.mqh>
#include <EA\Puppy\PuppyConfig.mqh>

Puppy *bot;
#include <EA\PortfolioManagerBasedBot\BasicEATemplate.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void init()
  {
   PuppyConfig config;

   GetBasicConfigs(config);

   config.lcfpPeriod=LcfpPeriod;
   config.lcfpTimeframe=PortfolioTimeframe;
   config.lcfpMinimumTpSlDistance=LcfpMinimumTpSlDistance;
   config.lcfpInvertedSignal=LcfpInvertedSignal;
   config.lcfpSkew=LcfpSkew;
   
   bot=new Puppy(config);
  }
//+------------------------------------------------------------------+
