//+------------------------------------------------------------------+
//|                                                    Rectangle.mqh |
//|                                 Copyright © 2017, Matthew Kastor |
//|                                 https://github.com/matthewkastor |
//+------------------------------------------------------------------+
#property copyright "Matthew Kastor"
#property link      "https://github.com/matthewkastor"
#property strict

#include <SpatialReasoning\RightTriangle.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct Rectangle : public RightTriangle
  {
public:
   CoordinatePoint   D;

   void Set(CoordinatePoint &a,CoordinatePoint &c)
     {
      RightTriangle::Set(a,c);
      this.D.Set(this.A.X.Get(),this.C.Y.Get());
     }

   void Rectangle():RightTriangle()
     {
     }

   void Rectangle(CoordinatePoint &a,CoordinatePoint &c):RightTriangle(a,c)
     {
      this.Set(a,c);
     }

   CoordinatePoint GetCenter()
     {
      double x=this.GetWidth()/2;
      double y=this.GetHeight()/2;
      if(this.A.X.Get()<this.C.X.Get())
      {
         x=this.A.X.Get()+x;
      }
      else
      {
         x=this.A.X.Get()-x;
      }
      if(this.A.Y.Get()<this.C.Y.Get())
      {
         y=this.A.Y.Get()+y;
      }
      else
      {
         y=this.A.Y.Get()-y;
      }
      CoordinatePoint c(x,y);
      return c;
     }
  };
//+------------------------------------------------------------------+
