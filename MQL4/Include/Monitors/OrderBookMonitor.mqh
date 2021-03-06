//+------------------------------------------------------------------+
//|                                             OrderBookMonitor.mqh |
//|                                 Copyright © 2017, Matthew Kastor |
//|                                 https://github.com/matthewkastor |
//+------------------------------------------------------------------+
#property copyright "Matthew Kastor"
#property link      "https://github.com/matthewkastor"
#property strict

#include <Common\CsvFileWriter.mqh>
#include <Common\OrderManager.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class OrderBookMonitor : private CsvFileWriter
  {
private:
   bool              _monitorActiveTickets;
   int               _activeTicketDepth;
   bool              _monitorHistoricTickets;
   int               _historicTicketDepth;
   bool              _snapshotMode;
   string            _columnNames[];

   bool ResetFile()
     {
      this.Open(this.FileName(),false);
      return this.SetColumnNames(this._columnNames);
     };

   bool RecordData(Order &orders[])
     {
      if(!this.IsFileHandleValid())
        {
         return false;
        }
      bool out=true;
      int ct=ArraySize(orders);
      for(int i=0;i<ct;i++)
        {
         string orderType=EnumToString(orders[i].orderType);
         StringReplace(orderType,"ORDER_TYPE_","");
         this.SetPendingDataItem("Date",StringFormat("%i/%i/%i",Year(),Month(),Day()));
         this.SetPendingDataItem("Time",StringFormat("%i:%i:%i",Hour(),Minute(),Seconds()));
         this.SetPendingDataItem("Ticket ID",(string)orders[i].ticketID);
         this.SetPendingDataItem("Order Open Date",StringFormat("%i/%i/%i",TimeYear(orders[i].openTime),TimeMonth(orders[i].openTime),TimeDay(orders[i].openTime)));
         this.SetPendingDataItem("Order Open Time",StringFormat("%i:%i:%i",TimeHour(orders[i].openTime),TimeMinute(orders[i].openTime),TimeSeconds(orders[i].openTime)));
         this.SetPendingDataItem("Type",orderType);
         this.SetPendingDataItem("Size",(string)orders[i].lotSize);
         this.SetPendingDataItem("Symbol",orders[i].symbol);
         this.SetPendingDataItem("Order Price",(string)orders[i].openPrice);
         this.SetPendingDataItem("Stop Loss",(string)orders[i].stopLoss);
         this.SetPendingDataItem("Take Profit",(string)orders[i].takeProfit);
         this.SetPendingDataItem("Commission",(string)orders[i].commission);
         this.SetPendingDataItem("Swap",(string)orders[i].swap);
         this.SetPendingDataItem("Profit",(string)orders[i].profit);
         this.SetPendingDataItem("Comment",orders[i].comment);
         this.SetPendingDataItem("Order Expiration Date",StringFormat("%i/%i/%i",TimeYear(orders[i].expiration),TimeMonth(orders[i].expiration),TimeDay(orders[i].expiration)));
         this.SetPendingDataItem("Order Expiration Time",StringFormat("%i:%i:%i",TimeHour(orders[i].expiration),TimeMinute(orders[i].expiration),TimeSeconds(orders[i].expiration)));
         this.SetPendingDataItem("Order Close Price",(string)orders[i].closePrice);
         this.SetPendingDataItem("Order Close Date",StringFormat("%i/%i/%i",TimeYear(orders[i].closeTime),TimeMonth(orders[i].closeTime),TimeDay(orders[i].closeTime)));
         this.SetPendingDataItem("Order Close Time",StringFormat("%i:%i:%i",TimeHour(orders[i].closeTime),TimeMinute(orders[i].closeTime),TimeSeconds(orders[i].closeTime)));
         this.SetPendingDataItem("Order Magic Number",(string)orders[i].magicNumber);
         out=out && (this.WritePendingDataRow()>0);
        }
      return out;
     };

public:

   void OrderBookMonitor(string fileName="OrderBook.csv",bool appendExistingReport=false,bool monitorActiveTickets=true,int activeTicketDepth=1000,bool monitorHistoricTickets=false,int historicTicketDepth=1000,bool snapshotMode=false):CsvFileWriter(fileName,appendExistingReport)
     {
      this._monitorActiveTickets=monitorActiveTickets;
      this._activeTicketDepth=activeTicketDepth;
      this._monitorHistoricTickets=monitorHistoricTickets;
      this._historicTicketDepth=historicTicketDepth;
      this._snapshotMode=snapshotMode;
      string columns[]=
        {
         "Date"
            ,"Time"
            ,"Ticket ID"
            ,"Order Open Date"
            ,"Order Open Time"
            ,"Type"
            ,"Size"
            ,"Symbol"
            ,"Order Price"
            ,"Stop Loss"
            ,"Take Profit"
            ,"Commission"
            ,"Swap"
            ,"Profit"
            ,"Comment"
            ,"Order Expiration Date"
            ,"Order Expiration Time"
            ,"Order Close Price"
            ,"Order Close Date"
            ,"Order Close Time"
            ,"Order Magic Number"
        };
      ArrayCopy(this._columnNames,columns);
      this.SetColumnNames(this._columnNames);
     };

   bool RecordData()
     {
      if(!this.IsFileHandleValid())
        {
         return false;
        }
      bool out=true;
      if(!this._snapshotMode)
        {
         if(!this.ResetFile())
           {
            return false;
           }
        }
      Order current[];
      Order historic[];

      if(this._monitorActiveTickets && this._activeTicketDepth>0)
        {
         OrderManager::GetOrdersArray(current,NULL,this._activeTicketDepth);
         out=out && RecordData(current);
        }

      if(this._monitorHistoricTickets && this._historicTicketDepth>0)
        {
         OrderManager::GetClosedOrdersArray(historic,NULL,this._historicTicketDepth);
         out=out && RecordData(historic);
        }

      return out;
     };
  };
//+------------------------------------------------------------------+
