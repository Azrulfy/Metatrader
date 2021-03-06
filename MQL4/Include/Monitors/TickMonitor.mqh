//+------------------------------------------------------------------+
//|                                                  TickMonitor.mqh |
//|                                 Copyright © 2017, Matthew Kastor |
//|                                 https://github.com/matthewkastor |
//+------------------------------------------------------------------+
#property copyright "Matthew Kastor"
#property link      "https://github.com/matthewkastor"
#property strict

#include <Common\CsvFileWriter.mqh>
#include <MarketWatch\MarketWatch.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class TickMonitor : private CsvFileWriter
  {
public:

   void TickMonitor(string fileName="Ticks.csv",bool appendReport=true):CsvFileWriter(fileName,appendReport)
     {
      string columnNames[]=
        {
         "Date"
            ,"Time"
            ,"Symbol"
            ,"Ask"
            ,"Bid"
            ,"Volume"
            ,"Last Deal Price"
            ,"Flag"
            ,"Timestamp"
            ,"Timestamp Milliseconds"
        };
      this.SetColumnNames(columnNames);
     };

   bool RecordData(string symbol)
     {
      MqlTick tick;
      if(MarketWatch::GetTick(symbol,tick))
        {
         this.SetPendingDataItem("Date",StringFormat("%i/%i/%i",Year(),Month(),Day()));
         this.SetPendingDataItem("Time",StringFormat("%i:%i:%i",Hour(),Minute(),Seconds()));
         this.SetPendingDataItem("Symbol",symbol);
         this.SetPendingDataItem("Ask",(string)tick.ask);
         this.SetPendingDataItem("Bid",(string)tick.bid);
         this.SetPendingDataItem("Volume",(string)tick.volume);
         this.SetPendingDataItem("Last Deal Price",(string)tick.last);
         this.SetPendingDataItem("Flag",MarketWatch::GetTickFlagDescription(tick.flags));
         this.SetPendingDataItem("Timestamp",(string)tick.time);
         this.SetPendingDataItem("Timestamp Milliseconds",(string)tick.time_msc);
         return (this.WritePendingDataRow()>0);
        }
      return false;
     };
  };
//+------------------------------------------------------------------+
