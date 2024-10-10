//+------------------------------------------------------------------+
//|                                                       IncGUI.mqh |
//|                                                          Integer |
//|                          https://login.mql5.com/en/users/Integer |
//+------------------------------------------------------------------+
#property copyright "Integer"
#property link      "https://login.mql5.com/en/users/Integer"
#property version   "2.00"

/*
   What's new in v2:
   
      In CGraphicObjectShell:
         Fixed a typo in method names ...Distance() (was ...Distanse())
         New methods: SetXYDistance(), SetXYSize().
   
      In CInputBox:
         Fixed a typo in method name ValueString() (was ValueStrind)).
         New methods: SetReadOnly(), ReadOnly().
   
      CColorSchemes:
      
         Order changed in Show() method. Now schemes are placed vertically, colors horizontally.
         New color schemes: 
                                    GreenScheme,
                                    YellowBlackScheme,
                                    LimeBlackScheme,
                                    AquaBlackScheme.
      
      Control classes added:
      
            CSpinInputBox (input fields with buttons +/-),
            CCheckBox (checkbox),
            CRadioGroup (a group of radio buttons),
            CVScrollBar (vertical scroll bar),
            CHScrollBar (horizontal scroll bar),
            CList (list),
            CListMS (a list with multiple selection),
            CComBox (dropdown list),
            CHMenu (horizontal menu),
            CVMenu (vertical menu),
            CHProgress (horizontal progress bar),
            CDialer (dialer),
            CDialerInputBox (dialer input box),
            CTable (a table).
*/      

/*
   Location of classes in the file:
   
   1 Class CGraphicObjectShell.
   2. Declaration of the CGraphicObjectShell class named "g".
   3. Class CWorkPiece.
   4. Declaration of the CWorkPiece class named "w".
   5. Class CColorSchemes.
   6. Declaration of the CColorSchemes class named "ClrScheme".
   7. Control classes.  
      7.01. Class CInputBox (input box).
      7.02. Class CSpinInputBox (input box with buttons +/-). 
      7.03. Class CCheckBox (checkbox). 
      7.04. Class CRadioGroup (a group of radio buttons). 
      7.05. Class CVScrollBar (vertical scroll bar).  
      7.06. Class CHScrollBar (horizontal scroll bar).    
      7.07. Class CList (list). 
      7.08. Class CListMS (list with multiple selection).  
      7.09. Class CComBox (drop down list).  
      7.10. Class CHMenu (horizontal menu). 
      7.11. Class CVMenu (vertical menu). 
      7.12. Class CHProgress (horizontal progress bar). 
      7.13. Class CDialer (dialer). 
      7.14. Class CDialerInputBox (dialer input box).  
      7.15. Class CTable (a table).       
*/

//+------------------------------------------------------------------+
//|                                                                  |
//|         CLASS CGraphicObjectShell                                |
//|                                                                  |
//+------------------------------------------------------------------+

/*!
	\brief   Creating graphical objects, managing graphical objects.
	
	\details The class contains methods for creating graphical objects, methods for setting and 
	         getting their properties, and other methods related to graphical objects.
	         
	         Methods for creating graphical objects begin with the word "Create", all 
	         these methods have three parameters: name, subwindow, chart. 
	         
	         Methods for setting properties begin with the word "Set". Methods for setting and receiving 
	         properties are presented in three ways: 1) with no parameters, 2) with a single parameter 
	         (object name), 3) with two parameters (name, chart).
	         
	         Option 1 is used for a graphic object attached to a class. 
	         A graphic object is attached to a class when you create it using any of the 
	         Create...() methods or using the Attach() method. Option 2 is intended for 
	         working with graphic objects located on "its own" chart, option 3 - with 
	         objects on any chart.
	         
   \remark	The class has been already declared in a file named "g".
*/

class CGraphicObjectShell{
   protected:
      string m_name;
      long m_id;
   public:   
      /*
         The order of the methods:
      
         1 Main methods.
         2. Create.
         
         3. Get properties for an attached object.
         4. Set properties to an attached object.
         
         5. Get properties by object name.
         6. Set properties by object name.
         
         7. Get properties by chart ID and object name.
         8. Set properties by chart ID and object name.
         
         9. Other methods.
      */
      
      //+------------------------------------------------------------------+
      //|   Main                                                           |
      //+------------------------------------------------------------------+
   
		/*!	
			Attach a graphical object.
		 	\param		string aName - the name the attached object,
		 	\param		long aChartID=0 - ID of the chart on which the graphical object is located.
		*/
      void Attach(string aName,long aChartID=0){
         m_name=aName;
         m_id=aChartID;
      }
      
		/*!	
			Get the name of the attached object.
         \return  The name of the attached object.
		*/		
      string Name(){return(m_name);}   
      
		/*!	
			Get the chart ID of the attached object.
         \return  Chart ID of the graphical object.
		*/      
      long ChartID(){return(m_id);}
      
      //+------------------------------------------------------------------+
      //|   Create                                                         |
      //+------------------------------------------------------------------+      
		
		/*!	
			Create the Vertical Line object OBJ_VLINE.
		 	\param		string aName - the name of the object,
		 	\param		int aSubWindow=0 - the subwindow where the object is created,
		 	\param		long aChartID=0 - ID of the chart on which the object is created.			
		*/  
      void CreateVLine           (string aName,int aSubWindow=0,long aChartID=0){ObjectCreate(aChartID,aName,OBJ_VLINE,             aSubWindow,0,0);Attach(aName,aChartID);}
		
		/*!	
			Create the Horizontal Line object OBJ_HLINE.
		 	\param		string aName - the name of the object,
		 	\param		int aSubWindow=0 - the subwindow where the object is created,
		 	\param		long aChartID=0 - ID of the chart on which the object is created.			
		*/        
      void CreateHLine           (string aName,int aSubWindow=0,long aChartID=0){ObjectCreate(aChartID,aName,OBJ_HLINE,             aSubWindow,0,0);Attach(aName,aChartID);}

		/*!	
			Create the Trendline object OBJ_TREND.
		 	\param		string aName - the name of the object,
		 	\param		int aSubWindow=0 - the subwindow where the object is created,
		 	\param		long aChartID=0 - ID of the chart on which the object is created.			
		*/       
      void CreateTrend           (string aName,int aSubWindow=0,long aChartID=0){ObjectCreate(aChartID,aName,OBJ_TREND,             aSubWindow,0,0);Attach(aName,aChartID);}

		/*!	
			Create the Trendline by Angle object OBJ_TRENDBYANGLE.
		 	\param		string aName - the name of the object,
		 	\param		int aSubWindow=0 - the subwindow where the object is created,
		 	\param		long aChartID=0 - ID of the chart on which the object is created.			
		*/           
      void CreateTrendByAngle    (string aName,int aSubWindow=0,long aChartID=0){ObjectCreate(aChartID,aName,OBJ_TRENDBYANGLE,      aSubWindow,0,0);Attach(aName,aChartID);}

		/*!	
			Create the Equidistant Channel object OBJ_CHANNEL.
		 	\param		string aName - the name of the object,
		 	\param		int aSubWindow=0 - the subwindow where the object is created,
		 	\param		long aChartID=0 - ID of the chart on which the object is created.			
		*/        
      void CreateChannel         (string aName,int aSubWindow=0,long aChartID=0){ObjectCreate(aChartID,aName,OBJ_CHANNEL,           aSubWindow,0,0);Attach(aName,aChartID);}
		
		/*!	
			Create the Standard Deviation Channel object OBJ_STDDEVCHANNEL.
		 	\param		string aName - the name of the object,
		 	\param		int aSubWindow=0 - the subwindow where the object is created,
		 	\param		long aChartID=0 - ID of the chart on which the object is created.			
		*/        
      void CreateStdDevChannel   (string aName,int aSubWindow=0,long aChartID=0){ObjectCreate(aChartID,aName,OBJ_STDDEVCHANNEL,     aSubWindow,0,0);Attach(aName,aChartID);}
		
		/*!	
			Create the Linear Regression Channel object OBJ_REGRESSION.
		 	\param		string aName - the name of the object,
		 	\param		int aSubWindow=0 - the subwindow where the object is created,
		 	\param		long aChartID=0 - ID of the chart on which the object is created.			
		*/        
      void CreateRegresion       (string aName,int aSubWindow=0,long aChartID=0){ObjectCreate(aChartID,aName,OBJ_REGRESSION,        aSubWindow,0,0);Attach(aName,aChartID);}
		
		/*!	
			Create the Andrew's Pitchfork object  OBJ_PITCHFORK.
		 	\param		string aName - the name of the object,
		 	\param		int aSubWindow=0 - the subwindow where the object is created,
		 	\param		long aChartID=0 - ID of the chart on which the object is created.			
		*/  
      void CreatePitchFork       (string aName,int aSubWindow=0,long aChartID=0){ObjectCreate(aChartID,aName,OBJ_PITCHFORK,         aSubWindow,0,0);Attach(aName,aChartID);}
		
		/*!	
			Create the Gann Line object OBJ_GANNLINE.
		 	\param		string aName - the name of the object,
		 	\param		int aSubWindow=0 - the subwindow where the object is created,
		 	\param		long aChartID=0 - ID of the chart on which the object is created.			
		*/  
      void CreateGannLine        (string aName,int aSubWindow=0,long aChartID=0){ObjectCreate(aChartID,aName,OBJ_GANNLINE,          aSubWindow,0,0);Attach(aName,aChartID);}
		
		/*!	
			Create the Gann fan object OBJ_GANNFAN.
		 	\param		string aName - the name of the object,
		 	\param		int aSubWindow=0 - the subwindow where the object is created,
		 	\param		long aChartID=0 - ID of the chart on which the object is created.			
		*/  
      void CreateGannFan         (string aName,int aSubWindow=0,long aChartID=0){ObjectCreate(aChartID,aName,OBJ_GANNFAN,           aSubWindow,0,0);Attach(aName,aChartID);}
		
		/*!	
			Create the Gann Grid object  OBJ_GANNGRID.
		 	\param		string aName - the name of the object,
		 	\param		int aSubWindow=0 - the subwindow where the object is created,
		 	\param		long aChartID=0 - ID of the chart on which the object is created.			
		*/  
      void CreateGannGrid        (string aName,int aSubWindow=0,long aChartID=0){ObjectCreate(aChartID,aName,OBJ_GANNGRID,          aSubWindow,0,0);Attach(aName,aChartID);}
		
		/*!	
			Create the Fibonacci Levels object OBJ_FIBO.
		 	\param		string aName - the name of the object,
		 	\param		int aSubWindow=0 - the subwindow where the object is created,
		 	\param		long aChartID=0 - ID of the chart on which the object is created.			
		*/  
      void CreateFibo            (string aName,int aSubWindow=0,long aChartID=0){ObjectCreate(aChartID,aName,OBJ_FIBO,              aSubWindow,0,0);Attach(aName,aChartID);}
		
		/*!	
			Create the Fibonacci Time Zones object OBJ_FIBOTIMES.
		 	\param		string aName - the name of the object,
		 	\param		int aSubWindow=0 - the subwindow where the object is created,
		 	\param		long aChartID=0 - ID of the chart on which the object is created.			
		*/  
      void CreateFiboTimes       (string aName,int aSubWindow=0,long aChartID=0){ObjectCreate(aChartID,aName,OBJ_FIBOTIMES,         aSubWindow,0,0);Attach(aName,aChartID);}
		
		/*!	
			Create the Fibonacci Fan object OBJ_FIBOFAN.
		 	\param		string aName - the name of the object,
		 	\param		int aSubWindow=0 - the subwindow where the object is created,
		 	\param		long aChartID=0 - ID of the chart on which the object is created.			
		*/  
      void CreateFiboFan         (string aName,int aSubWindow=0,long aChartID=0){ObjectCreate(aChartID,aName,OBJ_FIBOFAN,           aSubWindow,0,0);Attach(aName,aChartID);}
		
		/*!	
			Create the Fibonacci Arcs object OBJ_FIBOARC.
		 	\param		string aName - the name of the object,
		 	\param		int aSubWindow=0 - the subwindow where the object is created,
		 	\param		long aChartID=0 - ID of the chart on which the object is created.			
		*/  
      void CreateFiboArc         (string aName,int aSubWindow=0,long aChartID=0){ObjectCreate(aChartID,aName,OBJ_FIBOARC,           aSubWindow,0,0);Attach(aName,aChartID);}
		
		/*!	
			Create the Fibonacci Chanel object OBJ_FIBOCHANNEL.
		 	\param		string aName - the name of the object,
		 	\param		int aSubWindow=0 - the subwindow where the object is created,
		 	\param		long aChartID=0 - ID of the chart on which the object is created.			
		*/  
      void CreateFiboChannel     (string aName,int aSubWindow=0,long aChartID=0){ObjectCreate(aChartID,aName,OBJ_FIBOCHANNEL,       aSubWindow,0,0);Attach(aName,aChartID);}
		
		/*!	
			Create the Fibonacci Expansion object OBJ_EXPANSION.
		 	\param		string aName - the name of the object,
		 	\param		int aSubWindow=0 - the subwindow where the object is created,
		 	\param		long aChartID=0 - ID of the chart on which the object is created.			
		*/  
      void CreateExpansion       (string aName,int aSubWindow=0,long aChartID=0){ObjectCreate(aChartID,aName,OBJ_EXPANSION,         aSubWindow,0,0);Attach(aName,aChartID);}	
		
		/*!	
			Create the 5 Elliot Waves object OBJ_ELLIOTWAVE5.
		 	\param		string aName - the name of the object,
		 	\param		int aSubWindow=0 - the subwindow where the object is created,
		 	\param		long aChartID=0 - ID of the chart on which the object is created.			
		*/  
      void CreateElliotWave5     (string aName,int aSubWindow=0,long aChartID=0){ObjectCreate(aChartID,aName,OBJ_ELLIOTWAVE5,       aSubWindow,0,0);Attach(aName,aChartID);}
		
		/*!	
			Create the 3 Elliot Waves object OBJ_ELLIOTWAVE3.
		 	\param		string aName - the name of the object,
		 	\param		int aSubWindow=0 - the subwindow where the object is created,
		 	\param		long aChartID=0 - ID of the chart on which the object is created.			
		*/  
      void CreateElliotWave3     (string aName,int aSubWindow=0,long aChartID=0){ObjectCreate(aChartID,aName,OBJ_ELLIOTWAVE3,       aSubWindow,0,0);Attach(aName,aChartID);}
		
		/*!	
			Create the Rectangle object OBJ_RECTANGLE.
		 	\param		string aName - the name of the object,
		 	\param		int aSubWindow=0 - the subwindow where the object is created,
		 	\param		long aChartID=0 - ID of the chart on which the object is created.			
		*/  
      void CreateRectangle       (string aName,int aSubWindow=0,long aChartID=0){ObjectCreate(aChartID,aName,OBJ_RECTANGLE,         aSubWindow,0,0);Attach(aName,aChartID);}
		
		/*!	
			Create the Triangle object OBJ_TRIANGLE.
		 	\param		string aName - the name of the object,
		 	\param		int aSubWindow=0 - the subwindow where the object is created,
		 	\param		long aChartID=0 - ID of the chart on which the object is created.			
		*/  
      void CreateTriangle        (string aName,int aSubWindow=0,long aChartID=0){ObjectCreate(aChartID,aName,OBJ_TRIANGLE,          aSubWindow,0,0);Attach(aName,aChartID);}
		
		/*!	
			Create the Ellipse object OBJ_ELLIPSE.
		 	\param		string aName - the name of the object,
		 	\param		int aSubWindow=0 - the subwindow where the object is created,
		 	\param		long aChartID=0 - ID of the chart on which the object is created.			
		*/  
      void CreateEllipse         (string aName,int aSubWindow=0,long aChartID=0){ObjectCreate(aChartID,aName,OBJ_ELLIPSE,           aSubWindow,0,0);Attach(aName,aChartID);}
		
		/*!	
			Create the Cycle lines object OBJ_CYCLES.
		 	\param		string aName - the name of the object,
		 	\param		int aSubWindow=0 - the subwindow where the object is created,
		 	\param		long aChartID=0 - ID of the chart on which the object is created.			
		*/  
      void CreateCycles          (string aName,int aSubWindow=0,long aChartID=0){ObjectCreate(aChartID,aName,OBJ_CYCLES,            aSubWindow,0,0);Attach(aName,aChartID);}
		
		/*!	
			Create the Thumè Up object OBJ_ARROW_THUMB_UP.
		 	\param		string aName - the name of the object,
		 	\param		int aSubWindow=0 - the subwindow where the object is created,
		 	\param		long aChartID=0 - ID of the chart on which the object is created.			
		*/  
      void CreateThumbUp         (string aName,int aSubWindow=0,long aChartID=0){ObjectCreate(aChartID,aName,OBJ_ARROW_THUMB_UP,    aSubWindow,0,0);Attach(aName,aChartID);}
		
		/*!	
			Create the Thumb Down object OBJ_ARROW_THUMB_DOWN.
		 	\param		string aName - the name of the object,
		 	\param		int aSubWindow=0 - the subwindow where the object is created,
		 	\param		long aChartID=0 - ID of the chart on which the object is created.			
		*/  
      void CreateTumbDn          (string aName,int aSubWindow=0,long aChartID=0){ObjectCreate(aChartID,aName,OBJ_ARROW_THUMB_DOWN,  aSubWindow,0,0);Attach(aName,aChartID);}
		
		/*!	
			Create the Up Arrow object OBJ_ARROW_UP.
		 	\param		string aName - the name of the object,
		 	\param		int aSubWindow=0 - the subwindow where the object is created,
		 	\param		long aChartID=0 - ID of the chart on which the object is created.			
		*/  
      void CreateArrowUp         (string aName,int aSubWindow=0,long aChartID=0){ObjectCreate(aChartID,aName,OBJ_ARROW_UP,          aSubWindow,0,0);Attach(aName,aChartID);}
		
		/*!	
			Create the Down Arrow object OBJ_ARROW_DOWN.
		 	\param		string aName - the name of the object,
		 	\param		int aSubWindow=0 - the subwindow where the object is created,
		 	\param		long aChartID=0 - ID of the chart on which the object is created.			
		*/  
      void CreateArrowDn         (string aName,int aSubWindow=0,long aChartID=0){ObjectCreate(aChartID,aName,OBJ_ARROW_DOWN,        aSubWindow,0,0);Attach(aName,aChartID);}
		
		/*!	
			Create the Stop sign OBJ_ARROW_STOP.
		 	\param		string aName - the name of the object,
		 	\param		int aSubWindow=0 - the subwindow where the object is created,
		 	\param		long aChartID=0 - ID of the chart on which the object is created.			
		*/  
      void CreateArrowStop       (string aName,int aSubWindow=0,long aChartID=0){ObjectCreate(aChartID,aName,OBJ_ARROW_STOP,        aSubWindow,0,0);Attach(aName,aChartID);}
		
		/*!	
			Create the Check Mark OBJ_ARROW_CHECK.
		 	\param		string aName - the name of the object,
		 	\param		int aSubWindow=0 - the subwindow where the object is created,
		 	\param		long aChartID=0 - ID of the chart on which the object is created.			
		*/  
      void CreateArrowCheck      (string aName,int aSubWindow=0,long aChartID=0){ObjectCreate(aChartID,aName,OBJ_ARROW_CHECK,       aSubWindow,0,0);Attach(aName,aChartID);}
		
		/*!	
			Create the Left Price Tag object OBJ_ARROW_LEFT_PRICE.
		 	\param		string aName - the name of the object,
		 	\param		int aSubWindow=0 - the subwindow where the object is created,
		 	\param		long aChartID=0 - ID of the chart on which the object is created.			
		*/  
      void CreateArrowLeftPrice  (string aName,int aSubWindow=0,long aChartID=0){ObjectCreate(aChartID,aName,OBJ_ARROW_LEFT_PRICE,  aSubWindow,0,0);Attach(aName,aChartID);}
		
		/*!	
			Create the Right Price Tag object OBJ_ARROW_RIGHT_PRICE.
		 	\param		string aName - the name of the object,
		 	\param		int aSubWindow=0 - the subwindow where the object is created,
		 	\param		long aChartID=0 - ID of the chart on which the object is created.			
		*/  
      void CreateArrowRightPrice (string aName,int aSubWindow=0,long aChartID=0){ObjectCreate(aChartID,aName,OBJ_ARROW_RIGHT_PRICE, aSubWindow,0,0);Attach(aName,aChartID);}
		
		/*!	
			Create the Buy mark "Buy" OBJ_ARROW_BUY.
		 	\param		string aName - the name of the object,
		 	\param		int aSubWindow=0 - the subwindow where the object is created,
		 	\param		long aChartID=0 - ID of the chart on which the object is created.			
		*/  
      void CreateArrowBuy        (string aName,int aSubWindow=0,long aChartID=0){ObjectCreate(aChartID,aName,OBJ_ARROW_BUY,         aSubWindow,0,0);Attach(aName,aChartID);}
		
		/*!	
			Create the Sell sign "Sell" OBJ_ARROW_SEL.
		 	\param		string aName - the name of the object,
		 	\param		int aSubWindow=0 - the subwindow where the object is created,
		 	\param		long aChartID=0 - ID of the chart on which the object is created.			
		*/  
      void CreateArrowSell       (string aName,int aSubWindow=0,long aChartID=0){ObjectCreate(aChartID,aName,OBJ_ARROW_SELL,        aSubWindow,0,0);Attach(aName,aChartID);}
		
		/*!	
			Create the Arrow object OBJ_ARROW.
		 	\param		string aName - the name of the object,
		 	\param		int aSubWindow=0 - the subwindow where the object is created,
		 	\param		long aChartID=0 - ID of the chart on which the object is created.			
		*/  
      void CreateArrow           (string aName,int aSubWindow=0,long aChartID=0){ObjectCreate(aChartID,aName,OBJ_ARROW,             aSubWindow,0,0);Attach(aName,aChartID);}
		
		/*!	
			Create the Text object OBJ_TEXT.
		 	\param		string aName - the name of the object,
		 	\param		int aSubWindow=0 - the subwindow where the object is created,
		 	\param		long aChartID=0 - ID of the chart on which the object is created.			
		*/  
      void CreateText            (string aName,int aSubWindow=0,long aChartID=0){ObjectCreate(aChartID,aName,OBJ_TEXT,              aSubWindow,0,0);Attach(aName,aChartID);}
		
		/*!	
			Create the Text Label object OBJ_LABEL.
		 	\param		string aName - the name of the object,
		 	\param		int aSubWindow=0 - the subwindow where the object is created,
		 	\param		long aChartID=0 - ID of the chart on which the object is created.			
		*/  
      void CreateLabel           (string aName,int aSubWindow=0,long aChartID=0){ObjectCreate(aChartID,aName,OBJ_LABEL,             aSubWindow,0,0);Attach(aName,aChartID);}
		
		/*!	
			Create the Button object OBJ_BUTTON.
		 	\param		string aName - the name of the object,
		 	\param		int aSubWindow=0 - the subwindow where the object is created,
		 	\param		long aChartID=0 - ID of the chart on which the object is created.			
		*/  
      void CreateButton          (string aName,int aSubWindow=0,long aChartID=0){ObjectCreate(aChartID,aName,OBJ_BUTTON,            aSubWindow,0,0);Attach(aName,aChartID);}	      
		
		/*!	
			Create the Chart object OBJ_CHART.
		 	\param		string aName - the name of the object,
		 	\param		int aSubWindow=0 - the subwindow where the object is created,
		 	\param		long aChartID=0 - ID of the chart on which the object is created.			
		*/  
      void CreateChart           (string aName,int aSubWindow=0,long aChartID=0){ObjectCreate(aChartID,aName,OBJ_CHART,             aSubWindow,0,0);Attach(aName,aChartID);}
		
		/*!	
			Create the Bitmap object OBJ_BITMAP.
		 	\param		string aName - the name of the object,
		 	\param		int aSubWindow=0 - the subwindow where the object is created,
		 	\param		long aChartID=0 - ID of the chart on which the object is created.			
		*/  
      void CreateBitmap          (string aName,int aSubWindow=0,long aChartID=0){ObjectCreate(aChartID,aName,OBJ_BITMAP,            aSubWindow,0,0);Attach(aName,aChartID);}
		
		/*!	
			Create the Bitmap Label object OBJ_BITMAP_LABEL.
		 	\param		string aName - the name of the object,
		 	\param		int aSubWindow=0 - the subwindow where the object is created,
		 	\param		long aChartID=0 - ID of the chart on which the object is created.			
		*/  
      void CreatePitmapLabel     (string aName,int aSubWindow=0,long aChartID=0){ObjectCreate(aChartID,aName,OBJ_BITMAP_LABEL,      aSubWindow,0,0);Attach(aName,aChartID);}
		
		/*!	
			Create the Edit object OBJ_EDIT.
		 	\param		string aName - the name of the object,
		 	\param		int aSubWindow=0 - the subwindow where the object is created,
		 	\param		long aChartID=0 - ID of the chart on which the object is created.			
		*/  
      void CreateEdit            (string aName,int aSubWindow=0,long aChartID=0){ObjectCreate(aChartID,aName,OBJ_EDIT,              aSubWindow,0,0);Attach(aName,aChartID);}
		
		/*!	
			Create the arrowed line object OBJ_ARROWED_LINE.
		 	\param		string aName - the name of the object,
		 	\param		int aSubWindow=0 - the subwindow where the object is created,
		 	\param		long aChartID=0 - ID of the chart on which the object is created.			
		*/  
      void CreateArrowedLine     (string aName,int aSubWindow=0,long aChartID=0){ObjectCreate(aChartID,aName,OBJ_ARROWED_LINE,      aSubWindow,0,0);Attach(aName,aChartID);}
		
		/*!	
			Create the Event object OBJ_EVENT.
		 	\param		string aName - the name of the object,
		 	\param		int aSubWindow=0 - the subwindow where the object is created,
		 	\param		long aChartID=0 - ID of the chart on which the object is created.			
		*/  
      void CreateEvent           (string aName,int aSubWindow=0,long aChartID=0){ObjectCreate(aChartID,aName,OBJ_EVENT,             aSubWindow,0,0);Attach(aName,aChartID);}
		
		/*!	
			Create the Rectangle Label object OBJ_RECTANGLE_LABEL.
		 	\param		string aName - the name of the object,
		 	\param		int aSubWindow=0 - the subwindow where the object is created,
		 	\param		long aChartID=0 - ID of the chart on which the object is created.			
		*/  
      void CreateRectangleLabel  (string aName,int aSubWindow=0,long aChartID=0){ObjectCreate(aChartID,aName,OBJ_RECTANGLE_LABEL,   aSubWindow,0,0);Attach(aName,aChartID);}

      //+------------------------------------------------------------------+
      //|   Get properties for the attached object                         |
      //+------------------------------------------------------------------+         

		/*!	
			Color OBJPROP_COLOR.
		 	\return  Color value (type color).		
		*/  
      color                   Color       ()             {return( (color)                    ObjectGetInteger(m_id,m_name,OBJPROP_COLOR));}

		/*!	
			Style OBJPROP_STYLE.
		 	\return  Style value (type ENUM_LINE_STYLE).		
		*/        
      ENUM_LINE_STYLE         Style       ()             {return( (ENUM_LINE_STYLE)          ObjectGetInteger(m_id,m_name,OBJPROP_STYLE));}

		/*!	
			Width OBJPROP_WIDTH.
		 	\return  Width value (type int).		
		*/         
      int                     Width       ()             {return( (int)                      ObjectGetInteger(m_id,m_name,OBJPROP_WIDTH));} 

		/*!	
			Locate object in the background OBJPROP_BACK.
		 	\return  Type bool. True - in the background, false - in the foreground.		
		*/        
      bool                    Back        ()             {return( (bool)                     ObjectGetInteger(m_id,m_name,OBJPROP_BACK));} 	

		/*!	
			Color filling of the object OBJPROP_FILL (for OBJ_RECTANGLE, OBJ_TRIANGLE, OBJ_ELLIPSE, OBJ_CHANNEL, OBJ_STDDEVCHANNEL, OBJ_REGRESSION)
		 	\return  Type bool. True - filled, false - edge.	
		*/       
      bool                    Fill        ()             {return( (bool)                     ObjectGetInteger(m_id,m_name,OBJPROP_FILL));} 		

		/*!	
			Object selection OBJPROP_SELECTED.
		 	\return  Type bool. True - selected, false - not selected.	
		*/       
      bool                    Selected    ()             {return( (bool)                     ObjectGetInteger(m_id,m_name,OBJPROP_SELECTED));} 		

		/*!	
			Text editing in the Input Box objectOBJPROP_SELECTED.
		 	\return  Type bool. True - editing disabled, false - enabled.	
		*/  
      bool                    ReadOnly    ()             {return( (bool)                     ObjectGetInteger(m_id,m_name,OBJPROP_READONLY));} 		

		/*!	
			Object Type OBJPROP_TYPE.
		 	\return  Òèï ENUM_OBJECT.	
		*/       
      ENUM_OBJECT             Type        ()             {return( (ENUM_OBJECT)              ObjectGetInteger(m_id,m_name,OBJPROP_TYPE));}

		/*!	
			Time of one of the object anchor points OBJPROP_TIME.
         \param   int aIndex - the index of the anchor point (starting from zero).
		 	\return  Time value (type datetime).		
		*/       
      datetime                Time        (int aIndex)   {return( (datetime)                 ObjectGetInteger(m_id,m_name,OBJPROP_TIME,aIndex));}	

		/*!	
			If the object can be selected OBJPROP_SELECTABLE.
		 	\return  Type bool. True - selection allowed, false - forbidden.	
		*/         
      bool                    Selectable  ()             {return( (bool)                     ObjectGetInteger(m_id,m_name,OBJPROP_SELECTABLE));} 		

		/*!	
			Object creation time OBJPROP_CREATETIME.
		 	\return  Time value (type datetime).		
		*/       
      datetime                CreateTime  ()             {return( (datetime)                 ObjectGetInteger(m_id,m_name,OBJPROP_CREATETIME));}	

		/*!	
			Number of levels OBJPROP_LEVELS).
		 	\return  Value (type int).		
		*/    
      int                     Levels      ()             {return( (int)                      ObjectGetInteger(m_id,m_name,OBJPROP_LEVELS));}	

		/*!	
			Level color OBJPROP_LEVELCOLOR.
         \param   int aIndex - Level index (from zero).
		 	\return  Color value (type color).		
		*/  
      color                   LevelColor  (int aIndex)   {return( (color)                    ObjectGetInteger(m_id,m_name,OBJPROP_LEVELCOLOR,aIndex));}		

		/*!	
			Level style OBJPROP_LEVELSTYLE.
         \param   int aIndex - Level index (from zero).
		 	\return  Style value (type ENUM_LINE_STYLE).		
		*/        
      ENUM_LINE_STYLE         LevelStyle  (int aIndex)   {return( (ENUM_LINE_STYLE)          ObjectGetInteger(m_id,m_name,OBJPROP_LEVELSTYLE,aIndex));}	

		/*!	
			Level width OBJPROP_LEVELWIDTH.
         \param   int aIndex - Level index (from zero).
		 	\return  Width value (type int).		
		*/  
      int                     LevelWidth  (int aIndex)   {return( (int)                      ObjectGetInteger(m_id,m_name,OBJPROP_LEVELWIDTH,aIndex));}		

		/*!	
			Font size OBJPROP_FONTSIZE.
		 	\return  Size value (òèï int).		
		*/        
      int                     FontSize    ()             {return( (int)                      ObjectGetInteger(m_id,m_name,OBJPROP_FONTSIZE));}		   

		/*!	
			Ray continuation to the left OBJPROP_RAY_LEFT.
		 	\return  Type bool. True - there is a ray to the left, false - no ray.		
		*/       
      bool                    RayLeft     ()             {return( (bool)                     ObjectGetInteger(m_id,m_name,OBJPROP_RAY_LEFT));} 	

		/*!	
			Ray continuation to the right OBJPROP_RAY_RIGHT.
		 	\return  Type bool. True - there is a ray to the right, false - no ray.		
		*/         
      bool                    RayRight    ()             {return( (bool)                     ObjectGetInteger(m_id,m_name,OBJPROP_RAY_RIGHT));} 		

		/*!	
			The vertical line extends to all chart windows OBJPROP_RAY.
		 	\return  Type bool. True - extends to all windows, false - in only one subwindow.		
		*/   
      bool                    Ray         ()             {return( (bool)                     ObjectGetInteger(m_id,m_name,OBJPROP_RAY));} 		

		/*!	
			Display the full ellipse of the Fibonacci Arcs object OBJPROP_ELLIPSE.
      	\return  Type bool. True - full ellipse, false - arcs.		
		*/  
      bool                    Ellipse     ()             {return( (bool)                     ObjectGetInteger(m_id,m_name,OBJPROP_ELLIPSE));} 			   

		/*!	
			Arrow code for the Arrow object OBJPROP_ARROWCODE.
      	\return  Arrow code (type char).
		*/ 
      char                    ArrowCode   ()             {return( (char)                     ObjectGetInteger(m_id,m_name,OBJPROP_ARROWCODE));}

		/*!	
			Visibility of the object on timeframes OBJPROP_TIMEFRAMES.
      	\return  A set of visibility flags (type long).
		*/ 
      long                    TimeFrames  ()             {return(                            ObjectGetInteger(m_id,m_name,OBJPROP_TIMEFRAMES));}

		/*!	
			Position of the anchor point OBJPROP_ANCHOR.
      	\return  Value of the anchor point (type long). For OBJ_ARROW one of the values of ENUM_ARROW_ANCHOR, for OBJ_LABEL and OBJ_TEXT - one of the values of ENUM_ANCHORPOINT.
		*/       
      long                    Anchor      ()             {return(                            ObjectGetInteger(m_id,m_name,OBJPROP_ANCHOR));}

		/*!	
			Distance in pixels along the X axis from the anchor corner OBJPROP_XDISTANCE.
      	\return  Value (type int).
		*/      
      int                     XDistance   ()             {return( (int)                      ObjectGetInteger(m_id,m_name,OBJPROP_XDISTANCE));}	

		/*!	
			Distance in pixels along the Y axis from the anchor corner  OBJPROP_YDISTANCE.
      	\return  Value (type int).
		*/        
      int                     YDistance   ()             {return( (int)                      ObjectGetInteger(m_id,m_name,OBJPROP_YDISTANCE));}	

		/*!	
			Trend of the Gann object OBJPROP_DIRECTION.
      	\return  Value (type ENUM_GANN_DIRECTION).
		*/   
      ENUM_GANN_DIRECTION     Direction   ()             {return( (ENUM_GANN_DIRECTION)      ObjectGetInteger(m_id,m_name,OBJPROP_DIRECTION));}

		/*!	
			Level of Elliott wave marking OBJPROP_DEGREE.
      	\return  Value (type ENUM_ELLIOT_WAVE_DEGREE).
		*/        
      ENUM_ELLIOT_WAVE_DEGREE Degree      ()             {return( (ENUM_ELLIOT_WAVE_DEGREE)  ObjectGetInteger(m_id,m_name,OBJPROP_DEGREE));}

		/*!	
			Display lines for Elliott wave marking OBJPROP_DRAWLINES.
      	\return  Type bool. True - enabled, false - disabled.		
		*/  
      bool                    DrawLines   ()             {return( (bool)                     ObjectGetInteger(m_id,m_name,OBJPROP_DRAWLINES));} 

		/*!	
			Button state (pressed/unpressed) OBJPROP_STATE.
      	\return  Type bool. True - pressed, false - unpressed.
		*/ 
      bool                    State       ()             {return( (bool)                     ObjectGetInteger(m_id,m_name,OBJPROP_STATE));} 

		/*!	
			ID of the Chart object OBJPROP_CHART_ID.
      	\return  ID value (type long).
		*/ 
      long                    ChartChartID()             {return( (bool)                     ObjectGetInteger(m_id,m_name,OBJPROP_CHART_ID));}

		/*!	
			Horizontal size of the object OBJPROP_XSIZE.
      	\return  Size value (òèï int).
		*/       
      int                     XSize       ()             {return( (int)                      ObjectGetInteger(m_id,m_name,OBJPROP_XSIZE));}	

		/*!	
			Vertical size of the object OBJPROP_YSIZE.
      	\return  Size value (òèï int).
		*/ 
      int                     YSize       ()             {return( (int)                      ObjectGetInteger(m_id,m_name,OBJPROP_YSIZE));}		

		/*!	
			X coordinate of the object scope start OBJPROP_XOFFSET.
      	\return  Value (type int).
		*/ 
      int                     XOffset     ()             {return( (int)                      ObjectGetInteger(m_id,m_name,OBJPROP_XOFFSET));}	

		/*!	
			Y coordinate of the object scope start OBJPROP_YOFFSET.
      	\return  Value (type int).
		*/ 
      int                     YOffset     ()             {return( (int)                      ObjectGetInteger(m_id,m_name,OBJPROP_YOFFSET));}	

		/*!	
			Timeframe of the Chart object OBJPROP_PERIOD.
      	\return  Value (type ENUM_TIMEFRAMES).
		*/       
      ENUM_TIMEFRAMES         Period      ()             {return( (ENUM_TIMEFRAMES)          ObjectGetInteger(m_id,m_name,OBJPROP_PERIOD));}

		/*!	
			Time scale display flag for the Chart object "Ãðàôèê" OBJPROP_DATE_SCALE.
      	\return  Type bool. True - there is a scale, false - no scale.
		*/ 
      bool                    DateScale   ()             {return( (bool)                     ObjectGetInteger(m_id,m_name,OBJPROP_DATE_SCALE));} 

		/*!	
			Price scale display flag for the Chart object OBJPROP_PRICE_SCALE.
      	\return  Type bool. True - there is a scale, false - no scale.
		*/       
      bool                    PriceScale  ()             {return( (bool)                     ObjectGetInteger(m_id,m_name,OBJPROP_PRICE_SCALE));} 

		/*!	
			Scale for the Chart object OBJPROP_CHART_SCALE.
      	\return  Value 1-5 (type int).
		*/        
      int                     ChartScale  ()             {return( (int)                      ObjectGetInteger(m_id,m_name,OBJPROP_CHART_SCALE));}		

		/*!	
			Background color OBJPROP_BGCOLOR.
		 	\return  Color value (type color).		
		*/  
      color                   BgColor     ()             {return( (color)                    ObjectGetInteger(m_id,m_name,OBJPROP_BGCOLOR));}

		/*!	
			Chart corner for binding an object OBJPROP_CORNER.
		 	\return  Value (type ENUM_BASE_CORNER).
		*/  
      ENUM_BASE_CORNER        Corner      ()             {return( (ENUM_BASE_CORNER)         ObjectGetInteger(m_id,m_name,OBJPROP_CORNER));}

		/*!	
			Frame type from the Rectangle Frame object OBJPROP_BORDER_TYPE.
		 	\return  Value (type ENUM_BORDER_TYPE).
		*/        
      ENUM_BORDER_TYPE        BorderType  ()             {return( (ENUM_BORDER_TYPE)         ObjectGetInteger(m_id,m_name,OBJPROP_BORDER_TYPE));}

		/*!	
			Price coordinate OBJPROP_PRICE.
         \param   int aIndex - point number (from zero).
		 	\return  Value (type double).
		*/    
      double                  Price       (int aIndex)   {return(                            ObjectGetDouble(m_id,m_name,OBJPROP_PRICE,aIndex));} 

		/*!	
			Level value OBJPROP_LEVELVALUE.
         \param   int aIndex - Level index (from zero).
		 	\return  Value (type double).
		*/          
      double                  LevelValue  (int aIndex)   {return(                            ObjectGetDouble(m_id,m_name,OBJPROP_LEVELVALUE,aIndex));}  

		/*!	
			Scale (property of Gann objects and the Fibonacci Arcs object) OBJPROP_SCALE.
		 	\return  Value (type double).
		*/        
      double                  Scale       ()             {return(                            ObjectGetDouble(m_id,m_name,OBJPROP_SCALE));}

		/*!	
			Angle OBJPROP_ANGLE.
		 	\return  Value (type double).
		*/ 
      double                  Angle       ()             {return(                            ObjectGetDouble(m_id,m_name,OBJPROP_ANGLE));}

		/*!	
			Deviation of the standard deviation channel OBJPROP_DEVIATION.
		 	\return  Value (type double).
		*/       
      double                  Deviation   ()             {return(                            ObjectGetDouble(m_id,m_name,OBJPROP_DEVIATION));}

		/*!	
			Text contained in the object OBJPROP_TEXT.
		 	\return  Text.
		*/  
      string                  Text        ()             {return(                            ObjectGetString(m_id,m_name,OBJPROP_TEXT));}

		/*!	
			Tooltip text. OBJPROP_TOOLTIP.
		 	\return  Text.
		*/  
      string                  ToolTip     ()             {return(                            ObjectGetString(m_id,m_name,OBJPROP_TOOLTIP));}

		/*!	
			Level description. OBJPROP_LEVELTEXT.
         \param   int aIndex - Level index (from zero).			
		 	\return  Text.
		*/        
      string                  LevelText   (int aIndex)   {return(                            ObjectGetString(m_id,m_name,OBJPROP_LEVELTEXT,aIndex));} 

		/*!	
			Font name. OBJPROP_FONT.
		 	\return  Name (type string).
		*/       
      string                  Font        ()             {return(                            ObjectGetString(m_id,m_name,OBJPROP_FONT));}

		/*!	
			Image file name for the ON state OBJPROP_BMPFILE, modifier 0.
		 	\return  File name (type string).
		*/       
      string                  BmpFileOn   ()             {return(                            ObjectGetString(m_id,m_name,OBJPROP_BMPFILE,0));}

		/*!	
			Image file name for the OFF state OBJPROP_BMPFILE, modifier 1.
		 	\return  File name (type string).
		*/    
      string                  BmpFileOff  ()             {return(                            ObjectGetString(m_id,m_name,OBJPROP_BMPFILE,1));}       

		/*!	
			Symbol for the Chart object OBJPROP_SYMBOL.
		 	\return  Symbol (type string).
		*/  
      string                  Symbol      ()             {return(                            ObjectGetString(m_id,m_name,OBJPROP_SYMBOL));}  
      
      //+------------------------------------------------------------------+
      //|   Set properties of the attached object                       |
      //+------------------------------------------------------------------+    

		/*!	
			Set color OBJPROP_COLOR.
         \param		color aValue - color value.			
		*/  
      void SetColor        (color aValue)                      {ObjectSetInteger(m_id,m_name,OBJPROP_COLOR,             aValue);}

		/*!	
			Set style OBJPROP_STYLE.
         \param		ENUM_LINE_STYLE aValue - style value.			
		*/
      void SetStyle        (ENUM_LINE_STYLE aValue)            {ObjectSetInteger(m_id,m_name,OBJPROP_STYLE,             aValue);}

		/*!	
			Set width OBJPROP_WIDTH.
         \param		int aValue - width value.			
		*/  
      void SetWidth        (int aValue)                        {ObjectSetInteger(m_id,m_name,OBJPROP_WIDTH,             aValue);} 

		/*!	
			Locate onject in the background/foreground OBJPROP_BACK.
         \param		bool aValue - true/false (back/foreground).
		*/        
      void SetBack         (bool aValue)                       {ObjectSetInteger(m_id,m_name,OBJPROP_BACK,              aValue);} 	

		/*!	
			Enable fill OBJPROP_FILL.
         \param		bool aValue - true/false (filling/edge).
		*/       
      void SetFill         (bool aValue)                       {ObjectSetInteger(m_id,m_name,OBJPROP_FILL,              aValue);} 		

		/*!	
			Enable selection OBJPROP_SELECTED.
         \param		bool aValue - true/false (selected/not).
		*/         
      void SetSelected     (bool aValue)                       {ObjectSetInteger(m_id,m_name,OBJPROP_SELECTED,          aValue);} 		

		/*!	
			Enabling text editing in the Edit object OBJPROP_READONLY.
         \param		bool aValue - true/false (prohibited/allowed).
		*/         
      void SetReadOnly     (bool aValue)                       {ObjectSetInteger(m_id,m_name,OBJPROP_READONLY,          aValue);} 		

		/*!	
			Set time of one of the anchor points OBJPROP_TIME.
         \param		int aIndex - point number (from zero),
         \param		datetime aValue - time value.
		*/    
      void SetTime         (int aIndex,datetime aValue)        {ObjectSetInteger(m_id,m_name,OBJPROP_TIME,              aIndex,aValue);}	

		/*!	
			Enable object selection OBJPROP_SELECTABLE.
         \param		bool aValue - true/false (allowed/not).
		*/       
      void SetSelectable   (bool aValue)                       {ObjectSetInteger(m_id,m_name,OBJPROP_SELECTABLE,        aValue);} 		

		/*!	
			Set the number of levels OBJPROP_LEVELS.
         \param		int aValue - the number of levels.
		*/       
      void SetLevels       (int aValue)                        {ObjectSetInteger(m_id,m_name,OBJPROP_LEVELS,            aValue);}	

		/*!	
			Set the level color OBJPROP_LEVELCOLOR.
         \param   int aIndex - level index (from zero),
         \param   color aValue - color value.
		*/        
      void SetLevelColor   (int aIndex,color aValue)           {ObjectSetInteger(m_id,m_name,OBJPROP_LEVELCOLOR,        aIndex,aValue);}		

		/*!	
			Set level style OBJPROP_LEVELSTYLE.
         \param   int aIndex - level index (from zero),
         \param   ENUM_LINE_STYLE aValue - Style value.
		*/  
      void SetLevelStyle   (int aIndex,ENUM_LINE_STYLE aValue) {ObjectSetInteger(m_id,m_name,OBJPROP_LEVELSTYLE,        aIndex,aValue);}

		/*!	
			Set level width OBJPROP_LEVELWIDTH.
         \param   int aIndex - level index (from zero),
         \param   int aValue - width value.
		*/  
      void SetLevelWidth   (int aIndex,int aValue)             {ObjectSetInteger(m_id,m_name,OBJPROP_LEVELWIDTH,        aIndex,aValue);}		

		/*!	
			Set font size OBJPROP_FONTSIZE.
         \param   int aValue - size value.
		*/  
      void SetFontSize     (int aValue)                        {ObjectSetInteger(m_id,m_name,OBJPROP_FONTSIZE,          aValue);}		   

		/*!	
			Enable a ray to the left OBJPROP_RAY_LEFT.
         \param   bool aValue - true/false (enabled/disabled).
		*/  
      void SetRayLeft      (bool aValue)                       {ObjectSetInteger(m_id,m_name,OBJPROP_RAY_LEFT,          aValue);} 	

		/*!	
			Enable a ray to the right OBJPROP_RAY_RIGHT.
         \param   bool aValue - true/false (enabled/disabled).
		*/        
      void SetRayRight     (bool aValue)                       {ObjectSetInteger(m_id,m_name,OBJPROP_RAY_RIGHT,         aValue);} 		

		/*!	
			Enable extension of a vertical line to subwindows OBJPROP_RAY.
         \param   bool aValue - true/false (enabled/disabled).
		*/   
      void SetRay          (bool aValue)                       {ObjectSetInteger(m_id,m_name,OBJPROP_RAY,               aValue);} 		

		/*!	
			Enable display of full arcs of the Fibonacci Arcs object OBJPROP_ELLIPSE.
         \param   bool aValue - true/false (ellipse/arcs).
		*/        
      void SetEllipse      (bool aValue)                       {ObjectSetInteger(m_id,m_name,OBJPROP_ELLIPSE,           aValue);} 			   

		/*!	
			Set the arrow code OBJPROP_ARROWCODE.
         \param   char aValue - arrow code.
		*/        
      void SetArrowCode    (char aValue)                        {ObjectSetInteger(m_id,m_name,OBJPROP_ARROWCODE,         aValue);}

		/*!	
			Set object visibility on timeframes OBJPROP_TIMEFRAMES.
         \param   long aValue - a combination of flags.
		*/           
      void SetTimeFrames   (long aValue)                       {ObjectSetInteger(m_id,m_name,OBJPROP_TIMEFRAMES,        aValue);}

		/*!	
			Set anchor point OBJPROP_ANCHOR.
         \param   long aValue - anchor point (ENUM_ARROW_ANCHOR or ENUM_ANCHORPOINT).
		*/    
      void SetAnchor       (long aValue)                       {ObjectSetInteger(m_id,m_name,OBJPROP_ANCHOR,            aValue);}

		/*!	
			Set the distance along the X axis from the anchor corner OBJPROP_XDISTANCE.
         \param   int aValue - distance value.
		*/    
      void SetXDistance    (int aValue)                        {ObjectSetInteger(m_id,m_name,OBJPROP_XDISTANCE,         aValue);}	

		/*!	
			Set the distance along the Y axis from the anchor corner OBJPROP_YDISTANCE.
         \param   int aValue - distance value.
		*/          
      void SetYDistance    (int aValue)                        {ObjectSetInteger(m_id,m_name,OBJPROP_YDISTANCE,         aValue);}	

		/*!	
			Set trend for the Gann object OBJPROP_DIRECTION.
         \param   ENUM_GANN_DIRECTION aValue - trend value.
		*/ 
      void SetDirection    (ENUM_GANN_DIRECTION aValue)        {ObjectSetInteger(m_id,m_name,OBJPROP_DIRECTION,         aValue);}

		/*!	
			Set level of Elliot wave marking OBJPROP_DEGREE.
         \param   ENUM_ELLIOT_WAVE_DEGREE aValue - level value.
		*/ 
      void SetDegree       (ENUM_ELLIOT_WAVE_DEGREE aValue)    {ObjectSetInteger(m_id,m_name,OBJPROP_DEGREE,            aValue);}

		/*!	
			Show the line of the Elliot wave marking OBJPROP_DRAWLINES.
         \param   bool aValue - true/false (on/off).
		*/       
      void SetDrawLines    (bool aValue)                       {ObjectSetInteger(m_id,m_name,OBJPROP_DRAWLINES,         aValue);} 

		/*!	
			Set button states.
         \param   bool aValue - true/false (on/off).
		*/        
      void SetState        (bool aValue)                       {ObjectSetInteger(m_id,m_name,OBJPROP_STATE,             aValue);} 

		/*!	
			Set horizontal size OBJPROP_XSIZE.
         \param   int aValue - size value.
		*/       
      void SetXSize        (int aValue)                        {ObjectSetInteger(m_id,m_name,OBJPROP_XSIZE,             aValue);}	

		/*!	
			Set vertical size OBJPROP_YSIZE.
         \param   int aValue - size value.
		*/          
      void SetYSize        (int aValue)                        {ObjectSetInteger(m_id,m_name,OBJPROP_YSIZE,             aValue);}		

		/*!	
			Set the X coordinate of the scope start OBJPROP_XOFFSET.
         \param   int aValue - coordinate value.
		*/ 
      void SetXOffset      (int aValue)                        {ObjectSetInteger(m_id,m_name,OBJPROP_XOFFSET,           aValue);}	

		/*!	
			Set the Y coordinate of the scope start OBJPROP_YOFFSET.
         \param   int aValue - coordinate value.
		*/ 
      void SetYOffset      (int aValue)                        {ObjectSetInteger(m_id,m_name,OBJPROP_YOFFSET,           aValue);}	

		/*!	
			Set timeframe for the Chart object OBJPROP_PERIOD.
         \param   ENUM_TIMEFRAMES aValue - timeframe value.
		*/ 
      void SetPeriod       (ENUM_TIMEFRAMES aValue)            {ObjectSetInteger(m_id,m_name,OBJPROP_PERIOD,            aValue);}

		/*!	
			Show/hide data scale for the Chart object OBJPROP_DATE_SCALE.
         \param   bool aValue - true/false (on/off).
		*/ 
      void SetDateScale    (bool aValue)                       {ObjectSetInteger(m_id,m_name,OBJPROP_DATE_SCALE,        aValue);} 

		/*!	
			Show/hide price scale for the Chart object OBJPROP_PRICE_SCALE.
         \param   bool aValue - true/false (on/off).
		*/       
      void SetPriceScale   (bool aValue)                       {ObjectSetInteger(m_id,m_name,OBJPROP_PRICE_SCALE,       aValue);} 

		/*!	
			Set scale for the Chart object OBJPROP_CHART_SCALE.
         \param   int aValue - a value 1-5.
		*/         
      void SetChartScale   (int aValue)                        {ObjectSetInteger(m_id,m_name,OBJPROP_CHART_SCALE,       aValue);}		

		/*!	
			Set background color OBJPROP_BGCOLOR.
         \param   color aValue - color value.
		*/        
      void SetBgColor      (color aValue)                      {ObjectSetInteger(m_id,m_name,OBJPROP_BGCOLOR,           aValue);}

		/*!	
			Set chart corner for binding OBJPROP_CORNER.
         \param   ENUM_BASE_CORNER aValue - óãîë ãðàôèêà.
		*/       
      void SetCorner       (ENUM_BASE_CORNER aValue)           {ObjectSetInteger(m_id,m_name,OBJPROP_CORNER,            aValue);}

		/*!	
			Set frame type for the Rectangle Frame object OBJPROP_BORDER_TYPE.
         \param   ENUM_BORDER_TYPE aValue - frame type.
		*/        
      void SetBorderType   (ENUM_BORDER_TYPE aValue)           {ObjectSetInteger(m_id,m_name,OBJPROP_BORDER_TYPE,       aValue);}      

		/*!	
			Set price value OBJPROP_PRICE.
         \param   int aIndex - point number (from zero),
		 	\param  double aValue - value.
		*/   
      void SetPrice        (int aIndex,double aValue)          {ObjectSetDouble(m_id,m_name,OBJPROP_PRICE,              aIndex,aValue);} 

		/*!	
			Set the level value OBJPROP_LEVELVALUE.
         \param   int aIndex - level index (from zero),
		 	\param  double aValue - value.
		*/        
      void SetLevelValue   (int aIndex,double aValue)          {ObjectSetDouble(m_id,m_name,OBJPROP_LEVELVALUE,         aIndex,aValue);}  

		/*!	
			Set scale (property of Gann objects and the Fibonacci Arcs object) OBJPROP_SCALE.
		 	\param  double aValue - scale value.
		*/       
      void SetScale        (double aValue)                     {ObjectSetDouble(m_id,m_name,OBJPROP_SCALE,              aValue);}     

		/*!	
			Set corner OBJPROP_ANGLE.
		 	\param  double aValue - corner value OBJPROP_ANGLE.
		*/       
      void SetAngle        (double aValue)                     {ObjectSetDouble(m_id,m_name,OBJPROP_ANGLE,              aValue);}

		/*!	
			Set width of the standard deviation channel OBJPROP_DEVIATION.
		 	\param  double aValue - width value (number of standard deviations).
		*/         
      void SetDeviation    (double aValue)                     {ObjectSetDouble(m_id,m_name,OBJPROP_DEVIATION,          aValue);}

		/*!	
			Set text OBJPROP_TEXT.
		 	\param  string aValue - text.
		*/   
      void SetText         (string aValue)                     {ObjectSetString(m_id,m_name,OBJPROP_TEXT,               aValue);}

		/*!	
			Set a tooltip OBJPROP_TOOLTIP.
		 	\param  string aValue - text.
		 	\remark To disable tooltip, set value "\n".		 	
		*/       
      void SetToolTip      (string aValue)                     {ObjectSetString(m_id,m_name,OBJPROP_TOOLTIP,            aValue);}

		/*!	
			Set level description OBJPROP_LEVELTEXT.
         \param   int aIndex - level index (from zero),
		 	\param  string aValue - text. 	
		*/       
      void SetLevelText    (int aIndex,string aValue)          {ObjectSetString(m_id,m_name,OBJPROP_LEVELTEXT,          aIndex,aValue);} 

		/*!	
			Set font type OBJPROP_FONT.
		 	\param  string aValue - font name. 	
		*/        
      void SetFont         (string aValue)                     {ObjectSetString(m_id,m_name,OBJPROP_FONT,               aValue);} 

		/*!	
			Set image file for the ON state OBJPROP_BMPFILE, modifier 0.
		 	\param  string aValue - file name. 	
		*/         
      void SetBmpFileOn    (string aValue)                     {ObjectSetString(m_id,m_name,OBJPROP_BMPFILE,            0,aValue);}       

		/*!	
			Set image file for the OFF state OBJPROP_BMPFILE, modifier 1.
		 	\param  string aValue - file name. 	
		*/        
      void SetBmpFileOff   (string aValue)                     {ObjectSetString(m_id,m_name,OBJPROP_BMPFILE,            1,aValue);}       

		/*!	
			Set symbol for the Chart object OBJPROP_SYMBOL.
		 	\param  string aValue - symbol. 	
		*/      
      void SetSymbol       (string aValue)                     {ObjectSetString(m_id,m_name,OBJPROP_SYMBOL,             aValue);}  
      
      //+------------------------------------------------------------------+
      //|   Get properties by object name                                  |
      //+------------------------------------------------------------------+         
   
		/*!	
			Color OBJPROP_COLOR.
			\param  string aName - object name. 
		 	\return  Color value (type color).		
		*/     
      color                   Color       (string aName)             {return( (color)                    ObjectGetInteger(0,aName,OBJPROP_COLOR));}
		
		/*!	
			Style OBJPROP_STYLE.
         \param  string aName - object name. 			
		 	\return  Style value (type ENUM_LINE_STYLE).		
		*/        
      ENUM_LINE_STYLE         Style       (string aName)             {return( (ENUM_LINE_STYLE)          ObjectGetInteger(0,aName,OBJPROP_STYLE));}
		
		/*!	
			Width OBJPROP_WIDTH.
         \param  string aName - object name. 						
		 	\return  Width value (type int).		
		*/  
      int                     Width       (string aName)             {return( (int)                      ObjectGetInteger(0,aName,OBJPROP_WIDTH));} 
		
		/*!	
			Locate object in the background OBJPROP_BACK.
         \param  string aName - object name. 			
		 	\return  Type bool. True - in the background, false - in the foreground.		
		*/    
      bool                    Back        (string aName)             {return( (bool)                     ObjectGetInteger(0,aName,OBJPROP_BACK));} 	
		
		/*!	
			Color filling of the object OBJPROP_FILL (for OBJ_RECTANGLE, OBJ_TRIANGLE, OBJ_ELLIPSE, OBJ_CHANNEL, OBJ_STDDEVCHANNEL, OBJ_REGRESSION)
         \param  string aName - object name. 			
		 	\return  Type bool. True - filled, false - edge.	
		*/  
      bool                    Fill        (string aName)             {return( (bool)                     ObjectGetInteger(0,aName,OBJPROP_FILL));} 		
		
		/*!	
			Object selection OBJPROP_SELECTED.
         \param  string aName - object name. 			
		 	\return  Type bool. True - selected, false - not selected.	
		*/  
      bool                    Selected    (string aName)             {return( (bool)                     ObjectGetInteger(0,aName,OBJPROP_SELECTED));} 		
		
		/*!	
			Text editing in the Input Box objectOBJPROP_SELECTED.
         \param  string aName - object name. 			
		 	\return  Type bool. True - editing disabled, false - enabled.	
		*/  
      bool                    ReadOnly    (string aName)             {return( (bool)                     ObjectGetInteger(0,aName,OBJPROP_READONLY));} 		
		
		/*!	
			Object Type OBJPROP_TYPE.
         \param  string aName - object name. 			
		 	\return  Òèï ENUM_OBJECT.	
		*/  
      ENUM_OBJECT             Type        (string aName)             {return( (ENUM_OBJECT)              ObjectGetInteger(0,aName,OBJPROP_TYPE));}
		
		/*!	
			Time of one of the object anchor points OBJPROP_TIME.
         \param  string aName - object name,
         \param   int aIndex - the index of the anchor point (starting from zero).
		 	\return  Time value (type datetime).		
		*/  
      datetime                Time        (string aName,int aIndex)  {return( (datetime)                 ObjectGetInteger(0,aName,OBJPROP_TIME,aIndex));}	
		
		/*!	
			If the object can be selected OBJPROP_SELECTABLE.
         \param  string aName - object name. 			
		 	\return  Type bool. True - selection allowed, false - forbidden.	
		*/   
      bool                    Selectable  (string aName)             {return( (bool)                     ObjectGetInteger(0,aName,OBJPROP_SELECTABLE));} 		
		
		/*!	
			Object creation time OBJPROP_CREATETIME.
         \param  string aName - object name. 						
		 	\return  Time value (type datetime).		
		*/  
      datetime                CreateTime  (string aName)             {return( (datetime)                 ObjectGetInteger(0,aName,OBJPROP_CREATETIME));}	
		
		/*!	
			Number of levels OBJPROP_LEVELS).
         \param  string aName - object name. 						
		 	\return  Value (type int).		
		*/   
      int                     Levels      (string aName)             {return( (int)                      ObjectGetInteger(0,aName,OBJPROP_LEVELS));}	
		
		/*!	
			Level color OBJPROP_LEVELCOLOR.
         \param   int aIndex - Level index (from zero).
         \param  string aName - object name. 			         
		 	\return  Color value (type color).		
		*/ 
      color                   LevelColor  (string aName,int aIndex)  {return( (color)                    ObjectGetInteger(0,aName,OBJPROP_LEVELCOLOR,aIndex));}		
		
		/*!	
			Level style OBJPROP_LEVELSTYLE.
         \param   int aIndex - Level index (from zero).
         \param  string aName - object name. 			         
		 	\return  Style value (type ENUM_LINE_STYLE).		
		*/  
      ENUM_LINE_STYLE         LevelStyle  (string aName,int aIndex)  {return( (ENUM_LINE_STYLE)          ObjectGetInteger(0,aName,OBJPROP_LEVELSTYLE,aIndex));}	
		
		/*!	
			Level width OBJPROP_LEVELWIDTH.
         \param   int aIndex - Level index (from zero).
         \param  string aName - object name. 			         
		 	\return  Width value (type int).		
		*/  
      int                     LevelWidth  (string aName,int aIndex)  {return( (int)                      ObjectGetInteger(0,aName,OBJPROP_LEVELWIDTH,aIndex));}		
		
		/*!	
			Font size OBJPROP_FONTSIZE.
         \param  string aName - object name. 						
		 	\return  Size value (òèï int).		
		*/  
      int                     FontSize    (string aName)             {return( (int)                      ObjectGetInteger(0,aName,OBJPROP_FONTSIZE));}		   
		
		/*!	
			Ray continuation to the left OBJPROP_RAY_LEFT.
         \param  string aName - object name. 						
		 	\return  Type bool. True - there is a ray to the left, false - no ray.		
		*/    
      bool                    RayLeft     (string aName)             {return( (bool)                     ObjectGetInteger(0,aName,OBJPROP_RAY_LEFT));} 	
		
		/*!	
			Ray continuation to the right OBJPROP_RAY_RIGHT.
         \param  string aName - object name. 						
		 	\return  Type bool. True - there is a ray to the right, false - no ray.		
		*/  
      bool                    RayRight    (string aName)             {return( (bool)                     ObjectGetInteger(0,aName,OBJPROP_RAY_RIGHT));} 		
		
		/*!	
			The vertical line extends to all chart windows OBJPROP_RAY.
         \param  string aName - object name. 						
		 	\return  Type bool. True - extends to all windows, false - in only one subwindow.		
		*/  
      bool                    Ray         (string aName)             {return( (bool)                     ObjectGetInteger(0,aName,OBJPROP_RAY));} 		
		
		/*!	
			Display the full ellipse of the Fibonacci Arcs object OBJPROP_ELLIPSE.
         \param  string aName - object name. 						
      	\return  Type bool. True - full ellipse, false - arcs.		
		*/ 
      bool                    Ellipse     (string aName)             {return( (bool)                     ObjectGetInteger(0,aName,OBJPROP_ELLIPSE));} 			   
		
		/*!	
			Arrow code for the Arrow object OBJPROP_ARROWCODE.
         \param  string aName - object name. 						
      	\return  Arrow code (type char).
		*/ 
      char                    ArrowCode   (string aName)             {return( (char)                     ObjectGetInteger(0,aName,OBJPROP_ARROWCODE));}
		
		/*!	
			Visibility of the object on timeframes OBJPROP_TIMEFRAMES.
         \param  string aName - object name. 						
      	\return  A set of visibility flags (type long).
		*/ 
      long                    TimeFrames  (string aName)             {return(                            ObjectGetInteger(0,aName,OBJPROP_TIMEFRAMES));}
		
		/*!	
			Position of the anchor point OBJPROP_ANCHOR.
         \param  string aName - object name. 						
      	\return  Value of the anchor point (type long). For OBJ_ARROW one of the values of ENUM_ARROW_ANCHOR, for OBJ_LABEL and OBJ_TEXT - one of the values of ENUM_ANCHORPOINT.
		*/   
      long                    Anchor      (string aName)             {return(                            ObjectGetInteger(0,aName,OBJPROP_ANCHOR));}
		
		/*!	
			Distance in pixels along the X axis from the anchor corner OBJPROP_XDISTANCE.
         \param  string aName - object name. 						
      	\return  Value (type int).
		*/ 
      int                     XDistance   (string aName)             {return( (int)                      ObjectGetInteger(0,aName,OBJPROP_XDISTANCE));}	
		
		/*!	
			Distance in pixels along the Y axis from the anchor corner  OBJPROP_YDISTANCE.
         \param  string aName - object name. 						
      	\return  Value (type int).
		*/  
      int                     YDistance   (string aName)             {return( (int)                      ObjectGetInteger(0,aName,OBJPROP_YDISTANCE));}	
		
		/*!	
			Trend of the Gann object OBJPROP_DIRECTION.
         \param  string aName - object name. 						
      	\return  Value (type ENUM_GANN_DIRECTION).
		*/   
      ENUM_GANN_DIRECTION     Direction   (string aName)             {return( (ENUM_GANN_DIRECTION)      ObjectGetInteger(0,aName,OBJPROP_DIRECTION));}
		
		/*!	
			Level of Elliott wave marking OBJPROP_DEGREE.
         \param  string aName - object name. 						
      	\return  Value (type ENUM_ELLIOT_WAVE_DEGREE).
		*/   
      ENUM_ELLIOT_WAVE_DEGREE Degree      (string aName)             {return( (ENUM_ELLIOT_WAVE_DEGREE)  ObjectGetInteger(0,aName,OBJPROP_DEGREE));}
		
		/*!	
			Display lines for Elliott wave marking OBJPROP_DRAWLINES.
         \param  string aName - object name. 						
      	\return  Type bool. True - enabled, false - disabled.		
		*/  
      bool                    DrawLines   (string aName)             {return( (bool)                     ObjectGetInteger(0,aName,OBJPROP_DRAWLINES));} 
		
		/*!	
			Button state (pressed/unpressed) OBJPROP_STATE.
         \param  string aName - object name. 						
      	\return  Type bool. True - pressed, false - unpressed.
		*/ 
      bool                    State       (string aName)             {return( (bool)                     ObjectGetInteger(0,aName,OBJPROP_STATE));} 
		
		/*!	
			ID of the Chart object OBJPROP_CHART_ID.
         \param  string aName - object name. 						
      	\return  ID value (type long).
		*/ 
      long                    ChartChartID(string aName)             {return( (bool)                     ObjectGetInteger(0,aName,OBJPROP_CHART_ID));}
		
		/*!	
			Horizontal size of the object OBJPROP_XSIZE.
         \param  string aName - object name. 						
      	\return  Size value (òèï int).
		*/   
      int                     XSize       (string aName)             {return( (int)                      ObjectGetInteger(0,aName,OBJPROP_XSIZE));}	
		
		/*!	
			Vertical size of the object OBJPROP_YSIZE.
         \param  string aName - object name. 						
      	\return  Size value (òèï int).
		*/ 
      int                     YSize       (string aName)             {return( (int)                      ObjectGetInteger(0,aName,OBJPROP_YSIZE));}		
		
		/*!	
			X coordinate of the object scope start OBJPROP_XOFFSET.
         \param  string aName - object name. 						
      	\return  Value (type int).
		*/ 
      int                     XOffset     (string aName)             {return( (int)                      ObjectGetInteger(0,aName,OBJPROP_XOFFSET));}	
		
		/*!	
			Y coordinate of the object scope start OBJPROP_YOFFSET.
         \param  string aName - object name. 						
      	\return  Value (type int).
		*/ 
      int                     YOffset     (string aName)             {return( (int)                      ObjectGetInteger(0,aName,OBJPROP_YOFFSET));}	
		
		/*!	
			Timeframe of the Chart object OBJPROP_PERIOD.
         \param  string aName - object name. 						
      	\return  Value (type ENUM_TIMEFRAMES).
		*/  
      ENUM_TIMEFRAMES         Period      (string aName)             {return( (ENUM_TIMEFRAMES)          ObjectGetInteger(0,aName,OBJPROP_PERIOD));}
		
		/*!	
			Time scale display flag for the Chart object "Ãðàôèê" OBJPROP_DATE_SCALE.
         \param  string aName - object name. 						
      	\return  Type bool. True - there is a scale, false - no scale.
		*/ 
      bool                    DateScale   (string aName)             {return( (bool)                     ObjectGetInteger(0,aName,OBJPROP_DATE_SCALE));} 
		
		/*!	
			Price scale display flag for the Chart object OBJPROP_PRICE_SCALE.
         \param  string aName - object name. 						
      	\return  Type bool. True - there is a scale, false - no scale.
		*/  
      bool                    PriceScale  (string aName)             {return( (bool)                     ObjectGetInteger(0,aName,OBJPROP_PRICE_SCALE));} 
		
		/*!	
			Scale for the Chart object OBJPROP_CHART_SCALE.
         \param  string aName - object name. 						
      	\return  Value 1-5 (type int).
		*/  
      int                     ChartScale  (string aName)             {return( (int)                      ObjectGetInteger(0,aName,OBJPROP_CHART_SCALE));}		
		
		/*!	
			Background color OBJPROP_BGCOLOR.
         \param  string aName - object name. 						
		 	\return  Color value (type color).		
		*/  
      color                   BgColor     (string aName)             {return( (color)                    ObjectGetInteger(0,aName,OBJPROP_BGCOLOR));}
		
		/*!	
			Chart corner for binding an object OBJPROP_CORNER.
         \param  string aName - object name. 						
		 	\return  Value (type ENUM_BASE_CORNER).
		*/  
      ENUM_BASE_CORNER        Corner      (string aName)             {return( (ENUM_BASE_CORNER)         ObjectGetInteger(0,aName,OBJPROP_CORNER));}
		
		/*!	
			Frame type from the Rectangle Frame object OBJPROP_BORDER_TYPE.
         \param  string aName - object name. 						
		 	\return  Value (type ENUM_BORDER_TYPE).
		*/   
      ENUM_BORDER_TYPE        BorderType  (string aName)             {return( (ENUM_BORDER_TYPE)         ObjectGetInteger(0,aName,OBJPROP_BORDER_TYPE));}
		
		/*!	
			Price coordinate OBJPROP_PRICE.
         \param  string aName - object name,			
         \param   int aIndex - point number (from zero).
		 	\return  Value (type double).
		*/   
      double                  Price       (string aName,int aIndex)  {return(                            ObjectGetDouble(0,aName,OBJPROP_PRICE,aIndex));} 
		
		/*!	
			Level value OBJPROP_LEVELVALUE.
         \param  string aName - object name,			
         \param   int aIndex - Level index (from zero).
		 	\return  Value (type double).
		*/     
      double                  LevelValue  (string aName,int aIndex)  {return(                            ObjectGetDouble(0,aName,OBJPROP_LEVELVALUE,aIndex));}  
		
		/*!	
			Scale (property of Gann objects and the Fibonacci Arcs object) OBJPROP_SCALE.
         \param  string aName - object name. 						
		 	\return  Value (type double).
		*/   
      double                  Scale       (string aName)             {return(                            ObjectGetDouble(0,aName,OBJPROP_SCALE));}
		
		/*!	
			Angle OBJPROP_ANGLE.
         \param  string aName - object name. 						
		 	\return  Value (type double).
		*/ 
      double                  Angle       (string aName)             {return(                            ObjectGetDouble(0,aName,OBJPROP_ANGLE));}
		
		/*!	
			Deviation of the standard deviation channel OBJPROP_DEVIATION.
         \param  string aName - object name. 						
		 	\return  Value (type double).
		*/  
      double                  Deviation   (string aName)             {return(                            ObjectGetDouble(0,aName,OBJPROP_DEVIATION));}
		
		/*!	
			Text contained in the object OBJPROP_TEXT.
         \param  string aName - object name. 						
		 	\return  Text.
		*/  
      string                  Text        (string aName)             {return(                            ObjectGetString(0,aName,OBJPROP_TEXT));}
		
		/*!	
			Tooltip text. OBJPROP_TOOLTIP.
         \param  string aName - object name. 						
		 	\return  Text.
		 	\remark To disable tooltip, set value "\n".
		*/  
      string                  ToolTip     (string aName)             {return(                            ObjectGetString(0,aName,OBJPROP_TOOLTIP));}
		
		/*!	
			Level description. OBJPROP_LEVELTEXT.
         \param  string aName - object name,		
         \param   int aIndex - Level index (from zero).			
		 	\return  Text.
		*/   
      string                  LevelText   (string aName,int aIndex)  {return(                            ObjectGetString(0,aName,OBJPROP_LEVELTEXT,aIndex));} 
		
		/*!	
			Font name. OBJPROP_FONT.
         \param  string aName - object name. 						
		 	\return  Name (type string).
		*/   
      string                  Font        (string aName)             {return(                            ObjectGetString(0,aName,OBJPROP_FONT));}
		
		/*!	
			Image file name for the ON state OBJPROP_BMPFILE, modifier 0.
         \param  string aName - object name. 						
		 	\return  File name (type string).
		*/   
      string                  BmpFileOn   (string aName)             {return(                            ObjectGetString(0,aName,OBJPROP_BMPFILE,0));}
		
		/*!	
			Image file name for the OFF state OBJPROP_BMPFILE, modifier 1.
         \param  string aName - object name. 						
		 	\return  File name (type string).
		*/    
      string                  BmpFileOff  (string aName)             {return(                            ObjectGetString(0,aName,OBJPROP_BMPFILE,1));}       
		
		/*!	
			Symbol for the Chart object OBJPROP_SYMBOL.
         \param  string aName - object name. 						
		 	\return  Symbol (type string).
		*/  
      string                  Symbol      (string aName)             {return(                            ObjectGetString(0,aName,OBJPROP_SYMBOL));}  

      //+------------------------------------------------------------------+
      //|   Óñòàíîâêà ñâîéñòâ ïî èìåíè îáúåêòà.                            |
      //+------------------------------------------------------------------+          
      
		/*!	
			Set color OBJPROP_COLOR.
			\param  string aName - object name,
         \param		color aValue - color value.			
		*/  
      void SetColor        (string aName,color aValue)                        {ObjectSetInteger(0,aName,OBJPROP_COLOR,           aValue);}

		/*!	
			Set style OBJPROP_STYLE.
			\param  string aName - object name,
         \param		ENUM_LINE_STYLE aValue - style value.			
		*/
      void SetStyle        (string aName,ENUM_LINE_STYLE aValue)              {ObjectSetInteger(0,aName,OBJPROP_STYLE,           aValue);}

		/*!	
			Set width OBJPROP_WIDTH.
			\param  string aName - object name,
         \param		int aValue - width value.			
		*/ 
      void SetWidth        (string aName,int aValue)                          {ObjectSetInteger(0,aName,OBJPROP_WIDTH,           aValue);} 

		/*!	
			Locate onject in the background/foreground OBJPROP_BACK.
			\param  string aName - object name,
         \param		bool aValue - true/false (back/foreground).
		*/   
      void SetBack         (string aName,bool aValue)                         {ObjectSetInteger(0,aName,OBJPROP_BACK,            aValue);} 	

		/*!	
			Enable fill OBJPROP_FILL.
			\param  string aName - object name,
         \param		bool aValue - true/false (filling/edge).
		*/ 
      void SetFill         (string aName,bool aValue)                         {ObjectSetInteger(0,aName,OBJPROP_FILL,            aValue);} 		

		/*!	
			Enable selection OBJPROP_SELECTED.
			\param  string aName - object name,
         \param		bool aValue - true/false (selected/not).
		*/ 
      void SetSelected     (string aName,bool aValue)                         {ObjectSetInteger(0,aName,OBJPROP_SELECTED,        aValue);} 		

		/*!	
			Enabling text editing in the Edit object OBJPROP_READONLY.
			\param  string aName - object name,
         \param		bool aValue - true/false (prohibited/allowed).
		*/  
      void SetReadOnly     (string aName,bool aValue)                         {ObjectSetInteger(0,aName,OBJPROP_READONLY,        aValue);} 		

		/*!	
			Set time of one of the anchor points OBJPROP_TIME.
         \param		int aIndex - point number (from zero),
         \param  string aName - object name,
         \param		datetime aValue - time value.
		*/    
      void SetTime         (string aName,int aIndex,datetime aValue)          {ObjectSetInteger(0,aName,OBJPROP_TIME,            aIndex,aValue);}	

		/*!	
			Enable object selection OBJPROP_SELECTABLE.
			\param  string aName - object name,
         \param		bool aValue - true/false (allowed/not).
		*/ 
      void SetSelectable   (string aName,bool aValue)                         {ObjectSetInteger(0,aName,OBJPROP_SELECTABLE,      aValue);} 		

		/*!	
			Set the number of levels OBJPROP_LEVELS.
			\param  string aName - object name,
         \param		int aValue - the number of levels.
		*/  
      void SetLevels       (string aName,int aValue)                          {ObjectSetInteger(0,aName,OBJPROP_LEVELS,          aValue);}	

		/*!	
			Set the level color OBJPROP_LEVELCOLOR.
			\param  string aName - object name,
         \param   int aIndex - level index (from zero),
         \param   color aValue - color value.
		*/   
      void SetLevelColor   (string aName,int aIndex,color aValue)             {ObjectSetInteger(0,aName,OBJPROP_LEVELCOLOR,      aIndex,aValue);}		

		/*!	
			Set level style OBJPROP_LEVELSTYLE.
			\param  string aName - object name,
         \param   int aIndex - level index (from zero),
         \param   ENUM_LINE_STYLE aValue - Style value.
		*/  
      void SetLevelStyle   (string aName,int aIndex,ENUM_LINE_STYLE aValue)   {ObjectSetInteger(0,aName,OBJPROP_LEVELSTYLE,      aIndex,aValue);}

		/*!	
			Set level width OBJPROP_LEVELWIDTH.
			\param  string aName - object name,
         \param   int aIndex - level index (from zero),
         \param   int aValue - width value.
		*/  
      void SetLevelWidth   (string aName,int aIndex,int aValue)               {ObjectSetInteger(0,aName,OBJPROP_LEVELWIDTH,      aIndex,aValue);}		

		/*!	
			Set font size OBJPROP_FONTSIZE.
			\param  string aName - object name,
         \param   int aValue - size value.
		*/  
      void SetFontSize     (string aName,int aValue)                          {ObjectSetInteger(0,aName,OBJPROP_FONTSIZE,        aValue);}		   

		/*!	
			Enable a ray to the left OBJPROP_RAY_LEFT.
			\param  string aName - object name,
         \param   bool aValue - true/false (enabled/disabled).
		*/    
      void SetRayLeft      (string aName,bool aValue)                         {ObjectSetInteger(0,aName,OBJPROP_RAY_LEFT,        aValue);} 	

		/*!	
			Enable a ray to the right OBJPROP_RAY_RIGHT.
			\param  string aName - object name,
         \param   bool aValue - true/false (enabled/disabled).
		*/  
      void SetRayRight     (string aName,bool aValue)                         {ObjectSetInteger(0,aName,OBJPROP_RAY_RIGHT,       aValue);} 		

		/*!	
			Enable extension of a vertical line to subwindows OBJPROP_RAY.
			\param  string aName - object name,
         \param   bool aValue - true/false (enabled/disabled).
		*/   
      void SetRay          (string aName,bool aValue)                         {ObjectSetInteger(0,aName,OBJPROP_RAY,             aValue);} 		

		/*!	
			Enable display of full arcs of the Fibonacci Arcs object OBJPROP_ELLIPSE.
			\param  string aName - object name,
         \param   bool aValue - true/false (ellipse/arcs).
		*/ 
      void SetEllipse      (string aName,bool aValue)                         {ObjectSetInteger(0,aName,OBJPROP_ELLIPSE,         aValue);} 			   

		/*!	
			Set the arrow code OBJPROP_ARROWCODE.
			\param  string aName - object name,
         \param   char aValue - arrow code.
		*/ 
      void SetArrowCode    (string aName,int aValue)                          {ObjectSetInteger(0,aName,OBJPROP_ARROWCODE,       aValue);}

		/*!	
			Set object visibility on timeframes OBJPROP_TIMEFRAMES.
			\param  string aName - object name,
         \param   long aValue - a combination of flags.
		*/   
      void SetTimeFrames   (string aName,long aValue)                         {ObjectSetInteger(0,aName,OBJPROP_TIMEFRAMES,      aValue);}

		/*!	
			Set anchor point OBJPROP_ANCHOR.
			\param  string aName - object name,
         \param   long aValue - anchor point (ENUM_ARROW_ANCHOR or ENUM_ANCHORPOINT).
		*/   
      void SetAnchor       (string aName,long aValue)                         {ObjectSetInteger(0,aName,OBJPROP_ANCHOR,          aValue);}

		/*!	
			Set the distance along the X axis from the anchor corner OBJPROP_XDISTANCE.
			\param  string aName - object name,
         \param   int aValue - distance value.
		*/   
      void SetXDistance    (string aName,int aValue)                          {ObjectSetInteger(0,aName,OBJPROP_XDISTANCE,       aValue);}	

		/*!	
			Set the distance along the Y axis from the anchor corner OBJPROP_YDISTANCE.
			\param  string aName - object name,
         \param   int aValue - distance value.
		*/ 
      void SetYDistance    (string aName,int aValue)                          {ObjectSetInteger(0,aName,OBJPROP_YDISTANCE,       aValue);}	

		/*!	
			Set trend for the Gann object OBJPROP_DIRECTION.
			\param  string aName - object name,
         \param   ENUM_GANN_DIRECTION aValue - trend value.
		*/ 
      void SetDirection    (string aName,ENUM_GANN_DIRECTION aValue)          {ObjectSetInteger(0,aName,OBJPROP_DIRECTION,       aValue);}

		/*!	
			Set level of Elliot wave marking OBJPROP_DEGREE.
			\param  string aName - object name,
         \param   ENUM_ELLIOT_WAVE_DEGREE aValue - level value.
		*/ 
      void SetDegree       (string aName,ENUM_ELLIOT_WAVE_DEGREE aValue)      {ObjectSetInteger(0,aName,OBJPROP_DEGREE,          aValue);}

		/*!	
			Show the line of the Elliot wave marking OBJPROP_DRAWLINES.
			\param  string aName - object name,
         \param   bool aValue - true/false (on/off).
		*/ 
      void SetDrawLines    (string aName,bool aValue)                         {ObjectSetInteger(0,aName,OBJPROP_DRAWLINES,       aValue);} 

		/*!	
			Set button states.
			\param  string aName - object name,
         \param   bool aValue - true/false (on/off).
		*/  
      void SetState        (string aName,bool aValue)                         {ObjectSetInteger(0,aName,OBJPROP_STATE,           aValue);} 

		/*!	
			Set horizontal size OBJPROP_XSIZE.
			\param  string aName - object name,
         \param   int aValue - size value.
		*/   
      void SetXSize        (string aName,int aValue)                          {ObjectSetInteger(0,aName,OBJPROP_XSIZE,           aValue);}	

		/*!	
			Set vertical size OBJPROP_YSIZE.
			\param  string aName - object name,
         \param   int aValue - size value.
		*/  
      void SetYSize        (string aName,int aValue)                          {ObjectSetInteger(0,aName,OBJPROP_YSIZE,           aValue);}		

		/*!	
			Set the X coordinate of the scope start OBJPROP_XOFFSET.
			\param  string aName - object name,
         \param   int aValue - coordinate value.
		*/ 
      void SetXOffset      (string aName,int aValue)                          {ObjectSetInteger(0,aName,OBJPROP_XOFFSET,         aValue);}	

		/*!	
			Set the Y coordinate of the scope start OBJPROP_YOFFSET.
			\param  string aName - object name,
         \param   int aValue - coordinate value.
		*/ 
      void SetYOffset      (string aName,int aValue)                          {ObjectSetInteger(0,aName,OBJPROP_YOFFSET,         aValue);}	

		/*!	
			Set timeframe for the Chart object OBJPROP_PERIOD.
			\param  string aName - object name,
         \param   ENUM_TIMEFRAMES aValue - timeframe value.
		*/ 
      void SetPeriod       (string aName,ENUM_TIMEFRAMES aValue)              {ObjectSetInteger(0,aName,OBJPROP_PERIOD,          aValue);}

		/*!	
			Show/hide data scale for the Chart object OBJPROP_DATE_SCALE.
			\param  string aName - object name,
         \param   bool aValue - true/false (on/off).
		*/ 
      void SetDateScale    (string aName,bool aValue)                         {ObjectSetInteger(0,aName,OBJPROP_DATE_SCALE,      aValue);} 

		/*!	
			Show/hide price scale for the Chart object OBJPROP_PRICE_SCALE.
			\param  string aName - object name,
         \param   bool aValue - true/false (on/off).
		*/ 
      void SetPriceScale   (string aName,bool aValue)                         {ObjectSetInteger(0,aName,OBJPROP_PRICE_SCALE,     aValue);} 

		/*!	
			Set scale for the Chart object OBJPROP_CHART_SCALE.
			\param  string aName - object name,
         \param   int aValue - a value 1-5.
		*/  
      void SetChartScale   (string aName,int aValue)                          {ObjectSetInteger(0,aName,OBJPROP_CHART_SCALE,     aValue);}		

		/*!	
			Set background color OBJPROP_BGCOLOR.
			\param  string aName - object name,
         \param   color aValue - color value.
		*/    
      void SetBgColor      (string aName,color aValue)                        {ObjectSetInteger(0,aName,OBJPROP_BGCOLOR,         aValue);}

		/*!	
			Set chart corner for binding OBJPROP_CORNER.
			\param  string aName - object name,
         \param   ENUM_BASE_CORNER aValue - óãîë ãðàôèêà.
		*/  
      void SetCorner       (string aName,ENUM_BASE_CORNER aValue)             {ObjectSetInteger(0,aName,OBJPROP_CORNER,          aValue);}

		/*!	
			Set frame type for the Rectangle Frame object OBJPROP_BORDER_TYPE.
			\param  string aName - object name,
         \param   ENUM_BORDER_TYPE aValue - frame type.
		*/   
      void SetBorderType   (string aName,ENUM_BORDER_TYPE aValue)             {ObjectSetInteger(0,aName,OBJPROP_BORDER_TYPE,     aValue);}      

		/*!	
			Set price value OBJPROP_PRICE.
			\param  string aName - object name,
         \param   int aIndex - point number (from zero),
		 	\param  double aValue - value.
		*/  
      void SetPrice        (string aName,int aIndex,double aValue)            {ObjectSetDouble(0,aName,OBJPROP_PRICE,            aIndex,aValue);} 

		/*!	
			Set the level value OBJPROP_LEVELVALUE.
			\param  string aName - object name,
         \param   int aIndex - level index (from zero),
		 	\param  double aValue - value.
		*/  
      void SetLevelValue   (string aName,int aIndex,double aValue)            {ObjectSetDouble(0,aName,OBJPROP_LEVELVALUE,       aIndex,aValue);}  

		/*!	
			Set scale (property of Gann objects and the Fibonacci Arcs object) OBJPROP_SCALE.
			\param  string aName - object name,
		 	\param  double aValue - scale value.
		*/ 
      void SetScale        (string aName,double aValue)                       {ObjectSetDouble(0,aName,OBJPROP_SCALE,            aValue);}     

		/*!	
			Set corner OBJPROP_ANGLE.
			\param  string aName - object name,
		 	\param  double aValue - corner value OBJPROP_ANGLE.
		*/    
      void SetAngle        (string aName,double aValue)                       {ObjectSetDouble(0,aName,OBJPROP_ANGLE,            aValue);}

		/*!	
			Set width of the standard deviation channel OBJPROP_DEVIATION.
			\param  string aName - object name,
		 	\param  double aValue - width value (number of standard deviations).
		*/   
      void SetDeviation    (string aName,double aValue)                       {ObjectSetDouble(0,aName,OBJPROP_DEVIATION,        aValue);}

		/*!	
			Set text OBJPROP_TEXT.
			\param  string aName - object name,
		 	\param  string aValue - text.
		*/  
      void SetText         (string aName,string aValue)                       {ObjectSetString(0,aName,OBJPROP_TEXT,             aValue);}

		/*!	
			Set a tooltip OBJPROP_TOOLTIP.
			\param  string aName - object name,
		 	\param  string aValue - text.
		 	\remark To disable tooltip, set value "\n".		 	
		*/
      void SetToolTip      (string aName,string aValue)                       {ObjectSetString(0,aName,OBJPROP_TOOLTIP,          aValue);}

		/*!	
			Set level description OBJPROP_LEVELTEXT.
			\param  string aName - object name,
         \param   int aIndex - level index (from zero),
		 	\param  string aValue - text. 	
		*/  
      void SetLevelText    (string aName,int aIndex,string aValue)            {ObjectSetString(0,aName,OBJPROP_LEVELTEXT,        aIndex,aValue);} 

		/*!	
			Set font type OBJPROP_FONT.
			\param  string aName - object name,
		 	\param  string aValue - font name. 	
		*/ 
      void SetFont         (string aName,string aValue)                       {ObjectSetString(0,aName,OBJPROP_FONT,             aValue);} 

		/*!	
			Set image file for the ON state OBJPROP_BMPFILE, modifier 0.
			\param  string aName - object name,
		 	\param  string aValue - file name. 	
		*/  
      void SetBmpFileOn    (string aName,string aValue)                       {ObjectSetString(0,aName,OBJPROP_BMPFILE,          0,aValue);}       

		/*!	
			Set image file for the OFF state OBJPROP_BMPFILE, modifier 1.
			\param  string aName - object name,
		 	\param  string aValue - file name. 	
		*/  
      void SetBmpFileOff   (string aName,string aValue)                       {ObjectSetString(0,aName,OBJPROP_BMPFILE,          1,aValue);}       

		/*!	
			Set symbol for the Chart object OBJPROP_SYMBOL.
			\param  string aName - object name,
		 	\param  string aValue - symbol. 	
		*/  
      void SetSymbol       (string aName,string aValue)                       {ObjectSetString(0,aName,OBJPROP_SYMBOL,           aValue);}  
   
      //+------------------------------------------------------------------+
      //|   Get properties by chart ID and object name                     |
      //+------------------------------------------------------------------+         
      
		/*!	
			Color OBJPROP_COLOR.
			\param  long aChartID - Chart ID,
			\param  string aName - object name. 
		 	\return  Color value (type color).		
		*/  
      color                   Color       (long aChartID,string aName)             {return( (color)                    ObjectGetInteger(aChartID,aName,OBJPROP_COLOR));}
		
		/*!	
			Style OBJPROP_STYLE.
			\param  long aChartID - Chart ID,
         \param  string aName - object name. 			
		 	\return  Style value (type ENUM_LINE_STYLE).		
		*/        
      ENUM_LINE_STYLE         Style       (long aChartID,string aName)             {return( (ENUM_LINE_STYLE)          ObjectGetInteger(aChartID,aName,OBJPROP_STYLE));}
		
		/*!	
			Width OBJPROP_WIDTH.
			\param  long aChartID - Chart ID,
         \param  string aName - object name. 						
		 	\return  Width value (type int).		
		*/        
      int                     Width       (long aChartID,string aName)             {return( (int)                      ObjectGetInteger(aChartID,aName,OBJPROP_WIDTH));} 
		
		/*!	
			Locate object in the background OBJPROP_BACK.
			\param  long aChartID - Chart ID,
         \param  string aName - object name. 			
		 	\return  Type bool. True - in the background, false - in the foreground.		
		*/          
      bool                    Back        (long aChartID,string aName)             {return( (bool)                     ObjectGetInteger(aChartID,aName,OBJPROP_BACK));} 	
		
		/*!	
			Color filling of the object OBJPROP_FILL (for OBJ_RECTANGLE, OBJ_TRIANGLE, OBJ_ELLIPSE, OBJ_CHANNEL, OBJ_STDDEVCHANNEL, OBJ_REGRESSION)
			\param  long aChartID - Chart ID,
         \param  string aName - object name. 			
		 	\return  Type bool. True - filled, false - edge.	
		*/  
      bool                    Fill        (long aChartID,string aName)             {return( (bool)                     ObjectGetInteger(aChartID,aName,OBJPROP_FILL));} 		
		
		/*!	
			Object selection OBJPROP_SELECTED.
			\param  long aChartID - Chart ID,
         \param  string aName - object name. 			
		 	\return  Type bool. True - selected, false - not selected.	
		*/  
      bool                    Selected    (long aChartID,string aName)             {return( (bool)                     ObjectGetInteger(aChartID,aName,OBJPROP_SELECTED));} 		
		
		/*!	
			Text editing in the Input Box objectOBJPROP_SELECTED.
			\param  long aChartID - Chart ID,
         \param  string aName - object name. 			
		 	\return  Type bool. True - editing disabled, false - enabled.	
		*/  
      bool                    ReadOnly    (long aChartID,string aName)             {return( (bool)                     ObjectGetInteger(aChartID,aName,OBJPROP_READONLY));} 		
		
		/*!	
			Object Type OBJPROP_TYPE.
			\param  long aChartID - Chart ID,
         \param  string aName - object name. 			
		 	\return  Òèï ENUM_OBJECT.	
		*/  
      ENUM_OBJECT             Type        (long aChartID,string aName)             {return( (ENUM_OBJECT)              ObjectGetInteger(aChartID,aName,OBJPROP_TYPE));}
		
		/*!	
			Time of one of the object anchor points OBJPROP_TIME.
			\param   long aChartID - chart ID,
         \param   string aName - object name,
         \param   int aIndex - the index of the anchor point (starting from zero).
		 	\return  Time value (type datetime).		
		*/  
      datetime                Time        (long aChartID,string aName,int aIndex)  {return( (datetime)                 ObjectGetInteger(aChartID,aName,OBJPROP_TIME,aIndex));}	
		
		/*!	
			If the object can be selected OBJPROP_SELECTABLE.
			\param  long aChartID - Chart ID,
         \param  string aName - object name. 			
		 	\return  Type bool. True - selection allowed, false - forbidden.	
		*/   
      bool                    Selectable  (long aChartID,string aName)             {return( (bool)                     ObjectGetInteger(aChartID,aName,OBJPROP_SELECTABLE));} 		
		
		/*!	
			Object creation time OBJPROP_CREATETIME.
			\param  long aChartID - Chart ID,
         \param  string aName - object name. 						
		 	\return  Time value (type datetime).		
		*/  
      datetime                CreateTime  (long aChartID,string aName)             {return( (datetime)                 ObjectGetInteger(aChartID,aName,OBJPROP_CREATETIME));}	
		
		/*!	
			Number of levels OBJPROP_LEVELS).
			\param  long aChartID - Chart ID,
         \param  string aName - object name. 						
		 	\return  Value (type int).		
		*/  
      int                     Levels      (long aChartID,string aName)             {return( (int)                      ObjectGetInteger(aChartID,aName,OBJPROP_LEVELS));}	
		
		/*!	
			Level color OBJPROP_LEVELCOLOR.
			\param  long aChartID - Chart ID,
         \param   int aIndex - Level index (from zero).
         \param  string aName - object name. 			         
		 	\return  Color value (type color).		
		*/ 
      color                   LevelColor  (long aChartID,string aName,int aIndex)  {return( (color)                    ObjectGetInteger(aChartID,aName,OBJPROP_LEVELCOLOR,aIndex));}		
		
		/*!	
			Level style OBJPROP_LEVELSTYLE.
			\param  long aChartID - Chart ID,
         \param   int aIndex - Level index (from zero).
         \param  string aName - object name. 			         
		 	\return  Style value (type ENUM_LINE_STYLE).		
		*/  
      ENUM_LINE_STYLE         LevelStyle  (long aChartID,string aName,int aIndex)  {return( (ENUM_LINE_STYLE)          ObjectGetInteger(aChartID,aName,OBJPROP_LEVELSTYLE,aIndex));}	
		
		/*!	
			Level width OBJPROP_LEVELWIDTH.
			\param  long aChartID - Chart ID,
         \param   int aIndex - Level index (from zero).
         \param  string aName - object name. 			         
		 	\return  Width value (type int).		
		*/  
      int                     LevelWidth  (long aChartID,string aName,int aIndex)  {return( (int)                      ObjectGetInteger(aChartID,aName,OBJPROP_LEVELWIDTH,aIndex));}		
		
		/*!	
			Font size OBJPROP_FONTSIZE.
			\param  long aChartID - Chart ID,
         \param  string aName - object name. 						
		 	\return  Size value (òèï int).		
		*/  
      int                     FontSize    (long aChartID,string aName)             {return( (int)                      ObjectGetInteger(aChartID,aName,OBJPROP_FONTSIZE));}		   
		
		/*!	
			Ray continuation to the left OBJPROP_RAY_LEFT.
			\param  long aChartID - Chart ID,
         \param  string aName - object name. 						
		 	\return  Type bool. True - there is a ray to the left, false - no ray.		
		*/  
      bool                    RayLeft     (long aChartID,string aName)             {return( (bool)                     ObjectGetInteger(aChartID,aName,OBJPROP_RAY_LEFT));} 	
		
		/*!	
			Ray continuation to the right OBJPROP_RAY_RIGHT.
			\param  long aChartID - Chart ID,
         \param  string aName - object name. 						
		 	\return  Type bool. True - there is a ray to the right, false - no ray.		
		*/ 
      bool                    RayRight    (long aChartID,string aName)             {return( (bool)                     ObjectGetInteger(aChartID,aName,OBJPROP_RAY_RIGHT));} 		
		
		/*!	
			The vertical line extends to all chart windows OBJPROP_RAY.
			\param  long aChartID - Chart ID,
         \param  string aName - object name. 						
		 	\return  Type bool. True - extends to all windows, false - in only one subwindow.		
		*/  
      bool                    Ray         (long aChartID,string aName)             {return( (bool)                     ObjectGetInteger(aChartID,aName,OBJPROP_RAY));} 		
		
		/*!	
			Display the full ellipse of the Fibonacci Arcs object OBJPROP_ELLIPSE.
			\param  long aChartID - Chart ID,
         \param  string aName - object name. 						
      	\return  Type bool. True - full ellipse, false - arcs.		
		*/ 
      bool                    Ellipse     (long aChartID,string aName)             {return( (bool)                     ObjectGetInteger(aChartID,aName,OBJPROP_ELLIPSE));} 			   
		
		/*!	
			Arrow code for the Arrow object OBJPROP_ARROWCODE.
			\param  long aChartID - Chart ID,
         \param  string aName - object name. 						
      	\return  Arrow code (type char).
		*/ 
      char                    ArrowCode   (long aChartID,string aName)             {return( (char)                     ObjectGetInteger(aChartID,aName,OBJPROP_ARROWCODE));}
		
		/*!	
			Visibility of the object on timeframes OBJPROP_TIMEFRAMES.
			\param  long aChartID - Chart ID,
         \param  string aName - object name. 						
      	\return  A set of visibility flags (type long).
		*/ 
      long                    TimeFrames  (long aChartID,string aName)             {return(                            ObjectGetInteger(aChartID,aName,OBJPROP_TIMEFRAMES));}
		
		/*!	
			Position of the anchor point OBJPROP_ANCHOR.
			\param  long aChartID - Chart ID,
         \param  string aName - object name. 						
      	\return  Value of the anchor point (type long). For OBJ_ARROW one of the values of ENUM_ARROW_ANCHOR, for OBJ_LABEL and OBJ_TEXT - one of the values of ENUM_ANCHORPOINT.
		*/ 
      long                    Anchor      (long aChartID,string aName)             {return(                            ObjectGetInteger(aChartID,aName,OBJPROP_ANCHOR));}
		
		/*!	
			Distance in pixels along the X axis from the anchor corner OBJPROP_XDISTANCE.
			\param  long aChartID - Chart ID,
         \param  string aName - object name. 						
      	\return  Value (type int).
		*/ 
      int                     XDistance   (long aChartID,string aName)             {return( (int)                      ObjectGetInteger(aChartID,aName,OBJPROP_XDISTANCE));}	
		
		/*!	
			Distance in pixels along the Y axis from the anchor corner  OBJPROP_YDISTANCE.
			\param  long aChartID - Chart ID,
         \param  string aName - object name. 						
      	\return  Value (type int).
		*/  
      int                     YDistance   (long aChartID,string aName)             {return( (int)                      ObjectGetInteger(aChartID,aName,OBJPROP_YDISTANCE));}	
		
		/*!	
			Trend of the Gann object OBJPROP_DIRECTION.
			\param  long aChartID - Chart ID,
         \param  string aName - object name. 						
      	\return  Value (type ENUM_GANN_DIRECTION).
		*/   
      ENUM_GANN_DIRECTION     Direction   (long aChartID,string aName)             {return( (ENUM_GANN_DIRECTION)      ObjectGetInteger(aChartID,aName,OBJPROP_DIRECTION));}
		
		/*!	
			Level of Elliott wave marking OBJPROP_DEGREE.
			\param  long aChartID - Chart ID,
         \param  string aName - object name. 						
      	\return  Value (type ENUM_ELLIOT_WAVE_DEGREE).
		*/ 
      ENUM_ELLIOT_WAVE_DEGREE Degree      (long aChartID,string aName)             {return( (ENUM_ELLIOT_WAVE_DEGREE)  ObjectGetInteger(aChartID,aName,OBJPROP_DEGREE));}
		
		/*!	
			Display lines for Elliott wave marking OBJPROP_DRAWLINES.
			\param  long aChartID - Chart ID,
         \param  string aName - object name. 						
      	\return  Type bool. True - enabled, false - disabled.		
		*/  
      bool                    DrawLines   (long aChartID,string aName)             {return( (bool)                     ObjectGetInteger(aChartID,aName,OBJPROP_DRAWLINES));} 
		
		/*!	
			Button state (pressed/unpressed) OBJPROP_STATE.
			\param  long aChartID - Chart ID,
         \param  string aName - object name. 						
      	\return  Type bool. True - pressed, false - unpressed.
		*/ 
      bool                    State       (long aChartID,string aName)             {return( (bool)                     ObjectGetInteger(aChartID,aName,OBJPROP_STATE));} 
		
		/*!	
			ID of the Chart object OBJPROP_CHART_ID.
			\param  long aChartID - Chart ID,
         \param  string aName - object name. 						
      	\return  ID value (type long).
		*/ 
      long                    ChartChartID(long aChartID,string aName)             {return( (bool)                     ObjectGetInteger(aChartID,aName,OBJPROP_CHART_ID));}
		
		/*!	
			Horizontal size of the object OBJPROP_XSIZE.
			\param  long aChartID - Chart ID,
         \param  string aName - object name. 						
      	\return  Size value (òèï int).
		*/   
      int                     XSize       (long aChartID,string aName)             {return( (int)                      ObjectGetInteger(aChartID,aName,OBJPROP_XSIZE));}	
		
		/*!	
			Vertical size of the object OBJPROP_YSIZE.
			\param  long aChartID - Chart ID,
         \param  string aName - object name. 						
      	\return  Size value (òèï int).
		*/ 
      int                     YSize       (long aChartID,string aName)             {return( (int)                      ObjectGetInteger(aChartID,aName,OBJPROP_YSIZE));}		
		
		/*!	
			X coordinate of the object scope start OBJPROP_XOFFSET.
			\param  long aChartID - Chart ID,
         \param  string aName - object name. 						
      	\return  Value (type int).
		*/ 
      int                     XOffset     (long aChartID,string aName)             {return( (int)                      ObjectGetInteger(aChartID,aName,OBJPROP_XOFFSET));}	
		
		/*!	
			Y coordinate of the object scope start OBJPROP_YOFFSET.
			\param  long aChartID - Chart ID,
         \param  string aName - object name. 						
      	\return  Value (type int).
		*/ 
      int                     YOffset     (long aChartID,string aName)             {return( (int)                      ObjectGetInteger(aChartID,aName,OBJPROP_YOFFSET));}	
		
		/*!	
			Timeframe of the Chart object OBJPROP_PERIOD.
			\param  long aChartID - Chart ID,
         \param  string aName - object name. 						
      	\return  Value (type ENUM_TIMEFRAMES).
		*/ 
      ENUM_TIMEFRAMES         Period      (long aChartID,string aName)             {return( (ENUM_TIMEFRAMES)          ObjectGetInteger(aChartID,aName,OBJPROP_PERIOD));}
		
		/*!	
			Time scale display flag for the Chart object "Ãðàôèê" OBJPROP_DATE_SCALE.
			\param  long aChartID - Chart ID,
         \param  string aName - object name. 						
      	\return  Type bool. True - there is a scale, false - no scale.
		*/ 
      bool                    DateScale   (long aChartID,string aName)             {return( (bool)                     ObjectGetInteger(aChartID,aName,OBJPROP_DATE_SCALE));} 
		
		/*!	
			Price scale display flag for the Chart object OBJPROP_PRICE_SCALE.
			\param  long aChartID - Chart ID,
         \param  string aName - object name. 						
      	\return  Type bool. True - there is a scale, false - no scale.
		*/  
      bool                    PriceScale  (long aChartID,string aName)             {return( (bool)                     ObjectGetInteger(aChartID,aName,OBJPROP_PRICE_SCALE));} 
		
		/*!	
			Scale for the Chart object OBJPROP_CHART_SCALE.
			\param  long aChartID - Chart ID,
         \param  string aName - object name. 						
      	\return  Value 1-5 (type int).
		*/  
      int                     ChartScale  (long aChartID,string aName)             {return( (int)                      ObjectGetInteger(aChartID,aName,OBJPROP_CHART_SCALE));}		
		
		/*!	
			Background color OBJPROP_BGCOLOR.
			\param  long aChartID - Chart ID,
         \param  string aName - object name. 						
		 	\return  Color value (type color).		
		*/  
      color                   BgColor     (long aChartID,string aName)             {return( (color)                    ObjectGetInteger(aChartID,aName,OBJPROP_BGCOLOR));}
		
		/*!	
			Chart corner for binding an object OBJPROP_CORNER.
			\param  long aChartID - Chart ID,
         \param  string aName - object name. 						
		 	\return  Value (type ENUM_BASE_CORNER).
		*/  
      ENUM_BASE_CORNER        Corner      (long aChartID,string aName)             {return( (ENUM_BASE_CORNER)         ObjectGetInteger(aChartID,aName,OBJPROP_CORNER));}
		
		/*!	
			Frame type from the Rectangle Frame object OBJPROP_BORDER_TYPE.
			\param  long aChartID - Chart ID,
         \param  string aName - object name. 						
		 	\return  Value (type ENUM_BORDER_TYPE).
		*/   
      ENUM_BORDER_TYPE        BorderType  (long aChartID,string aName)             {return( (ENUM_BORDER_TYPE)         ObjectGetInteger(aChartID,aName,OBJPROP_BORDER_TYPE));}
		
		/*!	
			Price coordinate OBJPROP_PRICE.
			\param  long aChartID - Chart ID,
         \param  string aName - object name,			
         \param   int aIndex - point number (from zero).
		 	\return  Value (type double).
		*/ 
      double                  Price       (long aChartID,string aName,int aIndex)  {return(                            ObjectGetDouble(aChartID,aName,OBJPROP_PRICE,aIndex));} 
		
		/*!	
			Level value OBJPROP_LEVELVALUE.
			\param  long aChartID - Chart ID,
         \param  string aName - object name,			
         \param   int aIndex - Level index (from zero).
		 	\return  Value (type double).
		*/ 
      double                  LevelValue  (long aChartID,string aName,int aIndex)  {return(                            ObjectGetDouble(aChartID,aName,OBJPROP_LEVELVALUE,aIndex));}  
		
		/*!	
			Scale (property of Gann objects and the Fibonacci Arcs object) OBJPROP_SCALE.
			\param  long aChartID - Chart ID,
         \param  string aName - object name. 						
		 	\return  Value (type double).
		*/ 
      double                  Scale       (long aChartID,string aName)             {return(                            ObjectGetDouble(aChartID,aName,OBJPROP_SCALE));}
		
		/*!	
			Angle OBJPROP_ANGLE.
			\param  long aChartID - Chart ID,
         \param  string aName - object name. 						
		 	\return  Value (type double).
		*/ 
      double                  Angle       (long aChartID,string aName)             {return(                            ObjectGetDouble(aChartID,aName,OBJPROP_ANGLE));}
		
		/*!	
			Deviation of the standard deviation channel OBJPROP_DEVIATION.
			\param  long aChartID - Chart ID,
         \param  string aName - object name. 						
		 	\return  Value (type double).
		*/ 
      double                  Deviation   (long aChartID,string aName)             {return(                            ObjectGetDouble(aChartID,aName,OBJPROP_DEVIATION));}
		
		/*!	
			Text contained in the object OBJPROP_TEXT.
			\param  long aChartID - Chart ID,
         \param  string aName - object name. 						
		 	\return  Text.
		*/  
      string                  Text        (long aChartID,string aName)             {return(                            ObjectGetString(aChartID,aName,OBJPROP_TEXT));}
		
		/*!	
			Tooltip text. OBJPROP_TOOLTIP.
			\param  long aChartID - Chart ID,
         \param  string aName - object name. 						
		 	\return  Text.
		 	\remark To disable tooltip, set value "\n".
		*/  
      string                  ToolTip     (long aChartID,string aName)             {return(                            ObjectGetString(aChartID,aName,OBJPROP_TOOLTIP));}
		
		/*!	
			Level description. OBJPROP_LEVELTEXT.
			\param  long aChartID - Chart ID,
         \param  string aName - object name,		
         \param   int aIndex - Level index (from zero).			
		 	\return  Text.
		*/ 
      string                  LevelText   (long aChartID,string aName,int aIndex)  {return(                            ObjectGetString(aChartID,aName,OBJPROP_LEVELTEXT,aIndex));} 
		
		/*!	
			Font name. OBJPROP_FONT.
			\param  long aChartID - Chart ID,
         \param  string aName - object name. 						
		 	\return  Name (type string).
		*/   
      string                  Font        (long aChartID,string aName)             {return(                            ObjectGetString(aChartID,aName,OBJPROP_FONT));}
		
		/*!	
			Image file name for the ON state OBJPROP_BMPFILE, modifier 0.
			\param  long aChartID - Chart ID,
         \param  string aName - object name. 						
		 	\return  File name (type string).
		*/  
      string                  BmpFileOn   (long aChartID,string aName)             {return(                            ObjectGetString(aChartID,aName,OBJPROP_BMPFILE,0));}
		
		/*!	
			Image file name for the OFF state OBJPROP_BMPFILE, modifier 1.
			\param  long aChartID - Chart ID,
         \param  string aName - object name. 						
		 	\return  File name (type string).
		*/  
      string                  BmpFileOff  (long aChartID,string aName)             {return(                            ObjectGetString(aChartID,aName,OBJPROP_BMPFILE,1));}       
		
		/*!	
			Symbol for the Chart object OBJPROP_SYMBOL.
			\param  long aChartID - Chart ID,
         \param  string aName - object name. 						
		 	\return  Symbol (type string).
		*/  
      string                  Symbol      (long aChartID,string aName)             {return(                            ObjectGetString(aChartID,aName,OBJPROP_SYMBOL));}  
      
      //+------------------------------------------------------------------+
      //|   Óñòàíîâêà ñâîéñòâ ïî èäåíòèôèêàòîðó ãðàôèêà è èìåíè îáúåêòà    |
      //+------------------------------------------------------------------+     

		/*!	
			Set color OBJPROP_COLOR.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
         \param		color aValue - color value.			
		*/  
      void SetColor        (long aChartID,string aName,color aValue)                        {ObjectSetInteger(aChartID,aName,OBJPROP_COLOR,           aValue);}
		/*!	
			Set style OBJPROP_STYLE.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
         \param		ENUM_LINE_STYLE aValue - style value.			
		*/
      void SetStyle        (long aChartID,string aName,ENUM_LINE_STYLE aValue)              {ObjectSetInteger(aChartID,aName,OBJPROP_STYLE,           aValue);}
		
		/*!	
			Set width OBJPROP_WIDTH.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
         \param		int aValue - width value.			
		*/ 
      void SetWidth        (long aChartID,string aName,int aValue)                          {ObjectSetInteger(aChartID,aName,OBJPROP_WIDTH,           aValue);} 
		
		/*!	
			Locate onject in the background/foreground OBJPROP_BACK.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
         \param		bool aValue - true/false (back/foreground).
		*/ 
      void SetBack         (long aChartID,string aName,bool aValue)                         {ObjectSetInteger(aChartID,aName,OBJPROP_BACK,            aValue);} 	
		
		/*!	
			Enable fill OBJPROP_FILL.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
         \param		bool aValue - true/false (filling/edge).
		*/ 
      void SetFill         (long aChartID,string aName,bool aValue)                         {ObjectSetInteger(aChartID,aName,OBJPROP_FILL,            aValue);} 		
		
		/*!	
			Enable selection OBJPROP_SELECTED.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
         \param		bool aValue - true/false (selected/not).
		*/ 
      void SetSelected     (long aChartID,string aName,bool aValue)                         {ObjectSetInteger(aChartID,aName,OBJPROP_SELECTED,        aValue);} 		
		
		/*!	
			Enabling text editing in the Edit object OBJPROP_READONLY.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
         \param		bool aValue - true/false (prohibited/allowed).
		*/  
      void SetReadOnly     (long aChartID,string aName,bool aValue)                         {ObjectSetInteger(aChartID,aName,OBJPROP_READONLY,        aValue);} 		
		
		/*!	
			Set time of one of the anchor points OBJPROP_TIME.
			\param   long aChartID - chart ID,
         \param   int aIndex - point number (from zero),
         \param   string aName - object name,
         \param   datetime aValue - time value.
		*/    
      void SetTime         (long aChartID,string aName,int aIndex,datetime aValue)          {ObjectSetInteger(aChartID,aName,OBJPROP_TIME,            aIndex,aValue);}	
		
		/*!	
			Enable object selection OBJPROP_SELECTABLE.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
         \param		bool aValue - true/false (allowed/not).
		*/ 
      void SetSelectable   (long aChartID,string aName,bool aValue)                         {ObjectSetInteger(aChartID,aName,OBJPROP_SELECTABLE,      aValue);} 		
		
		/*!	
			Set the number of levels OBJPROP_LEVELS.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
         \param		int aValue - the number of levels.
		*/  
      void SetLevels       (long aChartID,string aName,int aValue)                          {ObjectSetInteger(aChartID,aName,OBJPROP_LEVELS,          aValue);}	
		
		/*!	
			Set the level color OBJPROP_LEVELCOLOR.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
         \param   int aIndex - level index (from zero),
         \param   color aValue - color value.
		*/ 
      void SetLevelColor   (long aChartID,string aName,int aIndex,color aValue)             {ObjectSetInteger(aChartID,aName,OBJPROP_LEVELCOLOR,      aIndex,aValue);}		
		
		/*!	
			Set level style OBJPROP_LEVELSTYLE.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
         \param   int aIndex - level index (from zero),
         \param   ENUM_LINE_STYLE aValue - Style value.
		*/  
      void SetLevelStyle   (long aChartID,string aName,int aIndex,ENUM_LINE_STYLE aValue)   {ObjectSetInteger(aChartID,aName,OBJPROP_LEVELSTYLE,      aIndex,aValue);}
		
		/*!	
			Set level width OBJPROP_LEVELWIDTH.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
         \param   int aIndex - level index (from zero),
         \param   int aValue - width value.
		*/  
      void SetLevelWidth   (long aChartID,string aName,int aIndex,int aValue)               {ObjectSetInteger(aChartID,aName,OBJPROP_LEVELWIDTH,      aIndex,aValue);}		
		
		/*!	
			Set font size OBJPROP_FONTSIZE.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
         \param   int aValue - size value.
		*/  
      void SetFontSize     (long aChartID,string aName,int aValue)                          {ObjectSetInteger(aChartID,aName,OBJPROP_FONTSIZE,        aValue);}		   
		
		/*!	
			Enable a ray to the left OBJPROP_RAY_LEFT.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
         \param   bool aValue - true/false (enabled/disabled).
		*/   
      void SetRayLeft      (long aChartID,string aName,bool aValue)                         {ObjectSetInteger(aChartID,aName,OBJPROP_RAY_LEFT,        aValue);} 	
		
		/*!	
			Enable a ray to the right OBJPROP_RAY_RIGHT.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
         \param   bool aValue - true/false (enabled/disabled).
		*/  
      void SetRayRight     (long aChartID,string aName,bool aValue)                         {ObjectSetInteger(aChartID,aName,OBJPROP_RAY_RIGHT,       aValue);} 		
		
		/*!	
			Enable extension of a vertical line to subwindows OBJPROP_RAY.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
         \param   bool aValue - true/false (enabled/disabled).
		*/ 
      void SetRay          (long aChartID,string aName,bool aValue)                         {ObjectSetInteger(aChartID,aName,OBJPROP_RAY,             aValue);} 		
		
		/*!	
			Enable display of full arcs of the Fibonacci Arcs object OBJPROP_ELLIPSE.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
         \param   bool aValue - true/false (ellipse/arcs).
		*/ 
      void SetEllipse      (long aChartID,string aName,bool aValue)                         {ObjectSetInteger(aChartID,aName,OBJPROP_ELLIPSE,         aValue);} 			   
		
		/*!	
			Set the arrow code OBJPROP_ARROWCODE.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
         \param   char aValue - arrow code.
		*/ 
      void SetArrowCode    (long aChartID,string aName,int aValue)                          {ObjectSetInteger(aChartID,aName,OBJPROP_ARROWCODE,       aValue);}
		
		/*!	
			Set object visibility on timeframes OBJPROP_TIMEFRAMES.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
         \param   long aValue - a combination of flags.
		*/   
      void SetTimeFrames   (long aChartID,string aName,long aValue)                         {ObjectSetInteger(aChartID,aName,OBJPROP_TIMEFRAMES,      aValue);}
		
		/*!	
			Set anchor point OBJPROP_ANCHOR.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
         \param   long aValue - anchor point (ENUM_ARROW_ANCHOR or ENUM_ANCHORPOINT).
		*/   
      void SetAnchor       (long aChartID,string aName,long aValue)                         {ObjectSetInteger(aChartID,aName,OBJPROP_ANCHOR,          aValue);}
		
		/*!	
			Set the distance along the X axis from the anchor corner OBJPROP_XDISTANCE.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
         \param   int aValue - distance value.
		*/   
      void SetXDistance    (long aChartID,string aName,int aValue)                          {ObjectSetInteger(aChartID,aName,OBJPROP_XDISTANCE,       aValue);}	
		
		/*!	
			Set the distance along the Y axis from the anchor corner OBJPROP_YDISTANCE.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
         \param   int aValue - distance value.
		*/ 
      void SetYDistance    (long aChartID,string aName,int aValue)                          {ObjectSetInteger(aChartID,aName,OBJPROP_YDISTANCE,       aValue);}	
		
		/*!	
			Set trend for the Gann object OBJPROP_DIRECTION.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
         \param   ENUM_GANN_DIRECTION aValue - trend value.
		*/ 
      void SetDirection    (long aChartID,string aName,ENUM_GANN_DIRECTION aValue)          {ObjectSetInteger(aChartID,aName,OBJPROP_DIRECTION,       aValue);}
		
		/*!	
			Set level of Elliot wave marking OBJPROP_DEGREE.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
         \param   ENUM_ELLIOT_WAVE_DEGREE aValue - level value.
		*/ 
      void SetDegree       (long aChartID,string aName,ENUM_ELLIOT_WAVE_DEGREE aValue)      {ObjectSetInteger(aChartID,aName,OBJPROP_DEGREE,          aValue);}
		
		/*!	
			Show the line of the Elliot wave marking OBJPROP_DRAWLINES.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
         \param   bool aValue - true/false (on/off).
		*/ 
      void SetDrawLines    (long aChartID,string aName,bool aValue)                         {ObjectSetInteger(aChartID,aName,OBJPROP_DRAWLINES,       aValue);} 
		
		/*!	
			Set button states.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
         \param   bool aValue - true/false (on/off).
		*/ 
      void SetState        (long aChartID,string aName,bool aValue)                         {ObjectSetInteger(aChartID,aName,OBJPROP_STATE,           aValue);} 
		
		/*!	
			Set horizontal size OBJPROP_XSIZE.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
         \param   int aValue - size value.
		*/ 
      void SetXSize        (long aChartID,string aName,int aValue)                          {ObjectSetInteger(aChartID,aName,OBJPROP_XSIZE,           aValue);}	
		
		/*!	
			Set vertical size OBJPROP_YSIZE.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
         \param   int aValue - size value.
		*/  
      void SetYSize        (long aChartID,string aName,int aValue)                          {ObjectSetInteger(aChartID,aName,OBJPROP_YSIZE,           aValue);}		
		
		/*!	
			Set the X coordinate of the scope start OBJPROP_XOFFSET.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
         \param   int aValue - coordinate value.
		*/ 
      void SetXOffset      (long aChartID,string aName,int aValue)                          {ObjectSetInteger(aChartID,aName,OBJPROP_XOFFSET,         aValue);}	
		
		/*!	
			Set the Y coordinate of the scope start OBJPROP_YOFFSET.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
         \param   int aValue - coordinate value.
		*/ 
      void SetYOffset      (long aChartID,string aName,int aValue)                          {ObjectSetInteger(aChartID,aName,OBJPROP_YOFFSET,         aValue);}	
		
		/*!	
			Set timeframe for the Chart object OBJPROP_PERIOD.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
         \param   ENUM_TIMEFRAMES aValue - timeframe value.
		*/ 
      void SetPeriod       (long aChartID,string aName,ENUM_TIMEFRAMES aValue)              {ObjectSetInteger(aChartID,aName,OBJPROP_PERIOD,          aValue);}
		
		/*!	
			Show/hide data scale for the Chart object OBJPROP_DATE_SCALE.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
         \param   bool aValue - true/false (on/off).
		*/ 
      void SetDateScale    (long aChartID,string aName,bool aValue)                         {ObjectSetInteger(aChartID,aName,OBJPROP_DATE_SCALE,      aValue);} 

		/*!	
			Show/hide price scale for the Chart object OBJPROP_PRICE_SCALE.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
         \param   bool aValue - true/false (on/off).
		*/ 
      void SetPriceScale   (long aChartID,string aName,bool aValue)                         {ObjectSetInteger(aChartID,aName,OBJPROP_PRICE_SCALE,     aValue);} 

		/*!	
			Set scale for the Chart object OBJPROP_CHART_SCALE.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
         \param   int aValue - a value 1-5.
		*/  
      void SetChartScale   (long aChartID,string aName,int aValue)                          {ObjectSetInteger(aChartID,aName,OBJPROP_CHART_SCALE,     aValue);}		

		/*!	
			Set background color OBJPROP_BGCOLOR.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
         \param   color aValue - color value.
		*/    
      void SetBgColor      (long aChartID,string aName,color aValue)                        {ObjectSetInteger(aChartID,aName,OBJPROP_BGCOLOR,         aValue);}

		/*!	
			Set chart corner for binding OBJPROP_CORNER.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
         \param   ENUM_BASE_CORNER aValue - óãîë ãðàôèêà.
		*/  
      void SetCorner       (long aChartID,string aName,ENUM_BASE_CORNER aValue)             {ObjectSetInteger(aChartID,aName,OBJPROP_CORNER,          aValue);}

		/*!	
			Set frame type for the Rectangle Frame object OBJPROP_BORDER_TYPE.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
         \param   ENUM_BORDER_TYPE aValue - frame type.
		*/  
      void SetBorderType   (long aChartID,string aName,ENUM_BORDER_TYPE aValue)             {ObjectSetInteger(aChartID,aName,OBJPROP_BORDER_TYPE,     aValue);}      

		/*!	
			Set price value OBJPROP_PRICE.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
         \param   int aIndex - point number (from zero),
		 	\param  double aValue - value.
		*/  
      void SetPrice        (long aChartID,string aName,int aIndex,double aValue)            {ObjectSetDouble(aChartID,aName,OBJPROP_PRICE,            aIndex,aValue);} 

		/*!	
			Set the level value OBJPROP_LEVELVALUE.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
         \param   int aIndex - level index (from zero),
		 	\param  double aValue - value.
		*/  
      void SetLevelValue   (long aChartID,string aName,int aIndex,double aValue)            {ObjectSetDouble(aChartID,aName,OBJPROP_LEVELVALUE,       aIndex,aValue);}  

		/*!	
			Set scale (property of Gann objects and the Fibonacci Arcs object) OBJPROP_SCALE.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
		 	\param  double aValue - scale value.
		*/ 
      void SetScale        (long aChartID,string aName,double aValue)                       {ObjectSetDouble(aChartID,aName,OBJPROP_SCALE,            aValue);}     

		/*!	
			Set corner OBJPROP_ANGLE.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
		 	\param  double aValue - corner value OBJPROP_ANGLE.
		*/   
      void SetAngle        (long aChartID,string aName,double aValue)                       {ObjectSetDouble(aChartID,aName,OBJPROP_ANGLE,            aValue);}

		/*!	
			Set width of the standard deviation channel OBJPROP_DEVIATION.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
		 	\param  double aValue - width value (number of standard deviations).
		*/ 
      void SetDeviation    (long aChartID,string aName,double aValue)                       {ObjectSetDouble(aChartID,aName,OBJPROP_DEVIATION,        aValue);}

		/*!	
			Set text OBJPROP_TEXT.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
		 	\param  string aValue - text.
		*/ 
      void SetText         (long aChartID,string aName,string aValue)                       {ObjectSetString(aChartID,aName,OBJPROP_TEXT,             aValue);}

		/*!	
			Set a tooltip OBJPROP_TOOLTIP.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
		 	\param  string aValue - text.
		 	\remark To disable tooltip, set value "\n".		 	
		*/
      void SetToolTip      (long aChartID,string aName,string aValue)                       {ObjectSetString(aChartID,aName,OBJPROP_TOOLTIP,          aValue);}

		/*!	
			Set level description OBJPROP_LEVELTEXT.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
         \param   int aIndex - level index (from zero),
		 	\param  string aValue - text. 	
		*/  
      void SetLevelText    (long aChartID,string aName,int aIndex,string aValue)            {ObjectSetString(aChartID,aName,OBJPROP_LEVELTEXT,        aIndex,aValue);} 

		/*!	
			Set font type OBJPROP_FONT.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
		 	\param  string aValue - font name. 	
		*/ 
      void SetFont         (long aChartID,string aName,string aValue)                       {ObjectSetString(aChartID,aName,OBJPROP_FONT,             aValue);} 

		/*!	
			Set image file for the ON state OBJPROP_BMPFILE, modifier 0.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
		 	\param  string aValue - file name. 	
		*/  
      void SetBmpFileOn    (long aChartID,string aName,string aValue)                       {ObjectSetString(aChartID,aName,OBJPROP_BMPFILE,          0,aValue);}       

		/*!	
			Set image file for the OFF state OBJPROP_BMPFILE, modifier 1.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
		 	\param  string aValue - file name. 	
		*/  
      void SetBmpFileOff   (long aChartID,string aName,string aValue)                       {ObjectSetString(aChartID,aName,OBJPROP_BMPFILE,          1,aValue);}       

		/*!	
			Set symbol for the Chart object OBJPROP_SYMBOL.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
		 	\param  string aValue - symbol. 	
		*/  
      void SetSymbol       (long aChartID,string aName,string aValue)                       {ObjectSetString(aChartID,aName,OBJPROP_SYMBOL,           aValue);}  

      //+------------------------------------------------------------------+
      //|   Other Methods                                                  |
      //+------------------------------------------------------------------+         

      // === Delete ===

		/*!	
			Delete the attached object.
		*/ 
      void Delete(){ObjectDelete(m_id,m_name);} 
		
		/*!	
			Delete an object by its name.
			\param  string aName - object name.
		*/       
      void Delete(string aName){ObjectDelete(0,aName);} 
		
		/*!	
			Delete an object by the chart ID and name.
			\param  long aChartID - Chart ID,
			\param  string aName - object name.
		*/       
      void Delete(long aChartID,string aName){ObjectDelete(aChartID,aName);} 

      // === Move ===

		/*!	
			Move the attached object.
			\param   int aIndex - point number (from zero),
			\param   datetime aTime  - time value,
			\param   double aPrice - vertical value.
		*/ 
      void Move(int aIndex,datetime aTime,double aPrice){
         ObjectMove(m_id,m_name,aIndex,aTime,aPrice);   
      }
      
		/*!	
			Move an object by its name.
			\param  string aName - object name,
			\param   int aIndex - point number (from zero),
			\param   datetime aTime  - time value,
			\param   double aPrice - vertical value.			
		*/         
      void Move(string aName,int aIndex,datetime aTime,double aPrice){
         ObjectMove(0,aName,aIndex,aTime,aPrice);   
      }    
      
		/*!	
			Move an object by the chart ID and name.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
			\param   int aIndex - point number (from zero),
			\param   datetime aTime  - time value,
			\param   double aPrice - vertical value.			
		*/           
      void Move(long aChartID,string aName,int aIndex,datetime aTime,double aPrice){
         ObjectMove(aChartID,aName,aIndex,aTime,aPrice);   
      }
      
      // === Search ===
           
		/*!	
			Search for an attached object.
			\return  Subwindow number , -1 if the object does not exist (type int). 
		*/ 
      int Find(){
         return(ObjectFind(m_id,m_name));
      }  
      
		/*!	
			Searching by name.
			\param  string aName - object name.
			\return  Subwindow number , -1 if the object does not exist (type int). 
		*/              
      int Find(string aName){
         return(ObjectFind(0,aName));
      }    
      
		/*!	
			Search by the chart ID and name.
			\param  long aChartID - Chart ID,
			\param  string aName - object name.
			\return  Subwindow number , -1 if the object does not exist (type int). 
		*/         
      int Find(long aChartID,string aName){
         return(ObjectFind(aChartID,aName));
      }   
      
      // === Get time by value ===
      
		/*!	
			Get time by value for an attached object.
			\param  double aValue - value,
			\param  int aLineID - line number (from zero).
			\return  Time (type datetime). 
		*/ 
      datetime GetTimeByValue(double aValue,int aLineID=0){
         return(ObjectGetTimeByValue(m_id,m_name,aValue,aLineID));
      }         
      
		/*!	
			Get time by value and by the object name.
			\param  string aName - object name,
			\param  double aValue - value,
			\param  int aLineID - line number (from zero).
			\return  Time (type datetime). 
		*/       
      datetime GetTimeByValue(string aName,double aValue,int aLineID=0){
         return(ObjectGetTimeByValue(0,aName,aValue,aLineID));
      }    

		/*!	
			Get time by value, chart ID and by the object name.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,			
			\param  double aValue - value,
			\param  int aLineID - line number (from zero).
			\return  Time (type datetime). 
		*/ 	      
      datetime GetTimeByValue(long aChartID,string aName,double aValue,int aLineID=0){
         return(ObjectGetTimeByValue(aChartID,aName,aValue,aLineID));
      }   

      // === Get value by time ===
      
		/*!	
			Get value by time for an attached object.
			\param  datetime aTime - time,
			\param  int aLineID - line number (from zero).
			\return Value (type double). 
		*/ 
      double GetValueByTime(datetime aTime,int aLineID=0){
         return(ObjectGetValueByTime(m_id,m_name,aTime,aLineID));
      }   
      
		/*!	
			Get value by time and by the object name.
			\param  string aName - object name,	
			\param  datetime aTime - time,
			\param  int aLineID - line number (from zero).
			\return Value (type double). 
		*/             
      double GetValueByTime(string aName,datetime aTime,int aLineID=0){
         return(ObjectGetValueByTime(0,aName,aTime,aLineID));
      }
          
		/*!	
			Get value by time, chart ID and by the object name.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,	
			\param  datetime aTime - time,
			\param  int aLineID - line number (from zero).
			\return Value (type double). 
		*/         
      double GetValueByTime(long aChartID,string aName,datetime aTime,int aLineID=0){
         return(ObjectGetValueByTime(aChartID,aName,aTime,aLineID));
      } 
      

      // === === === === ===
   
      /*!
         The total number of graphical objects.   
         \param   aChartID=0 - chart ID,
         \param   int aSubWindow=-1 - subwindow number,
         \param   int aType=-1 - object type.
      */      
      int Total(int aChartID=0,int aSubWindow=-1,int aType=-1){
         return(ObjectsTotal(aChartID,aSubWindow,aType));
      }   
      
      /*!
         Update chart to which the object is attached.   
      */ 
      void Redraw(){
         ChartRedraw(m_id);
      }  
      /*!
         Update the specified chart.  
         \param long aChartID - chart ID. 
      */              
      void Redraw(long aChartID){
         ChartRedraw(aChartID);
      }         
          
      // === v2 ===
        
		/*!	
			Simultaneously set distances along the X axis (OBJPROP_XDISTANCE) and the Y axis (OBJPROP_YDISTANCE) of the base corner.
         \param   int aValueX - X distance value,
         \param   int aValueY - Y distance value.
		*/   
      void SetXYDistance(int aValueX,int aValueY){
         ObjectSetInteger(m_id,m_name,OBJPROP_XDISTANCE,aValueX);
         ObjectSetInteger(m_id,m_name,OBJPROP_YDISTANCE,aValueY);
      }

		/*!	
			Simultaneously set distances along the X axis (OBJPROP_XDISTANCE) and the Y axis (OBJPROP_YDISTANCE) of the base corner.
			\param  string aName - object name,
         \param   int aValueX - X distance value,
         \param   int aValueY - Y distance value.
		*/  
      void SetXYDistance(string aName,int aValueX,int aValueY){
         ObjectSetInteger(0,aName,OBJPROP_XDISTANCE,aValueX);
         ObjectSetInteger(0,aName,OBJPROP_YDISTANCE,aValueY);
      }         	

		/*!	
			Simultaneously set distances along the X axis (OBJPROP_XDISTANCE) and the Y axis (OBJPROP_YDISTANCE) of the base corner.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
         \param   int aValueX - X distance value,
         \param   int aValueY - Y distance value.
		*/  
      void SetXYDistance(long aChartID,string aName,int aValueX,int aValueY){
         ObjectSetInteger(aChartID,aName,OBJPROP_XDISTANCE,aValueX);
         ObjectSetInteger(aChartID,aName,OBJPROP_YDISTANCE,aValueY);         
      }

       
		/*!	
			Simultaneously set sizes OBJPROP_XSIZE and OBJPROP_YSIZE.
         \param   int aValueX - X size value,
         \param   int aValueY - Y distance value.         
		*/       
      void SetXYSize(int aValueX,int aValueY){
         ObjectSetInteger(m_id,m_name,OBJPROP_XSIZE,aValueX);
         ObjectSetInteger(m_id,m_name,OBJPROP_YSIZE,aValueY);         
      }	
      
		/*!	
			Simultaneously set sizes OBJPROP_XSIZE and OBJPROP_YSIZE.
			\param  string aName - object name,
         \param   int aValueX - X size value,
         \param   int aValueY - Y distance value.         
		*/       
      void SetXYSize(string aName,int aValueX,int aValueY){
         ObjectSetInteger(0,aName,OBJPROP_XSIZE,aValueX);
         ObjectSetInteger(0,aName,OBJPROP_YSIZE,aValueY);         
      }	      
      
		/*!	
			Simultaneously set sizes OBJPROP_XSIZE and OBJPROP_YSIZE.
			\param  long aChartID - Chart ID,
			\param  string aName - object name,
         \param   int aValueX - X size value,
         \param   int aValueY - Y distance value.         
		*/       
      void SetXYSize(long aChartID,string aName,int aValueX,int aValueY){
         ObjectSetInteger(aChartID,aName,OBJPROP_XSIZE,aValueX);
         ObjectSetInteger(aChartID,aName,OBJPROP_YSIZE,aValueY);         
      }	 
};

CGraphicObjectShell g;

//+------------------------------------------------------------------+
//|                                                                  |
//|         Class CWorkPiece                                         |
//|                                                                  |
//+------------------------------------------------------------------+

/*!
	\brief   Quick creation of graphical objects specifying properties in parameters.
	
	\details The class contains methods for quick creation of graphical objects with
	         properties set in one code string. Properties of the graphical object that you create 
	         are specified in the parameters when calling creation methods.

   \remark	The class has been already declared in a file named "w".
*/   

class CWorkPiece{
   public:
		/*!	
			Rectangular label.
            \param		string aName="Canvas" - name,
            \param		int aSubWindow=0 - subwindow,
            \param		int aLeft=100 - position from the left chart edge,
            \param		int aTop=100 - position from the upper chart edge,
            \param		int aWidth=300 - width,
            \param		int aHeight=150 - height,
            \param		color aColorBg=clrIvory - background color,
            \param		int aColorBorder=clrDimGray - edge color.
            \remark	   Anchor point - upper left corner.
		*/
      void Canvas(string aName="Canvas",int aSubWindow=0,int aLeft=100,int aTop=100,int aWidth=300,int aHeight=150,color aColorBg=clrIvory,int aColorBorder=clrDimGray){
         g.CreateRectangleLabel(aName,aSubWindow); // Create a rectangular label
         g.SetXDistance(aLeft); // Set X coordinates
         g.SetYDistance(aTop); // Set Y coordinates
         g.SetXSize(aWidth); // Set width
         g.SetYSize(aHeight); // Set height
         g.SetBgColor(aColorBg); // Set background color
         g.SetColor(aColorBorder); // Set frame color
         g.SetCorner(CORNER_LEFT_UPPER); // Set anchor point
         g.SetBorderType(BORDER_FLAT); // Set border type
         g.SetTimeFrames(OBJ_ALL_PERIODS); // Set visibility on all timeframes
         g.SetSelected(false); // Unselect
         g.SetSelectable(false); // Disable object selection option
         g.SetWidth(1); // Set border width
         g.SetStyle(STYLE_SOLID); // Set border style
      }

		/*!	
			Label.
            \param		string aName="Label" - name,
            \param		int aSubWindow=0 - subwindow,
            \param		int aLeft=100 - position from the left chart edge,
            \param      int aTop=100 - position from the upper chart edge,
            \param      string aText="Label" - text,
            \param      int aColor=clrDimGray - color,
            \param      int aFontSize=8 - font size,
            \param      string aFont="Arial" - font.
            \remark	   Anchor point - upper left corner.
		*/
      void Label(string aName="Label",int aSubWindow=0,int aLeft=100,int aTop=100,string aText="Label",int aColor=clrDimGray,int aFontSize=8,string aFont="Arial"){
         g.CreateLabel(aName,aSubWindow);
         g.SetXDistance(aLeft);
         g.SetYDistance(aTop);
         g.SetText(aText);
         g.SetColor(aColor);
         g.SetFontSize(aFontSize);
         g.SetFont(aFont);
         g.SetCorner(CORNER_LEFT_UPPER);
         g.SetAnchor(ANCHOR_LEFT_UPPER);         
         g.SetSelected(false);
         g.SetSelectable(false);
      }  
      
		/*!	
			Button.
            \param		string aName="Button" - name,
            \param		int aSubWindow=0 - subwindow,
            \param		int aLeft=100 - position from the left chart edge,
            \param		int aTop=100 - position from the upper chart edge,
            \param		int aWidth=40 - width,
            \param		int aHeight=15 - height,
            \param		string aText="Button" - text,
            \param		color aColorBg=clrSilver - button color,
            \param		color aColorText=clrBlack - text color,
            \param		int aFontSize=7 - text font size,
            \param		string aFont="Arial" - text font.
            \remark	   Anchor point - upper left corner.
 		*/
      void Button(string aName="Button",int aSubWindow=0,int aLeft=100,int aTop=100,int aWidth=40,int aHeight=15,string aText="Button",color aColorBg=clrSilver,color aColorText=clrBlack,int aFontSize=7,string aFont="Arial"){
         g.CreateButton(aName,aSubWindow);
         g.SetXDistance(aLeft);
         g.SetYDistance(aTop);
         g.SetXSize(aWidth);
         g.SetYSize(aHeight);
         g.SetText(aText);
         g.SetColor(aColorText);
         g.SetBgColor(aColorBg);
         g.SetFontSize(aFontSize);
         g.SetFont(aFont);
         g.SetCorner(CORNER_LEFT_UPPER);
         g.SetSelected(false);
         g.SetSelectable(false);
      } 
      
		/*!	
			Edit Box.
            \param		string aName="Edit" - name,
            \param		int aSubWindow=0 - subwindow,
            \param		int aLeft=100 - position from the left chart edge,
            \param		int aTop=100 - position from the upper chart edge,
            \param		int aWidth=40 - width,
            \param		int aHeight=15 - height,
            \param		string aText="Edit" - text,
            \param		color aColorBg=clrSnow - background color,
            \param		color aColorText=clrDimGray - text and border color,
            \param		int aFontSize=7 - font size,
            \param		string aFont="Arial" - font.			
            \remark	   Anchor point - upper left corner.
 		*/
      void Edit(string aName="Edit",int aSubWindow=0,int aLeft=100,int aTop=100,int aWidth=40,int aHeight=15,string aText="Edit",color aColorBg=clrSnow,color aColorText=clrDimGray,int aFontSize=7,string aFont="Arial"){
         g.CreateEdit(aName,aSubWindow);
         g.SetXDistance(aLeft);
         g.SetYDistance(aTop);
         g.SetXSize(aWidth);
         g.SetYSize(aHeight);
         g.SetText(aText);
         g.SetColor(aColorText);
         g.SetBgColor(aColorBg);
         g.SetFontSize(aFontSize);
         g.SetFont(aFont);
         g.SetCorner(CORNER_LEFT_UPPER);
         g.SetSelected(false);
         g.SetSelectable(false);
         g.SetReadOnly(false);
      } 
      
		/*!	
			A frame with a text.
            \param		string aName="Frame" - name,
            \param		int aSubWindow=0 - subwindow,
            \param		int aLeft=100 - position from the left chart edge,
            \param		int aTop=100 - position from the upper chart edge,
            \param		int aWidth=50 - width,
            \param		int aHeight=50 - height,
            \param		string aCaption="Frame" - text,
            \param		int aCaptionWidth=31 - width of space for the text,
            \param		color aColorBg=clrIvory - background color,
            \param		color aColorBorder=clrDimGray - frame color,
            \param		color aColorCaption=clrDimGray - text color.
            \remark	   Anchor point - upper left corner.
            \remark	   The frame consists of graphical objects:  OBJ_RECTANGLE_LABEL (two) and 
                        OBJ_LABEL. One rectangular label is basic, the second one covers the frame 
                        under the text. A frame can be created without a title, if the parameter aCaption 
                        has the value "", in this case the frame consists of one rectangular label. 
                        Names of all graphical objects start with the text aName. To create 
                        the name of the main rectangular label, text "_Frame" is added to the aName tag, 
                        for a text, - "_FrameL", for a label that covers a frame under the text - "_FrameC". 
 		*/
      void Frame(string aName="Frame",int aSubWindow=0,int aLeft=100,int aTop=100,int aWidth=50,int aHeight=50,string aCaption="Frame",int aCaptionWidth=31,color aColorBg=clrIvory,color aColorBorder=clrDimGray,color aColorCaption=clrDimGray){
         Canvas(aName+"_Frame",0,aLeft,aTop,aWidth,aHeight,aColorBg,aColorBorder);
            if(aCaption!=""){
               Canvas(aName+"_FrameC",aSubWindow,aLeft+4,aTop+2,aCaptionWidth,1,aColorBg,aColorBg);
               Label(aName+"_FrameL",aSubWindow,aLeft+6,aTop-5,aCaption,aColorCaption,7,"Arial");
            }               
      }
      
		/*!	
			Delete a frame with a text.
         \param   string aName="Frame" - name.
 		*/
      void FrameDelete(string aName="Frame"){
         ObjectDelete(0,aName+"_Frame");
         ObjectDelete(0,aName+"_FrameC");
         ObjectDelete(0,aName+"_FrameL");         
      }  
           
		/*!	
			Delete an object by its name on "its" chart.
         \param   string aName="Frame" - name.
 		*/
      void Delete(string aName){
         ObjectDelete(0,aName);
      }   
         
		/*!	
			Redraw "its" chart.
 		*/
      void Redraw(){
         ChartRedraw(0);
      }         
};

CWorkPiece w;

//+------------------------------------------------------------------+
//|                                                                  |
//|         CLASS CColorSchemes                                      |
//|                                                                  |
//+------------------------------------------------------------------+

/*!
	\brief   A set of color schemes.
	
	\details The class is used for receiving the color of a used color scheme
	         by its index.

   \remark	The class has been already declared in a file named "ClrScheme".
*/   

class CColorSchemes{
   private:
      int m_ShemeIndex;
   public:
   		/*!	
   			Select a color scheme.
               \param		int aShemeIndex - index of the color scheme.
   		*/   
         void SetScheme(int aShemeIndex){ // Set index of a color scheme
            m_ShemeIndex=aShemeIndex;
         }
   		/*!	
   			Get color by its index.
               \param		int aColorIndex - color index in a scheme.
               \return		Color value.
   		*/          
         color Color(int aColorIndex){
            color m_Color[7][32];  // The first figure - number of color schemes, second - color index in a scheme
            // === default ===
               // CInputBox
               m_Color[0][0]=clrSnow;           // Text box background color
               m_Color[0][1]=clrDimGray;        // Color of the text and border of a text box
               m_Color[0][2]=clrDimGray;        // Text color
               m_Color[0][3]=clrPink;           // Warning color          
               // CSpinInputBox (additional, rest like CInputBox)
               m_Color[0][4]=clrSilver;         // Color of buttons
               m_Color[0][5]=clrLightGray;      // Color of shimmering
               // CVScrollBar, CHScrollBar (independent colors)
               m_Color[0][6]=clrDimGray;        // Border color
               m_Color[0][7]=clrLightGray;      // Bar color
               m_Color[0][8]=clrSilver;         // Color of buttons
               m_Color[0][9]=clrPink;           // Warning color
               m_Color[0][10]=clrDimGray;       // Color of text (arrows)
               m_Color[0][11]=clrSnow;          // Color of a selected slider
               m_Color[0][12]=clrLightGray;     // Color of button shimmering
               m_Color[0][13]=clrGainsboro;     // Color of slider shimmering
               // CCheckBox, CRadioGroup use colors of CInputBox (except warning color, which is not available in CCheckBox, CRadioGroup)
               // CList - background and text color from CInputBox, proper selection color
               m_Color[0][14]=clrPaleTurquoise; // Color of a selected point
               // CHMenu, CVMenu
               m_Color[0][15]=clrWhiteSmoke;    // Color of a background with selected points
               m_Color[0][16]=clrGainsboro;     // Background color without selected points
               m_Color[0][17]=clrRed;           // Check mark color
               // CHProgress
               m_Color[0][18]=clrLightGray;     // Background color   
               m_Color[0][19]=clrDimGray;       // Border color
               m_Color[0][20]=clrLightSkyBlue;  // Band color
               m_Color[0][21]=clrDimGray;       // Text color
               // CDialer
               m_Color[0][22]=clrLightGray;     // Background color
               m_Color[0][23]=clrDimGray;       // Border color
               m_Color[0][24]=clrWhiteSmoke;    // Color of buttons with numbers
               m_Color[0][25]=clrDimGray;       // Text color
               m_Color[0][26]=clrMistyRose;     // Color of reset button
               m_Color[0][27]=clrPaleGreen;     // Color of the ok button
               m_Color[0][28]=clrPaleTurquoise; // Close button color
               m_Color[0][29]=clrSnow;          // Color of a text box background
               m_Color[0][30]=clrDimGray;       // Text color in the text box
               m_Color[0][31]=clrPink;          // Warning color  
  
            // === yellow-brown ===
            
               m_Color[1][0]=clrLightYellow;    // Text box background color
               m_Color[1][1]=clrBrown;          // Color of the text and border of a text box
               m_Color[1][2]=clrBrown;          // Text color
               m_Color[1][3]=clrLightPink;      // Warning color          
               // CSpinInputBox (additional, rest like CInputBox)
               m_Color[1][4]=clrBurlyWood;      // Color of buttons
               m_Color[1][5]=clrNavajoWhite;    // Color of shimmering
               // CVScrollBar, CHScrollBar (independent colors)
               m_Color[1][6]=clrBrown;          // Border color
               m_Color[1][7]=clrNavajoWhite;    // Bar color
               m_Color[1][8]=clrBurlyWood;      // Color of buttons
               m_Color[1][9]=clrPink;           // Warning color
               m_Color[1][10]=clrBrown;         // Color of text (arrows)
               m_Color[1][11]=clrLightYellow;   // Color of a selected slider
               m_Color[1][12]=clrLightYellow;   // Color of button shimmering
               m_Color[1][13]=clrLightYellow;   // Color of slider shimmering
               // CCheckBox, CRadioGroup use colors of CInputBox (except warning color, which is not available in CCheckBox, CRadioGroup)
               // CList - background and text color from CInputBox, proper selection color
               m_Color[1][14]=clrBisque; // Color of a selected point
               // CHMenu, CVMenu
               m_Color[1][15]=clrLightYellow;   // Color of a background with selected points
               m_Color[1][16]=clrNavajoWhite;   // Background color without selected points
               m_Color[1][17]=clrRed;           // Check mark color
               // CHProgress
               m_Color[1][18]=clrNavajoWhite;   // Background color   
               m_Color[1][19]=clrBrown;         // Border color
               m_Color[1][20]=clrOrange;  // Band color
               m_Color[1][21]=clrBrown;         // Text color
               // CDialer
               m_Color[1][22]=clrBurlyWood;     // Background color
               m_Color[1][23]=clrBrown;         // Border color
               m_Color[1][24]=clrBisque;        // Color of buttons with numbers
               m_Color[1][25]=clrBrown;         // Text color
               m_Color[1][26]=clrLightPink;     // Reset button color
               m_Color[1][27]=clrLightGreen;    // Ok button color
               m_Color[1][28]=clrPaleTurquoise; // Close button color
               m_Color[1][29]=clrLightYellow;   // Text box background color
               m_Color[1][30]=clrBrown;         // Text color in the text box
               m_Color[1][31]=clrPink;          // Warning color  
  
               // === blue ===
               
               m_Color[2][0]=clrAliceBlue;      // Text box background color
               m_Color[2][1]=clrNavy;           // Color of the text and border of a text box
               m_Color[2][2]=clrNavy;           // Text color
               m_Color[2][3]=clrLightPink;      // Warning color          
               // CSpinInputBox (additional, rest like CInputBox)
               m_Color[2][4]=clrLightSteelBlue; // Color of buttons
               m_Color[2][5]=clrAliceBlue;      // Color of shimmering
               // CVScrollBar, CHScrollBar (independent colors)
               m_Color[2][6]=clrNavy;           // Border color
               m_Color[2][7]=clrLightBlue;      // Bar color
               m_Color[2][8]=clrLightSteelBlue; // Color of buttons
               m_Color[2][9]=clrLightPink;      // Warning color
               m_Color[2][10]=clrNavy;          // Color of text (arrows)
               m_Color[2][11]=clrAliceBlue;     // Color of a selected slider
               m_Color[2][12]=clrAliceBlue;     // Color of button shimmering
               m_Color[2][13]=clrAliceBlue;     // Color of slider shimmering
               // CCheckBox, CRadioGroup use colors of CInputBox (except warning color, which is not available in CCheckBox, CRadioGroup)
               // CList - background and text color from CInputBox, proper selection color
               m_Color[2][14]=clrPaleTurquoise; // Color of a selected point
               // CHMenu, CVMenu
               m_Color[2][15]=clrAliceBlue;     // Color of a background with selected points
               m_Color[2][16]=clrLightBlue;     // Background color without selected points
               m_Color[2][17]=clrRed;           // Check mark color
               // CHProgress
               m_Color[2][18]=clrLightBlue;     // Background color   
               m_Color[2][19]=clrNavy;          // Frame color
               m_Color[2][20]=clrDodgerBlue;    // Band color
               m_Color[2][21]=clrNavy;          // Text color
               // CDialer
               m_Color[2][22]=clrLightSteelBlue;// Background color
               m_Color[2][23]=clrNavy;          // Frame color
               m_Color[2][24]=clrLightBlue;     // Color of buttons with numbers
               m_Color[2][25]=clrNavy;          // Text color
               m_Color[2][26]=clrLightPink;     // Reset button color
               m_Color[2][27]=clrLightGreen;    // Ok button color
               m_Color[2][28]=clrPaleTurquoise; // Close button color
               m_Color[2][29]=clrAliceBlue;     // Color of a text box background
               m_Color[2][30]=clrNavy;          // Text color in the text box
               m_Color[2][31]=clrPink;          // Warning color                 
  
               // === green ===

               m_Color[3][0]=clrHoneydew;       // Color of a text box background
               m_Color[3][1]=clrDarkSlateGray;  // Color of the text and border of a text box
               m_Color[3][2]=clrDarkSlateGray;  // Text color
               m_Color[3][3]=clrLightPink;      // Warning color          
               // CSpinInputBox (additional, rest like CInputBox)
               m_Color[3][4]=clrDarkSeaGreen;   // Color of buttons
               m_Color[3][5]=clrHoneydew;       // Color of shimmering
               // CVScrollBar, CHScrollBar (independent colors)
               m_Color[3][6]=clrDarkSlateGray;  // Frame color
               m_Color[3][7]=C'162,199,158';    // Bar color
               m_Color[3][8]=clrDarkSeaGreen;   // Color of buttons
               m_Color[3][9]=clrLightPink;      // Warning color
               m_Color[3][10]=clrDarkSlateGray; // Color of text (arrows)
               m_Color[3][11]=C'206,225,204';   // Color of a selected slider
               m_Color[3][12]=C'188,216,186';   // Color of button shimmering
               m_Color[3][13]=C'188,216,186';   // Color of slider shimmering
               // CCheckBox, CRadioGroup use colors of CInputBox (except warning color, which is not available in CCheckBox, CRadioGroup)
               // CList - background and text color from CInputBox, proper selection color
               m_Color[3][14]=clrPaleTurquoise; // Color of a selected point
               // CHMenu, CVMenu
               m_Color[3][15]=clrHoneydew;      // Color of a background with selected points
               m_Color[3][16]=C'201,222,199';   // Background color without selected points
               m_Color[3][17]=clrRed;           // Check mark color
               // CHProgress
               m_Color[3][18]=C'201,222,199';   // Background color   
               m_Color[3][19]=clrDarkSlateGray; // Frame color
               m_Color[3][20]=clrYellowGreen;   // Band color
               m_Color[3][21]=clrDarkSlateGray; // Text color
               // CDialer
               m_Color[3][22]=C'166,201,163';   // Background color
               m_Color[3][23]=clrDarkSlateGray; // Frame color
               m_Color[3][24]=C'201,222,199';   // Color of buttons with numbers
               m_Color[3][25]=clrDarkSlateGray; // Text color
               m_Color[3][26]=clrLightPink;     // Reset button color
               m_Color[3][27]=clrLightGreen;    // Ok button color
               m_Color[3][28]=clrPaleTurquoise; // Close button color
               m_Color[3][29]=clrHoneydew;      // Color of a text box background
               m_Color[3][30]=clrDarkSlateGray; // Text color in the text box
               m_Color[3][31]=clrPink;          // Warning color                     
               
               // === Yellow and black ===

               m_Color[4][0]=clrBlack;          // Color of a text box background
               m_Color[4][1]=clrYellow;         // Color of the text and border of a text box
               m_Color[4][2]=clrYellow;         // Text color
               m_Color[4][3]=clrRed;            // Warning color          
               // CSpinInputBox (additional, rest like CInputBox)
               m_Color[4][4]=clrBlack;          // Color of buttons
               m_Color[4][5]=clrSilver;         // Color of shimmering
               // CVScrollBar, CHScrollBar (independent colors)
               m_Color[4][6]=clrYellow;         // Frame color
               m_Color[4][7]=clrDimGray;        // Bar color
               m_Color[4][8]=clrBlack;          // Color of buttons
               m_Color[4][9]=clrRed;            // Warning color
               m_Color[4][10]=clrYellow;        // Color of text (arrows)
               m_Color[4][11]=clrDarkKhaki;     // Color of a selected slider
               m_Color[4][12]=clrGray;          // Color of button shimmering
               m_Color[4][13]=clrGray;          // Color of slider shimmering
               // CCheckBox, CRadioGroup use colors of CInputBox (except warning color, which is not available in CCheckBox, CRadioGroup)
               // CList - background and text color from CInputBox, proper selection color
               m_Color[4][14]=clrNavy;          // Color of a selected point
               // CHMenu, CVMenu
               m_Color[4][15]=clrDimGray;       // Color of a background with selected points
               m_Color[4][16]=clrBlack;         // Background color without selected points
               m_Color[4][17]=clrYellow;        // Check mark color
               // CHProgress
               m_Color[4][18]=clrDimGray;       // Background color   
               m_Color[4][19]=clrYellow;        // Frame color
               m_Color[4][20]=clrChocolate;     // Band color
               m_Color[4][21]=clrYellow;        // Text color
               // CDialer
               m_Color[4][22]=clrDimGray;       // Background color
               m_Color[4][23]=clrYellow;        // Frame color
               m_Color[4][24]=clrBlack;         // Color of buttons with numbers
               m_Color[4][25]=clrYellow;        // Text color
               m_Color[4][26]=clrBrown;         // Reset button color
               m_Color[4][27]=clrGreen;         // Ok button color
               m_Color[4][28]=clrNavy;          // Close button color
               m_Color[4][29]=clrBlack;         // Color of a text box background
               m_Color[4][30]=clrYellow;        // Text color in the text box
               m_Color[4][31]=clrRed;           // Warning color                     
               
               // === Green and black ===

               m_Color[5][0]=clrBlack;          // Color of a text box background
               m_Color[5][1]=clrLime;           // Color of the text and border of a text box
               m_Color[5][2]=clrLime;           // Text color
               m_Color[5][3]=clrRed;            // Warning color          
               // CSpinInputBox (additional, rest like CInputBox)
               m_Color[5][4]=clrBlack;          // Color of buttons
               m_Color[5][5]=clrSilver;         // Color of shimmering
               // CVScrollBar, CHScrollBar (independent colors)
               m_Color[5][6]=clrLime;           // Frame color
               m_Color[5][7]=clrDimGray;        // Bar color
               m_Color[5][8]=clrBlack;          // Color of buttons
               m_Color[5][9]=clrRed;            // Warning color
               m_Color[5][10]=clrLime;          // Color of text (arrows)
               m_Color[5][11]=clrGreen;         // Color of a selected slider
               m_Color[5][12]=clrGray;          // Color of button shimmering
               m_Color[5][13]=clrGray;          // Color of slider shimmering
               // CCheckBox, CRadioGroup use colors of CInputBox (except warning color, which is not available in CCheckBox, CRadioGroup)
               // CList - background and text color from CInputBox, proper selection color
               m_Color[5][14]=clrNavy;          // Color of a selected point
               // CHMenu, CVMenu
               m_Color[5][15]=clrDimGray;       // Color of a background with selected points
               m_Color[5][16]=clrBlack;         // Background color without selected points
               m_Color[5][17]=clrLime;          // Check mark color
               // CHProgress
               m_Color[5][18]=clrDimGray;       // Background color   
               m_Color[5][19]=clrLime;          // Frame color
               m_Color[5][20]=clrForestGreen;   // Band color
               m_Color[5][21]=clrLime;          // Text color
               // CDialer
               m_Color[5][22]=clrDimGray;       // Background color
               m_Color[5][23]=clrLime;          // Frame color
               m_Color[5][24]=clrBlack;         // Color of buttons with numbers
               m_Color[5][25]=clrLime;          // Text color
               m_Color[5][26]=clrBrown;         // Reset button color
               m_Color[5][27]=clrGreen;         // Ok button color
               m_Color[5][28]=clrNavy;          // Close button color
               m_Color[5][29]=clrBlack;         // Color of a text box background
               m_Color[5][30]=clrLime;          // Text color in the text box
               m_Color[5][31]=clrRed;           // Warning color                     
               
               // === áèðþçîâî-÷åðíàÿ ===

               m_Color[6][0]=clrBlack;          // Color of a text box background
               m_Color[6][1]=clrAqua;           // Color of the text and border of a text box
               m_Color[6][2]=clrAqua;           // Text color
               m_Color[6][3]=clrRed;            // Warning color          
               // CSpinInputBox (additional, rest like CInputBox)
               m_Color[6][4]=clrBlack;          // Color of buttons
               m_Color[6][5]=clrSilver;         // Color of shimmering
               // CVScrollBar, CHScrollBar (independent colors)
               m_Color[6][6]=clrAqua;           // Frame color
               m_Color[6][7]=clrDimGray;        // Bar color
               m_Color[6][8]=clrBlack;          // Color of buttons
               m_Color[6][9]=clrRed;            // Warning color
               m_Color[6][10]=clrAqua;          // Color of text (arrows)
               m_Color[6][11]=clrLightSeaGreen; // Color of a selected slider
               m_Color[6][12]=clrGray;          // Color of button shimmering
               m_Color[6][13]=clrGray;          // Color of slider shimmering
               // CCheckBox, CRadioGroup use colors of CInputBox (except warning color, which is not available in CCheckBox, CRadioGroup)
               // CList - background and text color from CInputBox, proper selection color
               m_Color[6][14]=clrNavy;          // Color of a selected point
               // CHMenu, CVMenu
               m_Color[6][15]=clrDimGray;       // Color of a background with selected points
               m_Color[6][16]=clrBlack;         // Background color without selected points
               m_Color[6][17]=clrAqua;          // Check mark color
               // CHProgress
               m_Color[6][18]=clrDimGray;       // Background color   
               m_Color[6][19]=clrAqua;          // Frame color
               m_Color[6][20]=clrLightSeaGreen; // Band color
               m_Color[6][21]=clrAqua;          // Text color
               // CDialer
               m_Color[6][22]=clrDimGray;       // Background color
               m_Color[6][23]=clrAqua;          // Frame color
               m_Color[6][24]=clrBlack;         // Color of buttons with numbers
               m_Color[6][25]=clrAqua;          // Text color
               m_Color[6][26]=clrBrown;         // Reset button color
               m_Color[6][27]=clrGreen;         // Ok button color
               m_Color[6][28]=clrNavy;          // Close button color
               m_Color[6][29]=clrBlack;         // Color of a text box background
               m_Color[6][30]=clrAqua;          // Text color in the text box
               m_Color[6][31]=clrRed;           // Warning color                   
               
            return(m_Color[m_ShemeIndex][aColorIndex]); // Return a value by the scheme number and color number in the scheme
         }
   		/*!	
   			Show color samples on a chart.
             \remark	   Schemes are arranges vertical from top to bottom, counting from zero. 
                        Colors from left to right, counting from zero.
   		*/           
         void Show(){ // Show all colors of the color schemes
            int m_sc=7; // Number of schemes
            int m_cc=32; // Number of colors in a scheme
            color m_bcolor=Color(1);
            int m_RemScheme=m_ShemeIndex;
               for(int s=0;s<m_sc;s++){
                  w.Label("ColorSchemes_"+IntegerToString(s),0,10,20+s*20,IntegerToString(s),m_bcolor);
               }
               for(int s=0;s<m_sc;s++){
                  m_ShemeIndex=s;
                     for(int c=0;c<m_cc;c++){
                        w.Canvas("ColorSchemes_"+IntegerToString(s)+"_"+IntegerToString(c),0,10+c*20+15,20+s*20,19,19,Color(c),m_bcolor);
                     }
               }
            ChartRedraw(0);
            m_ShemeIndex=m_RemScheme;
         }
   		/*!	
   			Delete color samples displayed using the Show() method.
   		*/           
         void Hide(){ // Delete color samples displayed using the Show() method
            int m_sc=7;
            int m_cc=32;         
               for(int s=0;s<m_sc;s++){
                  ObjectDelete(0,"ColorSchemes_"+IntegerToString(s));
                     for(int c=0;c<m_cc;c++){
                        ObjectDelete(0,"ColorSchemes_"+IntegerToString(s)+"_"+IntegerToString(c));
                     }
               }
            ChartRedraw(0);
         }
};

CColorSchemes ClrScheme;

//+------------------------------------------------------------------+
//|                                                                  |
//|         Control classes                                          |
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|         Class CInputBox                                          |
//+------------------------------------------------------------------+

/*!
	\brief   Graphic control element Edit Box.
	
	\details Two modes: text data entry, numeric data entry. 
	         When entering numeric data range of user entered values is limited 
	         A dot or a comma can be used as the decimal separator.
	         For software input of value in the edit box, data is formatted to a specified 
	         number of decimal places. Work in subwindows is supported. 
   \remark	The control consists of two objects Edit Box (OBJ_EDIT) Label (OBJ_LABEL).
            To get the name of the input field "_E" is added to the aName parameter, for a label "_L" is added.
            
*/   

class CInputBox{
   private:
      string m_NameEdit;   // The name of the Edit object
      string m_NameLabel;  // The name of the Label object
      int m_Left;          // The X coordinate
      int m_Top;           // The Y coordinate
      int m_Width;         // Width
      int m_Height;        // Height
      bool m_Visible;      // Control visibility flag
      int m_Digits;        // Number of decimal places in a double number or -1 for a text mode
      string m_Caption;    // Label
      string m_Value;      // Value
      double m_ValueMin;   // Minimum value
      double m_ValueMax;   // Maximum value
      color m_BgColor;     // Background color 
      color m_TxtColor;    // Text color
      color m_LblColor;    // Label color
      color m_WarningColor;// Warning color of a background
      bool m_Warning;      // Warning flag
      int m_SubWindow;     // Subwindow
      string m_Tag;        // Tag
      bool m_ReadOnly;     // Readonly field
         void Create(){ // Object creation function
            color m_ctmp=m_BgColor; // Normal background color
               if(m_Warning){ // Warning mode set
                  m_ctmp=m_WarningColor; // The text box will be colored in a warning color
               }
            w.Edit(m_NameEdit,m_SubWindow,m_Left,m_Top,m_Width,m_Height,m_Value,m_ctmp,m_TxtColor,7,"Arial"); // Creating a text box
               if(m_Caption!=""){ // There is a caption
                  w.Label(m_NameLabel,m_SubWindow,m_Left+m_Width+1,m_Top+2,m_Caption,m_LblColor,7,"Arial"); // Create a caption
               } 
         }   
         void Delete(){ // Object deleting function
            ObjectDelete(0,m_NameEdit); // Delete a text field
            ObjectDelete(0,m_NameLabel); // Delete a label
         }    
   public:
		/*!	
			Control initialization.
            \param		string aName="CInputBox" - name,
            \param		int aWidth=50 - width,
            \param		int aDigits=-1 - number of decimal places (zero or more), -1 - text mode,
            \param		string aCaption="CInputBox" - label text (when set to "", no label).
 		*/   
      void Init(string aName="CInputBox",int aWidth=50,int aDigits=-1,string aCaption="CInputBox"){ // Method of initialization
         m_NameEdit=aName+"_E"; // Prepare the name of a text field
         m_NameLabel=aName+"_L"; // Prepare a label text
         m_Left=0; // The X coordinate
         m_Top=0; // The Y coordinate
         m_Width=aWidth; // Width
         m_Height=15; // Height
         m_Visible=false; // Visibility
         m_Digits=aDigits; // Operation mode and number of decimal places
         m_Caption=aCaption; // Label text
         m_Value=""; // Value in a text mode
         if(aDigits>=0)m_Value=DoubleToString(0,m_Digits); // Value in a numeric mode
         m_ValueMin=-DBL_MAX; // Minimum value
         m_ValueMax=DBL_MAX; // Maximum value
         m_BgColor=ClrScheme.Color(0); // Color of a text box background
         m_TxtColor=ClrScheme.Color(1); // Color of the text and border of a text box
         m_LblColor=ClrScheme.Color(2); // Label color
         m_WarningColor=ClrScheme.Color(3); // Warning color
         m_Warning=false; // Mode: warning, normal
         m_SubWindow=0; // Subwindow index
         m_Tag=""; // Tag
      }
		/*!	
			Setting the X and Y coordinates.
            \param		int aLeft - the X coordinate (distance from the left chart border),
            \param		int aTop - the Y coordinate (distance from the upper chart border).
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/        
      void SetPos(int aLeft,int aTop){ // Setting the X and Y coordinates
         m_Left=aLeft;
         m_Top=aTop;
      }
		/*!	
			Setting the X coordinate.
            \param		int aLeft - the X coordinate (distance from the left chart border).
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/        
      void SetPosLeft(int aLeft){ // Setting the X coordinate 
         m_Left=aLeft;
      }   
		/*!	
			Setting the Y coordinate.
            \param		int aTop - the Y coordinate (distance from the upper chart border).
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/             
      void SetPosTop(int aTop){ // Setting the Y coordinate
         m_Top=aTop;
      }  
		/*!	
			Setting the width.
            \param		int aWidth - width.
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/         
      void SetWidth(int aWidth){ // Setting width 
         m_Width=aWidth;
      }
		/*!	
			Getting the X coordinate.
			\return  Value (type int).
 		*/       
      int Left(){ // Getting the X coordinate
         return(m_Left);
      }
		/*!	
			Getting the Y coordinate.
			\return  Value (type int).
 		*/        
      int Top(){ // Getting the Y coordinate
         return(m_Top);
      }
		/*!	
			Getting width.
			\return  Value (type int).
			\remark  Only the value of the text box, not taking into account the label width.
 		*/        
      int Width(){ // Getting width
         return(m_Width);
      }
		/*!	
			Getting height.
			\return  Value (type int).
 		*/        
      int Height(){
         return(m_Height); // Getting height
      }
		/*!	
			Enable visibility.
 		*/       
      void Show(){ // Enable display in a predetermined position
         m_Visible=true; // Registration of visibility 
         Create(); // Creating objects
         ChartRedraw(); // Update chart
      }
		/*!	
			Enable visibility at a given position.
         \param		int aLeft - the X coordinate (distance from the left chart border),
         \param		int aTop - the Y coordinate (distance from the upper chart border).			
 		*/        
      void Show(int aLeft,int aTop){ // Enable display at the position you set
         SetPos(aLeft,aTop); // registering coordinates
         Show(); // Enable display
      }
		/*!	
			Hiding a control (delete objects).
 		*/   
      void Hide(){ // Hide (delete objects)
         m_Visible=false; // Registering invisible state
         Delete(); // Deleting objects
         ChartRedraw(); // Update chart
      }  
		/*!	
			Update (hide and show with new parameters).
 		*/         
      void Refresh(){ // Update display (delete and create)
         if(m_Visible){ // Visibility enabled
            Delete(); // Deleting objects
            Create(); // Creating objects
            ChartRedraw(); // Redraw chart 
         }            
      }  
		/*!	
			Setting a value of the string type.
			\param		string aValue - text.	
 		*/         
      void SetValue(string aValue){ // Setting a text value
         m_Value=aValue; // Assigning a value to a variable to store the value
            if(m_Visible){ // Control visibility enabled
               g.Attach(m_NameEdit); // Attach a text box to an object to control graphical objects
               g.SetText(m_Value); // Set a value in a text field
               ChartRedraw(); // Update chart display
            }
      }  
		/*!	
			Set a value of the double type.
			\param		double aValue - value.	
 		*/         
      void SetValue(double aValue){ // Set a numeric value
         if(m_Digits>=0){ // In the numeric mode
            aValue=NormalizeDouble(aValue,m_Digits); // Normalize a number by the number of decimal places
            aValue=MathMax(aValue,m_ValueMin); // Normalize a value by a minimum allowed value
            aValue=MathMin(aValue,m_ValueMax); // Normalize a value by a maximum allowed value
            SetValue(DoubleToString(aValue,m_Digits)); // Setting the resulting value as a text value
         }
         else{ // In the text mode
            SetValue((string)aValue); // Assigning a value to a variable to store the value as it is
         }            
      }
		/*!	
			Event handling method.
			\remark  The method is called from the OnChartEvent() function, all parameters correspond to the parameters of the OnChartEvent() function.
			\return  0 or 1. 0 - no event. 1 – event of value change by user.
 		*/          
      int Event(const int id,const long & lparam,const double & dparam,const string & sparam){ // Event handling
         bool m_event=0; // A variable for the control event
            if(id==CHARTEVENT_OBJECT_ENDEDIT){ // An event of text box editing finish has occurred
               if(sparam==m_NameEdit){ // A text box named m_NameEdit has been edited
                  if(m_Digits<0){ // In the text mode
                     g.Attach(m_NameEdit); // Attach a text field to control
                        if(g.Text()!=m_Value){ // A new value in the text box
                           m_Value=g.Text(); // Assigning a value to a variable to store the value
                           m_event=1; // An event gas occurred
                        }
                  }
                  else{ // In the numeric mode
                     string m_OldValue=m_Value; // A variable with the previous control value
                     g.Attach(m_NameEdit); // Attach a text field to control
                     string m_stmp=g.Text(); // Getting text from a text box entered by a user
                     StringReplace(m_stmp,",","."); // Replace a comma with a point
                     double m_dtmp=StringToDouble(m_stmp); // Convert to a number
                     SetValue(m_dtmp); // Set a new numeric value
                        if(StringToDouble(m_Value)!=StringToDouble(m_OldValue)){ // compare a new value to the previous
                           m_event=1; // An event gas occurred 
                        }
                  }
               }
            }               
         return(m_event); // Return an event. 0 - no event, 1 - there is an event
      }
		/*!	
			Setting a subwindow by a number.
			\param int aNumber - subwindow number.
 		*/       
      void SetSubWindow(int aNumber){ // Setting the subwindow by number
         int m_itmp=(int)MathMax(aNumber,0); // If the subwindow number is negative, 0 will be used, i.e. a price chart
            if(m_itmp!=m_SubWindow){ // The subwindow number specified does not match the subwindow number where the control is located
               m_SubWindow=m_itmp; // Registration of the new subwindow number
               Refresh(); // Recreating graphical objects
            }
      }  
		/*!	
			Setting a subwindow by the subwindow name.
			\param string aName - subwindow name.
 		*/              
      void SetSubWindow(string aName){ // Setting a subwindow by the subwindow name
         SetSubWindow(ChartWindowFind(0,aName)); // Determining the subwindow number and setting the subwindow by the number
      }
		/*!	
			Getting a text value.
			\return Text.
 		*/       
      string ValueString(){ // Getting a text value
         return(m_Value);
      }
		/*!	
			Getting a numeric value.
			\return Value (type double).
 		*/         
      double ValueDouble(){ // Getting a numeric value
         return(StringToDouble(m_Value));
      }
		/*!	
			Enable/disable the warning color.
			\param bool aValue - true/false (warning/normal). 
 		*/        
      void SetWarning(bool aValue){ // Setting the warning value
            if(m_Visible){ // Visibility enabled
               if(aValue){ // You need to enable warning mode
                  if(!m_Warning){ // Warning mode was not enabled
                     g.Attach(m_NameEdit); // Attach a text field to control 
                     g.SetBgColor(m_WarningColor); // Setting a warning background color for a text field
                  }
               }
               else{ // You need to disable warning mode
                  if(m_Warning){ // Warning mode enabled
                     g.Attach(m_NameEdit); // Attach a text field to control 
                     g.SetBgColor(m_BgColor); // Setting the normal background color                
                  }
               }
            }
         m_Warning=aValue; // Registering the set mode
      }
		/*!	
			Getting the warning mode.
			\return Type bool. True/false - warning/normal.
 		*/         
      bool Warning(){ // getting the warning mode
         return(m_Warning);
      }
		/*!	
			Setting the maximum allowed value.
			\param double aValue - maximum allowed value. 
 		*/        
      void SetMaxValue(double aValue){ // Setting the maximum allowed value
         m_ValueMax=aValue; // Registering the new maximum allowed value
            if(m_Digits>=0){ // The control element works in a numeric mode
               if(StringToDouble(m_Value)>m_ValueMax){ // The current control value is greater than the new maximum allowed value
                  SetValue(m_ValueMax); // Setting a new value equal to the maximum allowed value
               }
            }         
      }
		/*!	
			Setting the minimum allowed value.
			\param double aValue - minimum allowed value. 
 		*/        
      void SetMinValue(double aValue){ // Setting the minimum allowed value
         m_ValueMin=aValue; // Registering the new minimum allowed value     
            if(m_Digits>=0){ // The control element works in a numeric mode
               if(StringToDouble(m_Value)<m_ValueMin){ // The current control value is smaller than the new minimum allowed value
                  SetValue(m_ValueMin); // Setting a new value equal to the minimum allowed value 
               }
            }
      }
		/*!	
			Getting the maximum allowed value.
			\return Value (type double).
 		*/         
      double MaxValue(){ // Getting the maximum allowed value
         return(m_ValueMax); 
      }
		/*!	
			Getting the minimum allowed value.
			\return Value (type double).
 		*/       
      double MinValue(){ // Getting the minimum allowed value
         return(m_ValueMin);
      }
		/*!	
			Setting a tag.
			\param string aValue - text.
 		*/       
      void SetTag(string aValue){ // Setting a tag
         m_Tag=aValue;
      }
		/*!	
			Getting a tag.
			\return A value (type string).
 		*/        
      string Tag(){ // Getting a tag
         return(m_Tag);
      }  
		/*!	
			Set the number of decimal places in the numeric mode.
			\param int aValue - the number of decimal places.
 		*/          
      void SetDigits(int aValue){ // Setting the number of decimal places
         m_Digits=aValue; // Registering a new value
            if(m_Digits>=0){ // Numeric mode
               SetValue(ValueDouble()); // Resetting the current value
            }
      }  
		/*!	
			Getting the number of decimal places.
			\return Type int. From zero and up - the number of digits after the decimal point. -1 - the control element works in the text mode.
 		*/       
      int Digits(){ // Getting the m_Digits value
         return(m_Digits);
      }   
		/*!	
			Visibility of a control element.
			\return Type bool. True/false - visible/hidden.
 		*/           
      bool Visible(){
         return(m_Visible);
      }
		/*!	
			Setting the read-only property.
			\param int aValue - true/false - read-only/editable.
 		*/        
      void SetReadOnly(bool aValue){
         m_ReadOnly=aValue;
            if(m_Visible){
               g.SetReadOnly(m_NameEdit,m_ReadOnly);
            }
      }   
		/*!	
			Getting the read-only property.
			\return Type bool. True/false - read-only/editable.
 		*/        
      bool ReadOnly(){
         return(m_ReadOnly);
      }      
};

//+------------------------------------------------------------------+
//|         Class CSpinInputBox                                      |
//+------------------------------------------------------------------+

/*!
   \brief   Graphic control element Edit Box with buttons +/-.
   
   \details Used for entering a value by changing it by a specified step
            using buttons "+" and "-". Value can be entered from a keyboard. Formatting 
            of a value ?is performed in accordance with the number of characters defined
            by the change parameter. Work in subwindows is supported. 
   \remark	The control element consists of CSpinInputBox and 
            OBJ_LABEL. To receive the CSpinInputBox names, add 
            "_IB" to the aName parameter, add "_L" for a label, add "_U" for the "+" button, add
             "_D" for the "-" button.
*/  

class CSpinInputBox{
   protected:
      CInputBox m_ib;
      string m_NameSU;
      string m_NameSD;
      string m_NameLabel;
      int m_Left;
      int m_Top;
      int m_Width;
      int m_Height;
      string m_Caption;
      int m_SubWindow;
      color m_LblColor;
      color m_SpBgColor;
      color m_SpTxtColor;
      color m_FlashColor;
      color m_WrongColor;
      bool m_Visible;
      double m_Change;
      int m_Digits;
         int DefineDigits(double aValue){ // The function determines the number of decimal places based on the value of the double variable
            int m_Digits2=0;
               for(int i=8;i>=0;i--){
                  if(aValue>=NormalizeDouble(1.0/MathPow(10,i),8)){
                     m_Digits2=i;
                  }
               }
            return(m_Digits2);    
         }
         void Create(){
            w.Edit(m_NameSD,m_SubWindow,m_Left+m_Width-13,m_Top+7,13,8," -",m_SpBgColor,m_SpTxtColor,6,"Arial");
            w.Edit(m_NameSU,m_SubWindow,m_Left+m_Width-13,m_Top,13,8," +",m_SpBgColor,m_SpTxtColor,5,"Arial");
            g.SetReadOnly(m_NameSU,true);               
            g.SetReadOnly(m_NameSD,true);
               if(m_Caption!=""){ // There is a caption
                  w.Label(m_NameLabel,m_SubWindow,m_Left+m_Width+1,m_Top+2,m_Caption,m_LblColor,7,"Arial"); // Create a caption
               } 
         }
         void Delete(){
            ObjectDelete(0,m_NameSU); // Delete the up button
            ObjectDelete(0,m_NameSD); // Delete the down button
            ObjectDelete(0,m_NameLabel); // Delete a label         
         }
         void Flash(string aName,color aFlash,color aNormal){
            g.SetBgColor(aName,aFlash);
            g.Redraw();
            Sleep(100);
            g.SetBgColor(aName,aNormal);
            g.Redraw();      
         }         
   public:
		/*!	
			Control initialization.
            \param		string aName="CSpinInputBox" - name,
            \param		int aWidth=50 - width,
            \param		double aChange=0.1 - value change step,
            \param		string aCaption="CSpinInputBox" - label text (when set to "", no label).
 		*/     
      void Init(string aName="CSpinInputBox",int aWidth=50,double aChange=0.1,string aCaption="CSpinInputBox"){
         m_NameSU=aName+"_U";
         m_NameSD=aName+"_D";
         m_NameLabel=aName+"_L";
         m_SubWindow=0;
         m_Left=0;
         m_Top=0; 
         m_Width=aWidth;
         m_Height=15;
         m_Caption=aCaption;         
         m_SpTxtColor=ClrScheme.Color(1); // Color of button labels, should match the color of text box borders
         m_LblColor=ClrScheme.Color(2);   // The label color is similar to the color of the label of the text box         
         m_WrongColor=ClrScheme.Color(3); // Warning color as for the text box
         m_SpBgColor=ClrScheme.Color(4);  // Button color, added
         m_FlashColor=ClrScheme.Color(5); // Shimmering color, added
         m_Visible=false;
         m_Change=aChange;
         m_Digits=DefineDigits(m_Change);
         m_ib.Init(aName+"_IB",m_Width-12,m_Digits,""); // Initialization of the input field
         m_ib.SetReadOnly(true);
      }
		/*!	
			Setting the X and Y coordinates.
            \param		int aLeft - the X coordinate (distance from the left chart border),
            \param		int aTop - the Y coordinate (distance from the upper chart border).
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/        
      void SetPos(int aLeft,int aTop){
         m_Left=aLeft;
         m_Top=aTop;
         m_ib.SetPos(m_Left,m_Top);
      }
		/*!	
			Setting the X coordinate.
            \param		int aLeft - the X coordinate (distance from the left chart border).
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/        
      void SetPosLeft(int aLeft){
         m_Left=aLeft;
         m_ib.SetPosLeft(m_Left);
      } 
		/*!	
			Setting the Y coordinate.
            \param		int aTop - the Y coordinate (distance from the upper chart border).
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/    
      void SetPosTop(int aTop){
         m_Top=aTop;
         m_ib.SetPosTop(m_Top);
      }  
		/*!	
			Setting the width.
            \param		int aWidth - width.
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/        
      void SetWidth(int aWidth){
         m_Width=aWidth;
         m_ib.SetWidth(m_Width-12);
      }
		/*!	
			Getting the X coordinate.
			\return  Value (type int).
 		*/       
      int Left(){
         return(m_Left);
      }
		/*!	
			Getting the Y coordinate.
			\return  Value (type int).
 		*/  
      int Top(){
         return(m_Top);
      }
		/*!	
			Getting width.
			\return  Value (type int).
			\remark  Only the value of the text box, not taking into account the label width.
 		*/         
      int Width(){
         return(m_Width);
      }
		/*!	
			Getting height.
			\return  Value (type int).
 		*/ 
      int Height(){
         return(m_Height);
      }
		/*!	
			Enable visibility.
 		*/        
      void Show(){
         m_Visible=true; 
         Create(); 
         m_ib.Show();
      }
		/*!	
			Enable visibility at a given position.
         \param		int aLeft - the X coordinate (distance from the left chart border),
         \param		int aTop - the Y coordinate (distance from the upper chart border).			
 		*/        
      void Show(int aLeft,int aTop){
         SetPos(aLeft,aTop);
         Show();
      }
		/*!	
			Hiding a control (delete objects).
 		*/       
      void Hide(){
         m_Visible=false;
         Delete();
         m_ib.Hide();
      }   
		/*!	
			Update (hide and show with new parameters).
 		*/        
      void Refresh(){
         if(m_Visible){
            Delete();
            Create(); 
            m_ib.Refresh();
         }            
      } 
		/*!	
			Event handling method.
			\remark  The method is called from the OnChartEvent() function, all parameters correspond to the parameters of the OnChartEvent() function.
			\return  0, 1 or 2. 0 - no event. 1 – an event of value changed from a keyboard, 2 - using buttons +/-.
 		*/         
      int Event(const int id,const long & lparam,const double & dparam,const string & sparam){ // Event handling
         int m_event=m_ib.Event(id,lparam,dparam,sparam);
            if(m_event==0){
               double m_OldValue;
                  if(id==CHARTEVENT_OBJECT_CLICK){
                     if(sparam==m_NameSU){
                        m_OldValue=m_ib.ValueDouble();
                        m_ib.SetValue(m_OldValue+m_Change);
                           if(m_OldValue!=m_ib.ValueDouble()){
                              Flash(m_NameSU,m_FlashColor,m_SpBgColor);
                              m_event=2;
                           }
                           else{
                              Flash(m_NameSU,m_WrongColor,m_SpBgColor);
                           }
                     }
                     if(sparam==m_NameSD){
                        m_OldValue=m_ib.ValueDouble();
                        m_ib.SetValue(m_OldValue-m_Change);
                           if(m_OldValue!=m_ib.ValueDouble()){
                              Flash(m_NameSD,m_FlashColor,m_SpBgColor);
                              m_event=2;
                           }
                           else{
                              Flash(m_NameSD,m_WrongColor,m_SpBgColor);
                           }
                     }               
                  }
            }
         return(m_event);
      }   
		/*!	
			Setting the maximum allowed value.
			\param double aValue - maximum allowed value. 
 		*/         
      void SetMaxValue(double aValue){
         m_ib.SetMaxValue(aValue);
      }
		/*!	
			Setting the minimum allowed value.
			\param double aValue - minimum allowed value. 
 		*/        
      void SetMinValue(double aValue){
         m_ib.SetMinValue(aValue);
      }
		/*!	
			Getting the maximum allowed value.
			\return Value (type double).
 		*/        
      double MaxValue(){
         return(m_ib.MaxValue()); 
      }
		/*!	
			Getting the minimum allowed value.
			\return Value (type double).
 		*/         
      double MinValue(){
         return(m_ib.MinValue());
      }
		/*!	
			Setting a tag.
			\param string aValue - text.
 		*/       
      void SetTag(string aValue){
         m_ib.SetTag(aValue);
      }
		/*!	
			Getting a tag.
			\return A value (type string).
 		*/   
      string Tag(){
         return(m_ib.Tag());
      } 
		/*!	
			Setting a value.
			\param		double aValue - value.	
 		*/          
      void SetValue(double aValue){
         m_ib.SetValue(aValue);
      }
		/*!	
			Getting a value.
			\return Type double.
 		*/         
      double Value(){
         return(m_ib.ValueDouble());
      }   
		/*!	
			Setting the change step.
			\param		double aValue - value.	
 		*/         
      void SetChange(double aValue){
         m_Change=aValue;
         m_Digits=DefineDigits(m_Change);
         m_ib.SetDigits(m_Digits);
      }  
		/*!	
			Getting the change step.
			\return Type double.
 		*/       
      double Change(){
         return(m_Change);
      }  
		/*!	
			Getting the number of decimal places.
			\return Type int.
			\remark Determined by the step value.
 		*/        
      int Digits(){
         return(m_Digits);
      }
		/*!	
			Enable/disable the warning color.
			\param bool aValue - true/false (warning/normal). 
 		*/        
      void SetWarning(bool aValue){
         m_ib.SetWarning(aValue);
      }
		/*!	
			Getting the warning mode.
			\return Type bool. True/false - warning/normal.
 		*/         
      bool Warning(){
         return(m_ib.Warning());
      }
		/*!	
			Setting the read-only property.
			\param int aValue - true/false - read-only/editable.
 		*/        
      void SetReadOnly(bool aValue){
         m_ib.SetReadOnly(aValue);
      }
		/*!	
			Getting the read-only property.
			\return Type bool. True/false - read-only/editable.
 		*/        
      bool ReadOnly(){
         return(m_ib.ReadOnly());
      }
		/*!	
			Setting a subwindow by a number.
			\param int aNumber - subwindow number.
 		*/          
      void SetSubWindow(int aNumber){
         int m_itmp=(int)MathMax(aNumber,0);
            if(m_itmp!=m_SubWindow){
               m_SubWindow=m_itmp;
               m_ib.SetSubWindow(m_SubWindow);
               Refresh();
            }
      }    
		/*!	
			Setting a subwindow by the subwindow name.
			\param string aName - subwindow name.
 		*/             
      void SetSubWindow(string aName){
         SetSubWindow(ChartWindowFind(0,aName));
      }  
};

//+------------------------------------------------------------------+
//|         Class CCheckBox                                          |
//+------------------------------------------------------------------+

/*!
   \brief   Checkbox control.
   \details Operation in subwindows supported. 
   \remark	Consists of a rectangular label OBJ_RECTANGLE_LABEL and two labels
            OBJ_LABEL: for a checkmark and a label.
            To get the name of a rectangular label, add 
            "_B" to parameter aName, for a checkmark add "_C", for a label add "_L".
             "_D" for the "-" button.
*/  

class CCheckBox{
   protected:
      color m_BgColor;
      color m_CheckColor;
      color m_LabelColor;
      string m_Caption;
      string m_NameBox;
      string m_NameChecked;
      string m_NameLabel;
      int m_Left;
      int m_Top;
      int m_Width;
      int m_Height;
      bool m_Value;
      bool m_Visible;
      int m_SubWindow;
      string m_Tag;
         void Create(){
            w.Canvas(m_NameBox,m_SubWindow,m_Left,m_Top,m_Width,m_Height,m_BgColor,m_CheckColor);
            string m_str=" ";
               if(m_Value){
                  m_str=CharToString(252);
               }
            w.Label(m_NameChecked,m_SubWindow,m_Left+1,m_Top+1,m_str,m_CheckColor,12,"Wingdings");
            w.Label(m_NameLabel,m_SubWindow,m_Left+m_Width+1,m_Top+2,m_Caption,m_LabelColor,7);            
         }
         void Delete(){
            ObjectDelete(0,m_NameBox);
            ObjectDelete(0,m_NameChecked);
            ObjectDelete(0,m_NameLabel);
         }
   public:
		/*!	
			Control initialization.
         \param		string aName="CCheckBox" - name,
         \param		string aCaption="CCheckBox" - label text (when set to "", no label).
 		*/   
      void Init(string aName="CCheckBox",string aCaption="CCheckBox"){
         m_NameBox=aName+"_B";
         m_NameChecked=aName+"_C";
         m_NameLabel=aName+"_L";
         m_Caption=aCaption;
         m_BgColor=ClrScheme.Color(0);
         m_CheckColor=ClrScheme.Color(1);
         m_LabelColor=ClrScheme.Color(2);
         m_Value=false;
         m_Visible=false;
         m_Width=15;
         m_Height=15;
         m_SubWindow=0;
         m_Tag="";
      }
		/*!	
			Enable visibility.
 		*/       
      void Show(int aLeft,int aTop){
         m_Left=aLeft;
         m_Top=aTop;
         Show();
      }
		/*!	
			Enable visibility at a given position.
         \param		int aLeft - the X coordinate (distance from the left chart border),
         \param		int aTop - the Y coordinate (distance from the upper chart border).			
 		*/      
      void Show(){
         m_Visible=true;
         Create();
         ChartRedraw(0);
      }
		/*!	
			Hiding a control (delete objects).
 		*/       
      void Hide(){
         m_Visible=false;
         Delete();
         ChartRedraw(0);
      } 
		/*!	
			Update (hide and show with new parameters).
 		*/        
      void Refresh(){
         Delete();
         Create();
         ChartRedraw(0);
      }
		/*!	
			Setting the X and Y coordinates.
            \param		int aLeft - the X coordinate (distance from the left chart border),
            \param		int aTop - the Y coordinate (distance from the upper chart border).
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/        
      void SetPos(int aLeft,int aTop){
         m_Left=aLeft;
         m_Top=aTop;
      }
		/*!	
			Setting the X coordinate.
            \param		int aLeft - the X coordinate (distance from the left chart border).
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/        
      void SetPosLeft(int aLeft){
         m_Left=aLeft;
      }   
		/*!	
			Setting the Y coordinate.
            \param		int aTop - the Y coordinate (distance from the upper chart border).
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/          
      void SetPosTop(int aTop){
         m_Top=aTop;
      }  
		/*!	
			Getting the X coordinate.
			\return  Value (type int).
 		*/        
      int Left(){
         return(m_Left);
      }
		/*!	
			Getting the Y coordinate.
			\return  Value (type int).
 		*/         
      int Top(){
         return(m_Top);
      }
		/*!	
			Getting width.
			\return  Value (type int).
			\remark  Label width is not considered.
 		*/        
      int Width(){
         return(m_Width);
      }
		/*!	
			Getting height.
			\return  Value (type int).
 		*/       
      int Height(){
         return(m_Height);
      }
		/*!	
			Setting a value.
			\param		bool aValue - true/false.	
 		*/         
      void SetValue(bool aValue){
         m_Value=aValue;
            if(m_Visible){
               string m_str=" ";
                  if(m_Value){
                     m_str=CharToString(252);
                  }
               g.SetText(m_NameChecked,m_str);
               g.Redraw();
            }
      }
		/*!	
			Getting a value.
			\return Type bool.
 		*/        
      bool Value(){
         return(m_Value);
      }  
		/*!	
			Event handling method.
			\remark  The method is called from the OnChartEvent() function, all parameters correspond to the parameters of the OnChartEvent() function.
			\return  0 or 1. 0 - no event. 1 – event of value change by user.
 		*/          
      int Event(const int id,const long& lparam,const double& dparam,const string& sparam){
         int m_event=0;
            if(id==CHARTEVENT_OBJECT_CLICK){
               if(sparam==m_NameBox || sparam==m_NameChecked || sparam==m_NameLabel){
                     if(m_Value){
                        SetValue(false);
                     }
                     else{
                        SetValue(true);
                     }
                  m_event=1;
               }
            }
         return(m_event);
      }
		/*!	
			Setting a subwindow by a number.
			\param int aNumber - subwindow number.
 		*/         
      void SetSubWindow(int aNumber){
         int m_itmp=(int)MathMax(aNumber,0);
            if(m_itmp!=m_SubWindow){
               m_SubWindow=m_itmp;
               Refresh();
            }
      }   
		/*!	
			Setting a subwindow by the subwindow name.
			\param string aName - subwindow name.
 		*/              
      void SetSubWindow(string aName){
         SetSubWindow(ChartWindowFind(0,aName));
      }  
		/*!	
			Setting a tag.
			\param string aValue - text.
 		*/       
      void SetTag(string aValue){ // Setting a tag
         m_Tag=aValue;
      }
		/*!	
			Getting a tag.
			\return A value (type string).
 		*/        
      string Tag(){ // Getting a tag
         return(m_Tag);
      }               
};

//+------------------------------------------------------------------+
//|         Class CRadioGroup                                        |
//+------------------------------------------------------------------+

/*!
   \brief   Radio Button control.
   \details A group of related radio buttons. The coordinates of each 
            radio button are specified separately, with respect to the anchor point
            of the entire group. Work in subwindows is supported. 
   \remark	One radio button consists of three labels (OBJ_LABEL), one
            for the background, the second one for the edge or edge with a point, the third
            one for the name. To get the names of the labels, to the parameter aName add 
            "_B", "_D", "_L".
*/

class CRadioGroup{
   protected:
      struct sRBut{
         string NameRound;
         string NameDot;
         string NameLabel;
         string Caption;
         int Left;
         int Top;
      };
      sRBut m_Button[];
      int m_Left;
      int m_Top;
      int m_Value;
      bool m_Visible;
      color m_RoundColor;
      color m_DotColor;
      color m_LabelColor;      
      string m_Name;
      int m_SubWindow;
      int m_Width;
      int m_Height;
      string m_Tag;
         void Create(){
            for(int i=0;i<ArraySize(m_Button);i++){
               w.Label(m_Button[i].NameRound,m_SubWindow,m_Left+m_Button[i].Left,m_Top+m_Button[i].Top,CharToString(108),m_RoundColor,12,"Wingdings");
               w.Label(m_Button[i].NameDot,m_SubWindow,m_Left+m_Button[i].Left,m_Top+m_Button[i].Top,CharToString(161),m_DotColor,12,"Wingdings");               
                  if(m_Button[i].Caption!=""){
                     w.Label(m_Button[i].NameLabel,m_SubWindow,m_Left+m_Button[i].Left+13,m_Top+m_Button[i].Top+3,m_Button[i].Caption,m_LabelColor,7,"Arial");
                  }  
                  if(m_Value>-1){
                     g.SetText(m_Button[m_Value].NameDot,CharToString(164));
                  }
            }
         }
         void Delete(){
            for(int i=0;i<ArraySize(m_Button);i++){
               ObjectDelete(0,m_Button[i].NameRound);
               ObjectDelete(0,m_Button[i].NameDot);
               ObjectDelete(0,m_Button[i].NameLabel);
            }
         }
   public:
		/*!	
			Control initialization.
            \param		string aName="CRadioGroup" - name.
 		*/      
      void Init(string aName="CRadioGroup"){
         m_RoundColor=ClrScheme.Color(0);
         m_DotColor=ClrScheme.Color(1);
         m_LabelColor=ClrScheme.Color(2);
         m_Name=aName;
         ArrayResize(m_Button,0);
         m_Value=-1;
         m_Visible=false;
         m_SubWindow=0;
         m_Left=0;
         m_Top=0;
         m_Width=0;
         m_Height=0;         
         m_Tag="";
      }
		/*!	
			Adding a parameter.
            \param		string aCaption="Radio" - a label near a button,
            \param		int aLeft - the X coordinate (distance from the left group border),
            \param		int aTop - the Y coordinate (distance from the upper group border).
 		*/         
      void AddButton(string aCaption="Radio",int aLeft=0,int aTop=0){
         int m_LastIndex=ArraySize(m_Button);
         ArrayResize(m_Button,m_LastIndex+1);
         m_Button[m_LastIndex].NameRound=m_Name+"_B("+IntegerToString(m_LastIndex)+")";
         m_Button[m_LastIndex].NameDot=m_Name+"_D("+IntegerToString(m_LastIndex)+")";
         m_Button[m_LastIndex].NameLabel=m_Name+"_L("+IntegerToString(m_LastIndex)+")";
         m_Button[m_LastIndex].Caption=aCaption;
         m_Button[m_LastIndex].Left=aLeft;
         m_Button[m_LastIndex].Top=aTop;
         m_Width=MathMax(m_Width,aLeft+14);
         m_Height=MathMax(m_Height,aTop+14);         
      }
		/*!	
			Enable visibility at a given position.
         \param		int aLeft - the X coordinate (distance from the left chart border),
         \param		int aTop - the Y coordinate (distance from the upper chart border).			
 		*/        
      void Show(int aLeft,int aTop){
         m_Left=aLeft;
         m_Top=aTop;
         Show();
      }
		/*!	
			Enable visibility.
 		*/         
      void Show(){
         m_Visible=true;
         Create();
         ChartRedraw(0);
      }
		/*!	
			Hiding a control (delete objects).
 		*/       
      void Hide(){
         m_Visible=false;
         Delete();
         ChartRedraw(0);
      } 
		/*!	
			Update (hide and show with new parameters).
 		*/        
      void Refresh(){
         Delete();
         Create();
         ChartRedraw(0);
      }
		/*!	
			Setting the X and Y coordinates.
            \param		int aLeft - the X coordinate (distance from the left chart border),
            \param		int aTop - the Y coordinate (distance from the upper chart border).
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/    
      void SetPos(int aLeft,int aTop){
         m_Left=aLeft;
         m_Top=aTop;
      }
		/*!	
			Setting the X coordinate.
            \param		int aLeft - the X coordinate (distance from the left chart border).
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/       
      void SetPosLeft(int aLeft){
         m_Left=aLeft;
      
      }  
		/*!	
			Setting the Y coordinate.
            \param		int aTop - the Y coordinate (distance from the upper chart border).
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/           
      void SetPosTop(int aTop){
         m_Top=aTop;
      }  
		/*!	
			Getting the X coordinate.
			\return  Value (type int).
 		*/ 
      int Left(){
         return(m_Left);
      }
		/*!	
			Getting the Y coordinate.
			\return  Value (type int).
 		*/   
      int Top(){
         return(m_Top);
      }
		/*!	
			Getting width.
			\return  Value (type int).
			\remark  Label width is not considered.
 		*/  
      int Width(){
         return(m_Width);
      }
		/*!	
			Getting height.
			\return  Value (type int).
 		*/  
      int Height(){
         return(m_Height);
      }
		/*!	
			Setting the value (radio button on).
			\param		string aValue - index of a radio button.	
 		*/         
      void SetValue(int aValue){
            if(m_Value>-1 && m_Visible){
               g.SetText(m_Button[m_Value].NameDot,CharToString(161));
               g.Redraw();
            }
         m_Value=aValue;
         m_Value=MathMin(m_Value,ArraySize(m_Button)-1);
            if(m_Value>-1 && m_Visible){
               g.SetText(m_Button[m_Value].NameDot,CharToString(164));
               g.Redraw();
            }    
                 
      }      
		/*!	
			Getting the value (index of a switched on radio button).
			\return Type int.
 		*/ 
      int Value(){
         return(m_Value);
      }
		/*!
			Event handling method.
			\remark  The method is called from the OnChartEvent() function, all parameters correspond to the parameters of the OnChartEvent() function.
			\return  0 or 1. 0 - no event. 1 – event of value change by user.
 		*/         
      int Event(const int id,const long& lparam,const double& dparam,const string& sparam){
         int m_event=0;
            if(id==CHARTEVENT_OBJECT_CLICK){
               if(StringFind(sparam,m_Name,0)==0){
                  int m_pos1=StringFind(sparam,"(",0);
                  int m_pos2=StringFind(sparam,")",0);
                  int m_Index=(int)StringToInteger(StringSubstr(sparam,m_pos1+1,m_pos2-m_pos1-1));
                     if(m_Index!=m_Value){
                        SetValue(m_Index);
                        m_event=1;
                     }
               }
            }    
         return(m_event);
      }    
		/*!	
			Setting a subwindow by a number.
			\param int aNumber - subwindow number.
 		*/           
      void SetSubWindow(int aNumber){
         int m_itmp=(int)MathMax(aNumber,0);
            if(m_itmp!=m_SubWindow){
               m_SubWindow=m_itmp;
               Refresh();
            }
      }   
		/*!	
			Setting a subwindow by the subwindow name.
			\param string aName - subwindow name.
 		*/              
      void SetSubWindow(string aName){
         SetSubWindow(ChartWindowFind(0,aName));
      }  
		/*!	
			Setting a tag.
			\param string aValue - text.
 		*/        
      void SetTag(string aValue){ // Setting a tag
         m_Tag=aValue;
      }
		/*!	
			Getting a tag.
			\return A value (type string).
 		*/        
      string Tag(){ // Getting a tag
         return(m_Tag);
      }                   
};

//+------------------------------------------------------------------+
//|         Class CVScrollBar                                         |
//+------------------------------------------------------------------+

/*!
   \brief   Graphic control element Vertical Scroll Bar.
   \details Operation in subwindows supported. 
   \remark	One control consists of five graphical objects 
            Text Box: upper button, lower button, slider,
            upper bar part (between the upper button and the slider),
            lower bar part (between the lower button and the slider),
            To get the names, to the parameter aName add 
            "_LB" (buttons), "_UF" and "_LF" (bars), "_S" (slider).
*/

class CVScrollBar{
   protected:
      string m_NameUpperButton;
      string m_NameLowerButton;
      string m_NameUpperField;
      string m_NameLowerField;
      string m_NameSlider;
      int m_Left;
      int m_Top;      
      int m_Height;
      int m_Width;  
      int m_Min;
      int m_Max;
      int m_SmallChange;
      int m_LageChange;
      int m_Value;
      bool m_SliderSelected;
      int m_SliderHeight;
      int m_Range;
      int m_A;
      int m_D;
      int m_L;
      int m_G;
      int m_T;
      int m_E;
      int m_K;
      int m_N;
      color m_BorderColor;
      color m_BarColor;
      color m_ButtonColor;
      color m_WarningColor; 
      color m_TxtColor;
      color m_SliderSelectedColor;
      color m_ButtonFlashColor;
      color m_BarFlashColor;
      int m_FontSize;
      bool m_Visible;
      int m_SubWindow;
      string m_Tag;
         void SetWidthAndFontSize(int aValue){
            // 13 18 19 24 30
            // 6  7  8  10 14                   
            switch(aValue){
               case 1:
                  m_Width=13;
                  m_FontSize=6;               
               break;
               case 2:
                  m_Width=19;
                  m_FontSize=8;                
               break;
               case 3:
                  m_Width=24;
                  m_FontSize=10;   
               break;                
               case 4:
                  m_Width=30;
                  m_FontSize=14;                  
               break;
            }   
         }               
         void SolveMainPositions(){
               if(m_Max<m_Min){
                  int m_tmp=m_Max;
                  m_Max=m_Min;
                  m_Min=m_tmp;
               }
            if(m_Max==m_Min)m_Max=m_Min+1;
            m_Range=m_Max-m_Min;   
            m_LageChange=MathMin(m_LageChange,m_Range);
            m_SmallChange=MathMin(m_SmallChange,m_LageChange);
            m_LageChange=(int)MathMax(m_LageChange,1);
            m_SmallChange=(int)MathMax(m_SmallChange,1);            
            m_D=m_Height-2*m_Width;
            m_SliderHeight=m_D/(m_Range/m_LageChange+1); 
            m_SliderHeight=(int)MathMax(m_SliderHeight,3);
            m_L=m_D-m_SliderHeight;
            m_G=m_Top-m_Width+m_Height; 
            m_E=m_Top+m_Width;  
            m_T=m_E+m_SliderHeight;  
            m_K=m_D-m_SliderHeight;
            m_N=m_Top+m_Width+m_SliderHeight/2;
         }
         void SetObjectsPos(){  
            m_Value=MathMin(MathMax(m_Value,m_Min),m_Max); 
            m_A=m_K*(m_Value-m_Min)/m_Range;
            g.Attach(m_NameUpperField);   g.SetXYDistance(m_Left,m_E-1);      g.SetXYSize(m_Width,m_A+2);
            g.Attach(m_NameLowerField);   g.SetXYDistance(m_Left,m_T+m_A-1);  g.SetXYSize(m_Width,m_L-m_A+2);  
            g.Attach(m_NameSlider);       g.SetXYDistance(m_Left,m_E+m_A-1);  g.SetXYSize(m_Width,m_SliderHeight+2); 
            g.Attach(m_NameSlider);       g.SetBgColor(m_ButtonColor);        
            g.Attach(m_NameLowerButton);  g.SetXYDistance(m_Left,m_Top);      g.SetXYSize(m_Width,m_Width);
            g.Attach(m_NameUpperButton);  g.SetXYDistance(m_Left,m_G);        g.SetXYSize(m_Width,m_Width); 
            ChartRedraw(0);
         } 
         void Create(){
            m_Value=MathMin(MathMax(m_Value,m_Min),m_Max); 
            m_A=m_K*(m_Value-m_Min)/m_Range;
            w.Edit(m_NameUpperField,m_SubWindow,m_Left,m_E-1,m_Width,m_A+2,"",m_BarColor,m_BorderColor);
            g.SetReadOnly(m_NameUpperField,true);
            w.Edit(m_NameLowerField,m_SubWindow,m_Left,m_T+m_A-1,m_Width,m_L-m_A+2,"",m_BarColor,m_BorderColor);
            g.SetReadOnly(m_NameLowerField,true);
            w.Edit(m_NameSlider,m_SubWindow,m_Left,m_E+m_A-1,m_Width,m_SliderHeight+2,"",m_ButtonColor,m_BorderColor);
            g.SetReadOnly(m_NameSlider,true);
            w.Edit(m_NameLowerButton,m_SubWindow,m_Left,m_Top,m_Width,m_Width," /\\",m_ButtonColor,m_BorderColor,m_FontSize,"Arial");
            g.SetReadOnly(m_NameLowerButton,true);
            w.Edit(m_NameUpperButton,m_SubWindow,m_Left,m_G,m_Width,m_Width," \\/",m_ButtonColor,m_BorderColor,m_FontSize,"Arial");
            g.SetReadOnly(m_NameUpperButton,true);            
         }  
         void Delete(){
            ObjectDelete(0,m_NameUpperButton);
            ObjectDelete(0,m_NameLowerButton);
            ObjectDelete(0,m_NameUpperField);
            ObjectDelete(0,m_NameLowerField);
            ObjectDelete(0,m_NameSlider);
         }   
         void ChartClickY(double aDparam,int & aY){
            long hs=0;
            long ps=0;
               for(int i=0;i<ChartGetInteger(0,CHART_WINDOWS_TOTAL);i++){
                  hs+=3+ChartGetInteger(0,CHART_HEIGHT_IN_PIXELS,i);
                     if(hs>=aDparam){
                        aY=(int)(aDparam-ps-3); 
                        break;
                     }
                  ps=hs;
               } 
         }  
         void RePose(){
            if(m_Visible){
               SolveMainPositions(); 
               SetObjectsPos();
               ChartRedraw();
            }
         }  
         void Flash(string aName,color aFlash,color aNormal){
            g.SetBgColor(aName,aFlash);
            g.Redraw();
            Sleep(100);
            g.SetBgColor(aName,aNormal);
            g.Redraw();      
         }                           
   public: 
		/*!	
			Control initialization.
            \param		string aName="CVScrollBar" - name,
            \param		int aHeight=100 - height,
            \param		int aSizeType=1 - size (four sizes 1-4).
 		*/      
      void Init(string aName="CVScrollBar",int aHeight=100,int aSizeType=1){
         m_Visible=false;         
         m_NameUpperButton=aName+"_UB";
         m_NameLowerButton=aName+"_LB";
         m_NameUpperField=aName+"_UF";
         m_NameLowerField=aName+"_LF";
         m_NameSlider=aName+"_S";        
         //=============================
         m_BorderColor=ClrScheme.Color(6);
         m_BarColor=ClrScheme.Color(7);
         m_ButtonColor=ClrScheme.Color(8);
         m_WarningColor=ClrScheme.Color(9); 
         m_TxtColor=ClrScheme.Color(10);
         m_SliderSelectedColor=ClrScheme.Color(11);
         m_ButtonFlashColor=ClrScheme.Color(12);
         m_BarFlashColor=ClrScheme.Color(13);
         //=============================
         m_Min=0;
         m_Max=100;
         m_SmallChange=1;
         m_LageChange=10;
         m_Value=0;
         m_Height=aHeight;         
         m_SubWindow=0;
         SetWidthAndFontSize(aSizeType);
         m_Tag="";
      }
		/*!	
			Enable visibility.
 		*/         
      void Show(){
         m_Visible=true;
         SolveMainPositions();
         Create();
         ChartRedraw();
      }  
		/*!	
			Enable visibility at a given position.
         \param		int aLeft - the X coordinate (distance from the left chart border),
         \param		int aTop - the Y coordinate (distance from the upper chart border).			
 		*/               
      void Show(int aLeft,int aTop){ 
         m_Left=aLeft;
         m_Top=aTop;
         Show();
      } 
		/*!	
			Hiding a control (delete objects).
 		*/         
      void Hide(){
         m_Visible=false;
         Delete();
         ChartRedraw();
      } 
		/*!	
			Update (hide and show with new parameters).
 		*/               
      void Refresh(){
         if(m_Visible){
            Delete();
            SolveMainPositions();
            Create();
            ChartRedraw();
         }
      }
		/*!	
			Visibility of a control element.
			\return Type bool. True/false - visible/hidden.
 		*/  
      bool Visible(){
         return(m_Visible);
      }
		/*!	
			Setting the X and Y coordinates.
            \param		int aLeft - the X coordinate (distance from the left chart border),
            \param		int aTop - the Y coordinate (distance from the upper chart border).
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/        
      void SetPos(int aLeft,int aTop){
         m_Left=aLeft;
         m_Top=aTop;
      }
		/*!	
			Setting the X coordinate.
            \param		int aLeft - the X coordinate (distance from the left chart border).
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/       
      void SetPosLeft(int aLeft){
         m_Left=aLeft;
      }   
		/*!	
			Setting the Y coordinate.
            \param		int aTop - the Y coordinate (distance from the upper chart border).
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/   		             
      void SetPosTop(int aTop){
         m_Top=aTop;
      } 
		/*!	
			Setting the size.
            \param		int aValue - size from 1 up to 4.
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/ 
      void SetSizeType(int aValue){
         SetWidthAndFontSize(aValue);
      }  
		/*!	
			Getting the X coordinate.
			\return  Value (type int).
 		*/             
      int Left(){
         return(m_Left);
      }
		/*!	
			Getting the Y coordinate.
			\return  Value (type int).
 		*/    
      int Top(){
         return(m_Top);
      }
		/*!	
			Setting the height.
            \param		int aWidth - height.
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/  
      void SetHeight(int aValue){
         m_Height=aValue;
      }
		/*!	
			Getting height.
			\return  Value (type int).
 		*/         
      int Height(){
         return(m_Height);
      }   
		/*!	
			Getting width.
			\return  Value (type int).
 		*/   
      int Width(){
         return(m_Width);
      }
		/*!	
			Setting the minimum value.
			\param double aValue - value. 
 		*/        
      void SetMin(int aValue){
         m_Min=aValue;
      }
		/*!	
			Setting the maximum value.
			\param double aValue - value. 
 		*/        
      void SetMax(int aValue){
         m_Max=aValue;
      }
		/*!	
			Setting a small change (when you click on the buttons).
			\param double aValue - value. 
 		*/         
      void SetSmallChange(int aValue){
         m_SmallChange=aValue;
      }
		/*!	
			Setting a large change (when you click on the strip).
			\param double aValue - value. 
 		*/      
      void SetLageChange(int aValue){
         m_LageChange=aValue;
      }      
		/*!	
			Setting the value (the slider position).
			\param double aValue - value. 
 		*/        
      void SetValue(int aValue){
         m_Value=aValue;
         RePose();
      }  
		/*!	
			Getting the minimum value.
			\return Value (type int).
 		*/         
      int Min(){
         return(m_Min);
      }
		/*!	
			Getting the maximum value.
			\return Value (type int).
 		*/        
      int Max(){
         return(m_Max);
      }
		/*!	
			Getting the small change.
			\return Value (type int).
 		*/       
      int SmallChange(){
         return(m_SmallChange);
      }
		/*!	
			Getting the large change.
			\return Value (type int).
 		*/        
      int LageChange(){
         return(m_LageChange);
      }  
		/*!	
			Getting the value (the slider position).
			\return Value (type int).
 		*/           
      int Value(){
         return(m_Value);
      }  
		/*!	
			Event handling method.
			\remark  The method is called from the OnChartEvent() function, all parameters correspond to the parameters of the OnChartEvent() function.
			\return  0 or 1. 0 - no event. 1 – event of value change by user.
 		*/             
      int Event(const int id,const long & lparam,const double & dparam,const string & sparam){
         int m_old=m_Value;
            if(id==CHARTEVENT_OBJECT_CLICK){
               int m_Y;
               ChartClickY(dparam,m_Y);
                  if(sparam==m_NameLowerButton){
                        if(m_Value>m_Min){
                           Flash(m_NameLowerButton,m_ButtonFlashColor,m_ButtonColor);
                        }
                        else{
                           Flash(m_NameLowerButton,m_WarningColor,m_ButtonColor);
                        }                           
                        if(m_SliderSelected){
                           m_Value=m_Min;
                           m_SliderSelected=false;
                        }
                        else{   
                           m_Value-=m_SmallChange;
                           m_Value=MathMax(m_Value,m_Min);
                        }
                     RePose(); 
                  }
                  if(sparam==m_NameUpperButton){
                        if(m_Value<m_Max){
                           Flash(m_NameUpperButton,m_ButtonFlashColor,m_ButtonColor);
                        }
                        else{
                           Flash(m_NameUpperButton,m_WarningColor,m_ButtonColor);
                        }                    
                        if(m_SliderSelected){
                           m_Value=m_Max;
                           m_SliderSelected=false;
                        }
                        else{              
                           m_Value+=m_SmallChange;
                           m_Value=MathMin(m_Value,m_Max);
                        }                  
                     RePose();
                  }         
                  if(sparam==m_NameUpperField){
                     Flash(m_NameUpperField,m_BarFlashColor,m_BarColor);           
                        if(m_SliderSelected){
                           m_Value=m_Min+m_Range*(m_Y-m_N)/m_L;
                           m_Value=MathMin(MathMax(m_Value,m_Min),m_Max);
                           m_SliderSelected=false;
                        }
                        else{
                           m_Value-=m_LageChange;
                           m_Value=MathMin(MathMax(m_Value,m_Min),m_Max);
                        }                  
                     RePose();  
                  }
                  if(sparam==m_NameLowerField){
                     Flash(m_NameLowerField,m_BarFlashColor,m_BarColor);               
                        if(m_SliderSelected){
                           m_Value=m_Min+m_Range*(m_Y-m_N)/m_L;
                           m_Value=MathMin(MathMax(m_Value,m_Min),m_Max);
                           m_SliderSelected=false;
                        }
                        else{
                           m_Value+=m_LageChange;
                           m_Value=MathMin(MathMax(m_Value,m_Min),m_Max);
                        }                  
                     RePose();      
                  } 
                  if(sparam==m_NameSlider){                  
                     if(m_SliderSelected){   
                        g.Attach(m_NameSlider);       
                        m_SliderSelected=false;
                        g.SetBgColor(m_ButtonColor);
                        g.Redraw();
                     }
                     else{
                        m_SliderSelected=true;
                        g.Attach(m_NameSlider);
                        g.SetBgColor(m_SliderSelectedColor);
                        g.Redraw();
                     }
                  }       
            }
            if(m_old!=m_Value){
               return(1);
            }
         return(0);
      }
		/*!	
			Setting a subwindow by a number.
			\param int aNumber - subwindow number.
 		*/        
      void SetSubWindow(int aNumber){
         int m_itmp=(int)MathMax(aNumber,0);
            if(m_itmp!=m_SubWindow){
               m_SubWindow=m_itmp;
               Refresh();
            }
      }  
		/*!	
			Setting a subwindow by the subwindow name.
			\param string aName - subwindow name.
 		*/               
      void SetSubWindow(string aName){
         SetSubWindow(ChartWindowFind(0,aName));
      }  
		/*!	
			Setting a tag.
			\param string aValue - text.
 		*/        
      void SetTag(string aValue){ // Setting a tag
         m_Tag=aValue;
      }
		/*!	
			Getting a tag.
			\return A value (type string).
 		*/         
      string Tag(){ // Getting a tag
         return(m_Tag);
      }         
};

//+------------------------------------------------------------------+
//|         Class CHScrollBar                                         |
//+------------------------------------------------------------------+

/*!
   \brief   Graphic control element Horizontal Scroll Bar.
   \details Operation in subwindows supported. 
   \remark	One control consists of five graphical objects 
            Text Box: left button, right button, slider,
            left bar part (between the left button and the slider),
            right bar part (between the right button and the slider),
            To get the names, to the parameter aName add 
            "_LB" (buttons), "_UF" and "_LF" (bars), "_S" (slider).
*/

class CHScrollBar{
   protected:
      string m_NameUpperButton;
      string m_NameLowerButton;
      string m_NameUpperField;
      string m_NameLowerField;
      string m_NameSlider;
      int m_Left;
      int m_Top;      
      int m_Height;
      int m_Width;  
      int m_Min;
      int m_Max;
      int m_SmallChange;
      int m_LageChange;
      int m_Value;
      bool m_SliderSelected;
      int m_SliderWidth;
      int m_Range;
      int m_A;
      int m_D;
      int m_L;
      int m_G;
      int m_T;
      int m_E;
      int m_K;
      int m_N;
      color m_BorderColor;
      color m_BarColor;
      color m_ButtonColor;
      color m_WarningColor; 
      color m_TxtColor;
      color m_SliderSelectedColor;
      color m_ButtonFlashColor;
      color m_BarFlashColor;
      int m_FontSize;
      bool m_Visible;
      int m_SubWindow;
      string m_Tag;
         void SetWidthAndFontSize(int aValue){
            switch(aValue){
               case 1:
                  m_Height=13;
                  m_FontSize=8;               
               break;
               case 2:
                  m_Height=19;
                  m_FontSize=11;                
               break;
               case 3:
                  m_Height=24;
                  m_FontSize=15;   
               break;                
               case 4:
                  m_Height=30;
                  m_FontSize=19;                  
               break;
            }   
         }               
         void SolveMainPositions(){
               if(m_Max<m_Min){
                  int m_tmp=m_Max;
                  m_Max=m_Min;
                  m_Min=m_tmp;
               }
            if(m_Max==m_Min)m_Max=m_Min+1;
            m_Range=m_Max-m_Min;   
            m_LageChange=MathMin(m_LageChange,m_Range);
            m_SmallChange=MathMin(m_SmallChange,m_LageChange);
            m_LageChange=(int)MathMax(m_LageChange,1);
            m_SmallChange=(int)MathMax(m_SmallChange,1);            
            m_D=m_Width-2*m_Height;
            m_SliderWidth=m_D/(m_Range/m_LageChange+1); 
            m_SliderWidth=(int)MathMax(m_SliderWidth,3);
            m_L=m_D-m_SliderWidth;
            m_G=m_Left-m_Height+m_Width; 
            m_E=m_Left+m_Height;  
            m_T=m_E+m_SliderWidth;  
            m_K=m_D-m_SliderWidth;
            m_N=m_Left+m_Height+m_SliderWidth/2;
         }
         void SetObjectsPos(){  
            m_Value=MathMin(MathMax(m_Value,m_Min),m_Max); 
            m_A=m_K*(m_Value-m_Min)/m_Range;
            g.Attach(m_NameUpperField);   g.SetXYDistance(m_E-1,m_Top);      g.SetXYSize(m_A+2,m_Height);
            g.Attach(m_NameLowerField);   g.SetXYDistance(m_T+m_A-1,m_Top);  g.SetXYSize(m_L-m_A+2,m_Height);  
            g.Attach(m_NameSlider);       g.SetXYDistance(m_E+m_A-1,m_Top);  g.SetXYSize(m_SliderWidth+2,m_Height); 
            g.Attach(m_NameSlider);       g.SetBgColor(m_ButtonColor);        
            g.Attach(m_NameLowerButton);  g.SetXYDistance(m_Left,m_Top);     g.SetXYSize(m_Height,m_Height);
            g.Attach(m_NameUpperButton);  g.SetXYDistance(m_G,m_Top);        g.SetXYSize(m_Height,m_Height); 
            ChartRedraw(0);
         } 
         void Create(){
            m_Value=MathMin(MathMax(m_Value,m_Min),m_Max); 
            m_A=m_K*(m_Value-m_Min)/m_Range;
            w.Edit(m_NameUpperField,m_SubWindow,m_E-1,m_Top,m_A+2,m_Height,"",m_BarColor,m_BorderColor);
            g.SetReadOnly(m_NameUpperField,true);
            w.Edit(m_NameLowerField,m_SubWindow,m_T+m_A-1,m_Top,m_L-m_A+2,m_Height,"",m_BarColor,m_BorderColor);
            g.SetReadOnly(m_NameLowerField,true);
            w.Edit(m_NameSlider,m_SubWindow,m_E+m_A-1,m_Top,m_SliderWidth+2,m_Height,"",m_ButtonColor,m_BorderColor);
            g.SetReadOnly(m_NameSlider,true);
            w.Edit(m_NameLowerButton,m_SubWindow,m_Left,m_Top,m_Height,m_Height,"<",m_ButtonColor,m_BorderColor,m_FontSize,"Arial");
            g.SetReadOnly(m_NameLowerButton,true);
            w.Edit(m_NameUpperButton,m_SubWindow,m_G,m_Top,m_Height,m_Height,">",m_ButtonColor,m_BorderColor,m_FontSize,"Arial");
            g.SetReadOnly(m_NameUpperButton,true);            
         }  
         void Delete(){
            ObjectDelete(0,m_NameUpperButton);
            ObjectDelete(0,m_NameLowerButton);
            ObjectDelete(0,m_NameUpperField);
            ObjectDelete(0,m_NameLowerField);
            ObjectDelete(0,m_NameSlider);
         }   
         void RePose(){
            if(m_Visible){
               SolveMainPositions(); 
               SetObjectsPos();
               ChartRedraw();
            }
         }  
         void Flash(string aName,color aFlash,color aNormal){
            g.SetBgColor(aName,aFlash);
            g.Redraw();
            Sleep(100);
            g.SetBgColor(aName,aNormal);
            g.Redraw();      
         }                           
   public: 
		/*!	
			Control initialization.
            \param		string aName="CHScrollBar" - name,
            \param		int aHeight=100 - height,
            \param		int aSizeType=1 - size (four sizes 1-4).
 		*/
      void Init(string aName="CHScrollBar",int aWidth=100,int aSizeType=1){
         m_Visible=false;         
         m_NameUpperButton=aName+"_UB";
         m_NameLowerButton=aName+"_LB";
         m_NameUpperField=aName+"_UF";
         m_NameLowerField=aName+"_LF";
         m_NameSlider=aName+"_S";        
         //=============================
         m_BorderColor=ClrScheme.Color(6);
         m_BarColor=ClrScheme.Color(7);
         m_ButtonColor=ClrScheme.Color(8);
         m_WarningColor=ClrScheme.Color(9); 
         m_TxtColor=ClrScheme.Color(10);
         m_SliderSelectedColor=ClrScheme.Color(11);
         m_ButtonFlashColor=ClrScheme.Color(12);
         m_BarFlashColor=ClrScheme.Color(13);
         //=============================
         m_Min=0;
         m_Max=100;
         m_SmallChange=1;
         m_LageChange=10;
         m_Value=0;
         m_Width=aWidth;         
         m_SubWindow=0;
         SetWidthAndFontSize(aSizeType);
         m_Tag="";
      }
		/*!	
			Enable visibility.
 		*/        
      void Show(){
         m_Visible=true;
         SolveMainPositions();
         Create();
         ChartRedraw();
      } 
		/*!	
			Enable visibility at a given position.
         \param		int aLeft - the X coordinate (distance from the left chart border),
         \param		int aTop - the Y coordinate (distance from the upper chart border).			
 		*/               
      void Show(int aLeft,int aTop){ 
         m_Left=aLeft;
         m_Top=aTop;
         Show();
      }   
		/*!	
			Hiding a control (delete objects).
 		*/         
      void Hide(){
         m_Visible=false;
         Delete();
         ChartRedraw();
      }     
		/*!	
			Update (hide and show with new parameters).
 		*/          
      void Refresh(){
         if(m_Visible){
            Delete();
            SolveMainPositions();
            Create();
            ChartRedraw();
         }
      }
		/*!	
			Visibility of a control element.
			\return Type bool. True/false - visible/hidden.
 		*/ 
      bool Visible(){
         return(m_Visible);
      }
		/*!	
			Setting the X and Y coordinates.
            \param		int aLeft - the X coordinate (distance from the left chart border),
            \param		int aTop - the Y coordinate (distance from the upper chart border).
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/  
      void SetPos(int aLeft,int aTop){
         m_Left=aLeft;
         m_Top=aTop;
      }
		/*!	
			Setting the X coordinate.
            \param		int aLeft - the X coordinate (distance from the left chart border).
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/  
      void SetPosLeft(int aLeft){
         m_Left=aLeft;
      }    
		/*!	
			Setting the Y coordinate.
            \param		int aTop - the Y coordinate (distance from the upper chart border).
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/  
      void SetPosTop(int aTop){
         m_Top=aTop;
      } 
		/*!	
			Setting the size.
            \param		int aValue - size from 1 up to 4.
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/ 
      void SetSizeType(int aValue){
         SetWidthAndFontSize(aValue);
      }
		/*!	
			Getting the X coordinate.
			\return  Value (type int).
 		*/         
      int Left(){
         return(m_Left);
      }
		/*!	
			Getting the Y coordinate.
			\return  Value (type int).
 		*/  
      int Top(){
         return(m_Top);
      }
		/*!	
			Setting the width.
            \param		int aWidth - width.
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/        
      void SetWidth(int aValue){
         m_Width=aValue;
      }
		/*!	
			Getting height.
			\return  Value (type int).
 		*/  
      int Height(){
         return(m_Height);
      }   
		/*!	
			Getting width.
			\return  Value (type int).
 		*/       
      int Width(){
         return(m_Width);
      }
		/*!	
			Setting the minimum value.
			\param double aValue - value. 
 		*/  
      void SetMin(int aValue){
         m_Min=aValue;
      }
		/*!	
			Setting the maximum value.
			\param double aValue - value. 
 		*/         
      void SetMax(int aValue){
         m_Max=aValue;
      }
		/*!	
			Setting a small change (when you click on the buttons).
			\param double aValue - value. 
 		*/         
      void SetSmallChange(int aValue){
         m_SmallChange=aValue;
      }
		/*!	
			Setting a large change (when you click on the strip).
			\param double aValue - value. 
 		*/         
      void SetLageChange(int aValue){
         m_LageChange=aValue;
      }     
		/*!	
			Setting the value (the slider position).
			\param double aValue - value. 
 		*/  
      void SetValue(int aValue){
         m_Value=aValue;
         RePose();
      }  
		/*!	
			Getting the minimum value.
			\return Value (type int).
 		*/          
      int Min(){
         return(m_Min);
      }
		/*!	
			Getting the maximum value.
			\return Value (type int).
 		*/        
      int Max(){
         return(m_Max);
      }
		/*!	
			Getting the small change.
			\return Value (type int).
 		*/  
      int SmallChange(){
         return(m_SmallChange);
      }
		/*!	
			Getting the large change.
			\return Value (type int).
 		*/        
      int LageChange(){
         return(m_LageChange);
      }   
		/*!	
			Getting the value (the slider position).
			\return Value (type int).
 		*/      
      int Value(){
         return(m_Value);
      }  
		/*!	
			Event handling method.
			\remark  The method is called from the OnChartEvent() function, all parameters correspond to the parameters of the OnChartEvent() function.
			\return  0 or 1. 0 - no event. 1 – event of value change by user.
 		*/              
      int Event(const int id,const long & lparam,const double & dparam,const string & sparam){
         int m_old=m_Value;
            if(id==CHARTEVENT_OBJECT_CLICK){
               int m_Y=(int)lparam-2;
                  if(sparam==m_NameLowerButton){
                        if(m_Value>m_Min){
                           Flash(m_NameLowerButton,m_ButtonFlashColor,m_ButtonColor);
                        }
                        else{
                           Flash(m_NameLowerButton,m_WarningColor,m_ButtonColor);
                        }                           
                        if(m_SliderSelected){
                           m_Value=m_Min;
                           m_SliderSelected=false;
                        }
                        else{   
                           m_Value-=m_SmallChange;
                           m_Value=MathMax(m_Value,m_Min);
                        }
                     RePose(); 
                  }
                  if(sparam==m_NameUpperButton){
                        if(m_Value<m_Max){
                           Flash(m_NameUpperButton,m_ButtonFlashColor,m_ButtonColor);
                        }
                        else{
                           Flash(m_NameUpperButton,m_WarningColor,m_ButtonColor);
                        }                    
                        if(m_SliderSelected){
                           m_Value=m_Max;
                           m_SliderSelected=false;
                        }
                        else{              
                           m_Value+=m_SmallChange;
                           m_Value=MathMin(m_Value,m_Max);
                        }                  
                     RePose();
                  }         
                  if(sparam==m_NameUpperField){
                     Flash(m_NameUpperField,m_BarFlashColor,m_BarColor);           
                        if(m_SliderSelected){
                           m_Value=m_Min+m_Range*(m_Y-m_N)/m_L;
                           m_Value=MathMin(MathMax(m_Value,m_Min),m_Max);
                           m_SliderSelected=false;
                        }
                        else{
                           m_Value-=m_LageChange;
                           m_Value=MathMin(MathMax(m_Value,m_Min),m_Max);
                        }                  
                     RePose();  
                  }
                  if(sparam==m_NameLowerField){
                     Flash(m_NameLowerField,m_BarFlashColor,m_BarColor);               
                        if(m_SliderSelected){
                           m_Value=m_Min+m_Range*(m_Y-m_N)/m_L;
                           m_Value=MathMin(MathMax(m_Value,m_Min),m_Max);
                           m_SliderSelected=false;
                        }
                        else{
                           m_Value+=m_LageChange;
                           m_Value=MathMin(MathMax(m_Value,m_Min),m_Max);
                        }                  
                     RePose();      
                  } 
                  if(sparam==m_NameSlider){                  
                     if(m_SliderSelected){   
                        g.Attach(m_NameSlider);       
                        m_SliderSelected=false;
                        g.SetBgColor(m_ButtonColor);
                        g.Redraw();
                     }
                     else{
                        m_SliderSelected=true;
                        g.Attach(m_NameSlider);
                        g.SetBgColor(m_SliderSelectedColor);
                        g.Redraw();
                     }
                  }       
            }
            if(m_old!=m_Value){
               return(1);
            }
         return(0);
      }
		/*!	
			Setting a subwindow by a number.
			\param int aNumber - subwindow number.
 		*/        
      void SetSubWindow(int aNumber){
         int m_itmp=(int)MathMax(aNumber,0);
            if(m_itmp!=m_SubWindow){
               m_SubWindow=m_itmp;
               Refresh();
            }
      }        
		/*!	
			Setting a subwindow by the subwindow name.
			\param string aName - subwindow name.
 		*/          
      void SetSubWindow(string aName){
         SetSubWindow(ChartWindowFind(0,aName));
      }  
		/*!	
			Setting a tag.
			\param string aValue - text.
 		*/           
      void SetTag(string aValue){ // Setting a tag
         m_Tag=aValue;
      }
		/*!	
			Getting a tag.
			\return A value (type string).
 		*/        
      string Tag(){ // Getting a tag
         return(m_Tag);
      }         
};

//+------------------------------------------------------------------+
//|         Class CList                                              |
//+------------------------------------------------------------------+

/*!
   \brief   The List control.
   \details Operation in subwindows supported. 
   \remark	One control consists of a few text fields (OBJ_EDIT)
            and a vertical scroll bar. To get the name of the scroll bar,
            "_SB" is added to aName, to get the names of text fields add "_IT" and
            the index of a text field in parentheses.
*/

class CList{
   protected:
      string m_Name;   
      int m_Left;
      int m_Top;
      int m_Width;
      int m_HeightInItems;      
      int m_Height;
      string m_ItemText[];
      int m_SubWindow;
      CVScrollBar m_sb;
      bool m_Visible;
      int m_Selected;
      color m_BgColor;
      color m_TxtColor;
      color m_SelColor;        
      int m_LastSelected;
      bool m_SbVisible;
      int m_FieldsCount;
      bool m_AllowDeselect;
      void Create(){
         int m_w=m_Width;
            if(ArraySize(m_ItemText)>m_HeightInItems){ // A scrollbar is required
               m_SbVisible=true; // Visibility of a scrollbar
               m_w-=m_sb.Width(); // Width of text fields
               m_sb.SetPos(m_Left+m_w,m_Top); // Setting a scrollbar position
               m_sb.SetHeight(m_Height);
               m_sb.SetMax(ArraySize(m_ItemText)-m_HeightInItems); // Setting the maximum value of a scrollbar
               m_sb.SetLageChange(m_HeightInItems); // Setting the large change of a scrollbar
               m_sb.SetSubWindow(m_SubWindow);
                  if(m_sb.Value()>ArraySize(m_ItemText)-m_HeightInItems){ // Correcting the current scrollbar location
                     m_sb.SetValue(ArraySize(m_ItemText)-m_HeightInItems); 
                  }
               m_w++; // Hide right edges of text filed borders behind the scrollbar
            }
            else{ // No scrollbar
               m_SbVisible=false; // Scrollbar is hidden
               m_sb.SetValue(0); // Setting the scrollbar value
            }
         int s=m_sb.Value(); // Show values starting from the scrollbar value
         int e=MathMin(s+m_HeightInItems,ArraySize(m_ItemText)); // Limit to display the values
         int i=0; // The index of a text field
         string m_ItemName;
            for(;s<e;s++,i++){ // Fields with values
               m_ItemName=m_Name+"_IT("+IntegerToString(i)+")";
               w.Edit(m_ItemName,m_SubWindow,m_Left,m_Top+i*14,m_w,15,m_ItemText[s],m_BgColor,m_TxtColor);
               g.SetReadOnly(m_ItemName,true);
            }  
            for(;i<m_HeightInItems;i++){ // Empty fields
               m_ItemName=m_Name+"_IT("+IntegerToString(i)+")";
               w.Edit(m_ItemName,m_SubWindow,m_Left,m_Top+i*14,m_w,15,"",m_BgColor,m_TxtColor);
               g.SetReadOnly(m_ItemName,true);
            }
         m_FieldsCount=m_HeightInItems;
         SelectedON(); // Change the color of a selected item
      }
      void SelectedON(){
         if(m_Selected>=0){ // There is a selected item
            m_LastSelected=-1; // It is yet unknown if the selected item is visible
            int m_Index=m_Selected-m_sb.Value(); // The index of a text field with a selected item
               if(m_Index>=0 && m_Index<m_HeightInItems){ // The selected item is visible
                  m_LastSelected=m_Index; // Remember to disable then
                  g.SetBgColor(m_Name+"_IT("+IntegerToString(m_Index)+")",m_SelColor); // Set the color of a selected item
               }
         }      
      }
      void SelectedOFF(){
         if(m_LastSelected>=0){ // There is a selected field
            g.SetBgColor(m_Name+"_IT("+IntegerToString(m_LastSelected)+")",m_BgColor); // Change color to normal
            m_LastSelected=-1; // Remember that there is no selected field
         }
      }
      void Delete(){
         for(int i=0;i<m_FieldsCount;i++){
            string m_ItemName=m_Name+"_IT("+IntegerToString(i)+")";
            ObjectDelete(0,m_ItemName);
         }  
      }
      void PutValues(){
         int s=m_sb.Value(); // Show values starting from the scrollbar value
         int e=MathMin(s+m_HeightInItems,ArraySize(m_ItemText)); // Limit to display the values
         int i=0; // The index of a text field
         string m_ItemName;
            for(;s<e;s++,i++){ // Fields with values
               m_ItemName=m_Name+"_IT("+IntegerToString(i)+")";
               g.SetText(m_ItemName,m_ItemText[s]);
            }  
            for(;i<m_HeightInItems;i++){ // Empty fields
               m_ItemName=m_Name+"_IT("+IntegerToString(i)+")";
               g.SetText(m_ItemName," ");
            }      
      }
   public:
		/*!	
			Control initialization.
            \param		string aName="CList" - name,
            \param		int aWidth=100 - width,
            \param		int aHeightInItems=8 - height in rows.
 		*/      
      void Init(string aName="CList",int aWidth=100,int aHeightInItems=8){
         m_Visible=false;
         m_Name=aName; 
         m_Width=aWidth;
         m_HeightInItems=aHeightInItems;         
         m_Left=0;
         m_Top=0;
         ArrayResize(m_ItemText,0);
         //==========================
         m_BgColor=ClrScheme.Color(0);
         m_TxtColor=ClrScheme.Color(1);
         m_SelColor=ClrScheme.Color(14);   
         //==========================      
         m_Height=m_HeightInItems*14+1;
         m_sb.Init(aName+"_SB",m_Height,1);
         m_sb.SetMin(0);
         m_sb.SetValue(0);
         m_sb.SetSmallChange(1);
         m_sb.SetLageChange(aHeightInItems);
         m_Selected=-1;
         m_LastSelected=-1;
         m_SbVisible=false;
         m_AllowDeselect=true;
      }
		/*!	
			Setting the permission to unselect an item.
            \param		bool aValue - true/false - allowed/not allowed.
 		*/       
      void SetAllowDeselect(bool aValue){
         m_AllowDeselect=aValue;
      }
		/*!	
			Getting the permission to unselect an item.
			\return Type bool. True/false - allowed/not allowed.
 		*/    		      
      bool AllowDeselect(){
         return(m_AllowDeselect);
      }  
		/*!	
			Adding an item to the list.
         \param		string aText - text.			
			\remark	   If a control is displayed, update using Refresh() is required.
 		*/   
      void AddItem(string aText){
         ArrayResize(m_ItemText,ArraySize(m_ItemText)+1);
         m_ItemText[ArraySize(m_ItemText)-1]=aText;
      }
		/*!	
			Deleting an item from the list.
         \param		int aIndex - the index of an item to delete.			
			\remark	   If a control is displayed, update using Refresh() is required.
 		*/        
      void DeleteItem(int aIndex){
         if(aIndex<ArraySize(m_ItemText)){
               for(int i=aIndex;i<ArraySize(m_ItemText)-1;i++){
                  m_ItemText[i]=m_ItemText[i+1];
               }
            ArrayResize(m_ItemText,ArraySize(m_ItemText)-1);
               if(aIndex<m_Selected){
                  m_Selected--;
               }
               else if(aIndex==m_Selected){
                  m_Selected=-1;               
               }
         }            
      }
		/*!	
			Setting the X and Y coordinates.
            \param		int aLeft - the X coordinate (distance from the left chart border),
            \param		int aTop - the Y coordinate (distance from the upper chart border).
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/ 
      void SetPos(int aLeft,int aTop){
         m_Left=aLeft;
         m_Top=aTop;
      }
		/*!	
			Setting the X coordinate.
            \param		int aLeft - the X coordinate (distance from the left chart border).
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/       
      void SetPosLeft(int aLeft){
         m_Left=aLeft;
      }   
		/*!	
			Setting the Y coordinate.
            \param		int aTop - the Y coordinate (distance from the upper chart border).
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/           
      void SetPosTop(int aTop){
         m_Top=aTop;
      }
		/*!	
			Enable visibility.
 		*/         
      void Show(){
         m_Visible=true;
         Create();
            if(m_SbVisible){
               m_sb.Show();
            }
            else{
               ChartRedraw(0);
            }               
      }
		/*!	
			Enable visibility at a given position.
         \param		int aLeft - the X coordinate (distance from the left chart border),
         \param		int aTop - the Y coordinate (distance from the upper chart border).			
 		*/  
      void Show(int aLeft,int aTop){
         SetPos(aLeft,aTop);
         Show();
      }
		/*!	
			Hiding a control (delete objects).
 		*/       
      void Hide(){
         m_Visible=false;
         Delete();
            if(m_SbVisible){
               m_sb.Hide();
               m_SbVisible=false;
            }
            else{
               ChartRedraw(0);
            }               
      }
		/*!	
			Visibility of a control element.
			\return Type bool. True/false - visible/hidden.
 		*/       
      bool Visible(){
         return(m_Visible);
      }    
		/*!	
			Update (hide and show with new parameters).
 		*/          
      void Refresh(){
         if(m_Visible){      
            Hide();
            Show();
            ChartRedraw(0);
         }            
      }
		/*!	
			The number of items in the list.
			\return The number of elements (type int).
 		*/        
      int Count(){
         return(ArraySize(m_ItemText));
      }
		/*!	
			The index of a selected item.
			\return The index of the selected item (type int), if there are no selected items, -1 is returned.
 		*/         
      int SelectedIndex(){
         return(m_Selected);
      }
		/*!	
			Text of the selected item.
			\return Text of the selected item (type string), if there are no selected items,"" is returned.
 		*/       
      string SelectedText(){
         if(m_Selected<0)return("");
         return(m_ItemText[m_Selected]);
      }
		/*!	
			Getting the text of an item by its index.
         \param		int aIndex - the index of the item.					
			\return The text of the item (type string).
 		*/       
      string Text(int aIndex){
         return(m_ItemText[aIndex]);
      }
		/*!	
			Selecting an item.
         \param		int aIndex - the index of the item.					
 		*/        
      void SetSelectedIndex(int aIndex){
         if(aIndex>=-1 && aIndex<ArraySize(m_ItemText)){
            m_Selected=aIndex;
               if(m_Visible){
                  SelectedOFF();
                  SelectedON();
                  ChartRedraw();
               }
         }            
      }
		/*!	
			Setting the text of an item by its index.
         \param		int aIndex - item index,
         \param		int aText - item text,
 		*/        
      void SetText(int aIndex,string aText){
         m_ItemText[aIndex]=aText;
            if(m_Visible){
               if(aIndex>=m_sb.Value() && aIndex<m_sb.Value()+m_HeightInItems){
                  g.SetText(m_Name+"_IT("+IntegerToString(aIndex-m_sb.Value())+")",aText);
                  ChartRedraw();
               }
            }
      }
		/*!	
			Setting the width.
            \param		int aWidth - width.
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/  
      void SetWidth(int aValue){
         m_Width=aValue;
      }
		/*!	
			Setting height in points.
            \param		int aValue - height in points.
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/        
      void SetHeightInItems(int aValue){
         m_HeightInItems=aValue;
         m_Height=m_HeightInItems*14+1;
      }
		/*!	
			Getting width.
			\return  Value (type int).
 		*/  
      int Width(){
         return(m_Width);
      }  
		/*!	
			Getting height.
			\return  Value (type int).
 		*/   
      int Height(){
         return(m_Height);
      }
		/*!	
			Getting the X coordinate.
			\return  Value (type int).
 		*/      
      int Left(){
         return(m_Left);      
      }
		/*!	
			Getting the Y coordinate.
			\return  Value (type int).
 		*/  
      int Top(){
         return(m_Top);        
      }
		/*!	
			Event handling method.
			\remark  The method is called from the OnChartEvent() function, all parameters correspond to the parameters of the OnChartEvent() function.
			\return  0 or 1. 0 - no event. 1 – event of value change by user.
 		*/        
      int Event(const int id,const long& lparam,const double& dparam,const string& sparam){
         int m_event=0;
            if(m_sb.Event(id,lparam,dparam,sparam)==1){
               SelectedOFF();
               PutValues();
               SelectedON();
               ChartRedraw();
            }
            if(id==CHARTEVENT_OBJECT_CLICK){
               if(StringFind(sparam,m_Name+"_IT(",0)==0){
                  int m_Pos1=StringFind(sparam,"_IT(",0);
                  int m_Pos2=StringFind(sparam,")",m_Pos1);
                  int m_Index=m_sb.Value()+(int)StringToInteger(StringSubstr(sparam,m_Pos1+4,m_Pos2-m_Pos1-4));
                     if(m_Index<ArraySize(m_ItemText)){
                        if(m_Index==m_Selected){
                           if(m_AllowDeselect){
                              SetSelectedIndex(-1);
                              m_event=1;
                           }
                        }
                        else{
                           SetSelectedIndex(m_Index);
                           m_event=2;
                        }
                     }
               }
            }
         return(m_event);
      }
		/*!	
			Setting a subwindow by a number.
			\param int aNumber - subwindow number.
 		*/ 
      void SetSubWindow(int aNumber){
         int m_itmp=(int)MathMax(aNumber,0);
            if(m_itmp!=m_SubWindow){
               m_SubWindow=m_itmp;
               Refresh();
            }
      }   
		/*!	
			Setting a subwindow by the subwindow name.
			\param string aName - subwindow name.
 		*/          
      void SetSubWindow(string aName){
         SetSubWindow(ChartWindowFind(0,aName));
      }    
		/*!	
			Scroll through the list to the specified item.
			\param int aValue - the index of the item.
 		*/          
      void ScrollTo(int aValue){
         if(ArraySize(m_ItemText)>m_HeightInItems){
            aValue=(int)MathMin(ArraySize(m_ItemText)-m_HeightInItems,(int)MathMax(0,aValue));
            m_sb.SetValue(aValue);
               if(m_Visible){
                  SelectedOFF();
                  PutValues();
                  SelectedON();
                  ChartRedraw();
               }               
         }
      }
		/*!	
			Getting the index of the first visible item.
			\return The index of the item (type int).
 		*/         
      int FirstIndex(){
         return(m_sb.Value());
      }
		/*!	
			Clearing the list:
         \remark	   If a control is displayed, update using Refresh() is required.
 		*/     
      void Clear(){
         ArrayResize(m_ItemText,0);
         m_Selected=-1;
         m_LastSelected=-1;         
      }
		/*!	
			Setting a tag.
			\param string aValue - text.
 		*/         
      void SetTag(string aValue){ // Setting a tag
         m_sb.SetTag(aValue);
      }
		/*!	
			Getting a tag.
			\return A value (type string).
 		*/         
      string Tag(){ // Getting a tag
         return(m_sb.Tag());
      }         
};

//+------------------------------------------------------------------+
//|         Class CListMS                                            |
//+------------------------------------------------------------------+

/*!
   \brief   The List with Multiple Selection control.
   \details Several list items can be selected. Work in subwindows is supported. 
   \remark	One control consists of a few text fields (OBJ_EDIT)
            and a vertical scroll bar. To get the name of the scroll bar,
            "_SB" is added to aName, to get the names of text fields add "_IT" and
            the index of a text field in parentheses.
*/

class CListMS{
   protected:
      string m_Name;   
      int m_Left;
      int m_Top;
      int m_Width;
      int m_HeightInItems;      
      int m_Height;
      string m_ItemText[];
      bool m_Itemselected[];
      int m_SubWindow;
      CVScrollBar m_sb;
      bool m_Visible;
      color m_BgColor;
      color m_TxtColor;
      color m_SelColor;        
      bool m_SbVisible;
      int m_FieldsCount;
      int m_LastChanged;
      int m_SearchFrom;
      void Create(){
         int m_w=m_Width;
            if(ArraySize(m_ItemText)>m_HeightInItems){ // A scrollbar is required
               m_SbVisible=true; // Visibility of a scrollbar
               m_w-=m_sb.Width(); // Width of text fields
               m_sb.SetPos(m_Left+m_w,m_Top); // Setting a scrollbar position
               m_sb.SetHeight(m_Height);
               m_sb.SetMax(ArraySize(m_ItemText)-m_HeightInItems); // Setting the maximum value of a scrollbar
               m_sb.SetLageChange(m_HeightInItems); // Setting the large change of a scrollbar
               m_sb.SetSubWindow(m_SubWindow);
                  if(m_sb.Value()>ArraySize(m_ItemText)-m_HeightInItems){ // Correcting the current scrollbar location
                     m_sb.SetValue(ArraySize(m_ItemText)-m_HeightInItems); 
                  }
               m_w++; // Hide right edges of text filed borders behind the scrollbar
            }
            else{ // No scrollbar
               m_SbVisible=false; // Scrollbar is hidden
               m_sb.SetValue(0); // Setting the scrollbar value
            }
         int s=m_sb.Value(); // Show values starting from the scrollbar value
         int e=MathMin(s+m_HeightInItems,ArraySize(m_ItemText)); // Limit to display the values
         int i=0; // The index of a text field
         string m_ItemName;
            for(;s<e;s++,i++){ // Fields with values
               m_ItemName=m_Name+"_IT("+IntegerToString(i)+")";
               color m_Clr=m_BgColor;
               if(m_Itemselected[s])m_Clr=m_SelColor;
               w.Edit(m_ItemName,m_SubWindow,m_Left,m_Top+i*14,m_w,15,m_ItemText[s],m_Clr,m_TxtColor);
               g.SetReadOnly(m_ItemName,true);
            }  
            for(;i<m_HeightInItems;i++){ // Empty fields
               m_ItemName=m_Name+"_IT("+IntegerToString(i)+")";
               w.Edit(m_ItemName,m_SubWindow,m_Left,m_Top+i*14,m_w,15,"",m_BgColor,m_TxtColor);
               g.SetReadOnly(m_ItemName,true);
            }
         m_FieldsCount=m_HeightInItems;
      }

      void Delete(){
         for(int i=0;i<m_FieldsCount;i++){
            string m_ItemName=m_Name+"_IT("+IntegerToString(i)+")";
            ObjectDelete(0,m_ItemName);
         }  
      }
      void PutValues(){
         int s=m_sb.Value(); // Show values starting from the scrollbar value
         int e=MathMin(s+m_HeightInItems,ArraySize(m_ItemText)); // Limit to display the values
         int i=0; // The index of a text field
         string m_ItemName;
            for(;s<e;s++,i++){ // Fields with values
               m_ItemName=m_Name+"_IT("+IntegerToString(i)+")";
               g.SetText(m_ItemName,m_ItemText[s]);
               color m_Clr=m_BgColor;
               if(m_Itemselected[s])m_Clr=m_SelColor;   
               g.SetBgColor(m_ItemName,m_Clr);
            }  
            for(;i<m_HeightInItems;i++){ // Empty fields
               m_ItemName=m_Name+"_IT("+IntegerToString(i)+")";
               g.SetText(m_ItemName," ");
            }      
      }
   public:
		/*!	
			Control initialization.
            \param		string aName="CListMS" - name,
            \param		int aWidth=100 - width,
            \param		int aHeightInItems=8 - height in rows.
 		*/        
      void Init(string aName="CListMS",int aWidth=100,int aHeightInItems=8){
         m_Visible=false;
         m_Name=aName; 
         m_Width=aWidth;
         m_HeightInItems=aHeightInItems;         
         m_Left=0;
         m_Top=0;
         ArrayResize(m_ItemText,0);
         ArrayResize(m_Itemselected,0);
         //==========================
         m_BgColor=ClrScheme.Color(0);
         m_TxtColor=ClrScheme.Color(1);
         m_SelColor=ClrScheme.Color(14);   
         //==========================      
         m_Height=m_HeightInItems*14+1;
         m_sb.Init(aName+"_SB",m_Height,1);
         m_sb.SetMin(0);
         m_sb.SetValue(0);
         m_sb.SetSmallChange(1);
         m_sb.SetLageChange(aHeightInItems);
         m_SbVisible=false;
         m_LastChanged=-1;
         m_SearchFrom=0;
      }
		/*!	
			Adding an item to the list.
         \param		string aText - text.			
			\remark	   If a control is displayed, update using Refresh() is required.
 		*/        
      void AddItem(string aText){
         ArrayResize(m_ItemText,ArraySize(m_ItemText)+1);
         m_ItemText[ArraySize(m_ItemText)-1]=aText;
         ArrayResize(m_Itemselected,ArraySize(m_Itemselected)+1);
         m_Itemselected[ArraySize(m_Itemselected)-1]=false;         
      }
		/*!	
			Deleting an item from the list.
         \param		int aIndex - the index of an item to delete.			
			\remark	   If a control is displayed, update using Refresh() is required.
 		*/       
      void DeleteItem(int aIndex){
         if(aIndex<ArraySize(m_ItemText)){
               for(int i=aIndex;i<ArraySize(m_ItemText)-1;i++){
                  m_ItemText[i]=m_ItemText[i+1];
                  m_Itemselected[i]=m_Itemselected[i+1];
               }
            ArrayResize(m_ItemText,ArraySize(m_ItemText)-1);
            ArrayResize(m_Itemselected,ArraySize(m_Itemselected)-1);
         }            
      }
		/*!	
			Setting the X and Y coordinates.
            \param		int aLeft - the X coordinate (distance from the left chart border),
            \param		int aTop - the Y coordinate (distance from the upper chart border).
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/       
      void SetPos(int aLeft,int aTop){
         m_Left=aLeft;
         m_Top=aTop;
      }
		/*!	
			Setting the X coordinate.
            \param		int aLeft - the X coordinate (distance from the left chart border).
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/       
      void SetPosLeft(int aLeft){
         m_Left=aLeft;
      }   
		/*!	
			Setting the Y coordinate.
            \param		int aTop - the Y coordinate (distance from the upper chart border).
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/            
      void SetPosTop(int aTop){
         m_Top=aTop;
      }
		/*!	
			Enable visibility.
 		*/        
      void Show(){
         m_Visible=true;
         Create();
            if(m_SbVisible){
               m_sb.Show();
            }
            else{
               ChartRedraw(0);
            }               
      }
		/*!	
			Enable visibility at a given position.
         \param		int aLeft - the X coordinate (distance from the left chart border),
         \param		int aTop - the Y coordinate (distance from the upper chart border).			
 		*/        
      void Show(int aLeft,int aTop){
         SetPos(aLeft,aTop);
         Show();
      }
		/*!	
			Hiding a control (delete objects).
 		*/       
      void Hide(){
         m_Visible=false;
         Delete();
            if(m_SbVisible){
               m_sb.Hide();
               m_SbVisible=false;
            }
            else{
               ChartRedraw(0);
            }               
      }
		/*!	
			Visibility of a control element.
			\return Type bool. True/false - visible/hidden.
 		*/        
      bool Visible(){
         return(m_Visible);
      }  
		/*!	
			Update (hide and show with new parameters).
 		*/            
      void Refresh(){
         if(m_Visible){      
            Hide();
            Show();
            ChartRedraw(0);
         }            
      }
		/*!	
			The number of items in the list.
			\return The number of elements (type int).
 		*/        
      int Count(){
         return(ArraySize(m_ItemText));
      }
		/*!	
			Setting the width.
            \param		int aWidth - width.
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/  
      void SetWidth(int aValue){
         m_Width=aValue;
      }
		/*!	
			Setting height in points.
            \param		int aValue - height in points.
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/  
      void SetHeightInItems(int aValue){
         m_HeightInItems=aValue;
         m_Height=m_HeightInItems*14+1;
      }
		/*!	
			Getting width.
			\return  Value (type int).
 		*/  
      int Width(){
         return(m_Width);
      }   
		/*!	
			Getting height.
			\return  Value (type int).
 		*/ 
      int Height(){
         return(m_Height);
      }
		/*!	
			Getting the X coordinate.
			\return  Value (type int).
 		*/ 
      int Left(){
         return(m_Left);      
      }
		/*!	
			Getting the Y coordinate.
			\return  Value (type int).
 		*/ 
      int Top(){
         return(m_Top);        
      }
		/*!	
			Event handling method.
			\remark  The method is called from the OnChartEvent() function, all parameters correspond to the parameters of the OnChartEvent() function.
			\return  0 or 1. 0 - no event. 1 – event of value change by user.
 		*/   
      int Event(const int id,const long& lparam,const double& dparam,const string& sparam){
         int m_event=0;
            if(m_sb.Event(id,lparam,dparam,sparam)==1){
               PutValues();
               ChartRedraw();
            }
            if(id==CHARTEVENT_OBJECT_CLICK){
               if(StringFind(sparam,m_Name+"_IT(",0)==0){
                  int m_Pos1=StringFind(sparam,"_IT(",0);
                  int m_Pos2=StringFind(sparam,")",m_Pos1);
                  int m_Index=m_sb.Value()+(int)StringToInteger(StringSubstr(sparam,m_Pos1+4,m_Pos2-m_Pos1-4));
                  SetSelected(m_Index,!Selected(m_Index));
                     if(Selected(m_Index)){
                        m_event=2;
                     }
                     else{
                        m_event=1;                     
                     }
               }
            }
         return(m_event);
      }
		/*!	
			Setting a subwindow by a number.
			\param int aNumber - subwindow number.
 		*/       
      void SetSubWindow(int aNumber){
         int m_itmp=(int)MathMax(aNumber,0);
            if(m_itmp!=m_SubWindow){
               m_SubWindow=m_itmp;
               Refresh();
            }
      }   
		/*!	
			Setting a subwindow by the subwindow name.
			\param string aName - subwindow name.
 		*/             
      void SetSubWindow(string aName){
         SetSubWindow(ChartWindowFind(0,aName));
      }    
		/*!	
			Scroll through the list to the specified item.
			\param int aValue - the index of the item.
 		*/         
      void ScrollTo(int aValue){
         if(ArraySize(m_ItemText)>m_HeightInItems){
            aValue=(int)MathMin(ArraySize(m_ItemText)-m_HeightInItems,(int)MathMax(0,aValue));
            m_sb.SetValue(aValue);
               if(m_Visible){
                  PutValues();
                  ChartRedraw();
               }               
         }
      }
		/*!	
			Getting the index of the first visible item.
			\return The index of the item (type int).
 		*/       
      int FirstIndex(){
         return(m_sb.Value());
      }
		/*!	
			Clearing the list:
         \remark	   If a control is displayed, update using Refresh() is required.
 		*/        
      void Clear(){
         ArrayResize(m_ItemText,0);
         ArrayResize(m_Itemselected,0);
      }
		/*!	
			Setting a tag.
			\param string aValue - text.
 		*/         
      void SetTag(string aValue){ // Setting a tag
         m_sb.SetTag(aValue);
      }
		/*!	
			Getting a tag.
			\return A value (type string).
 		*/   
      string Tag(){ // Getting a tag
         return(m_sb.Tag());
      }   
		/*!	
			Setting the text of an item by its index.
         \param		int aIndex - item index,
         \param		int aText - item text,
 		*/                
      void SetText(int aIndex,string aText){
         m_ItemText[aIndex]=aText;
            if(m_Visible){
               if(aIndex>=m_sb.Value() && aIndex<m_sb.Value()+m_HeightInItems){
                  g.SetText(m_Name+"_IT("+IntegerToString(aIndex-m_sb.Value())+")",aText);
                  ChartRedraw();
               }
            }
      }
		/*!	
			Getting the text of an item by its index.
         \param		int aIndex - the index of the item.					
			\return The text of the item (type string).
 		*/         
      string Text(int aIndex){
         return(m_ItemText[aIndex]);
      }
		/*!	
			Select an item by its index.
         \param		int aIndex - the index of the item.					
 		*/        
      void SetSelected(int aIndex,bool aSelected){
         m_Itemselected[aIndex]=aSelected;
         m_LastChanged=aIndex;
            if(m_Visible){
               if(aIndex>=m_sb.Value() && aIndex<m_sb.Value()+m_HeightInItems){
                  color m_Clr=m_BgColor;
                  if(aSelected)m_Clr=m_SelColor;               
                  g.SetBgColor(m_Name+"_IT("+IntegerToString(aIndex-m_sb.Value())+")",m_Clr);
                  ChartRedraw();
               }
            }
      }
		/*!	
			A selected point.
         \param		int aIndex - the index of the item.					
         \return Type bool. True/false - selected/not
 		*/         
      bool Selected(bool aIndex){
         return(m_Itemselected[aIndex]);
      }
		/*!	
			The index of the last item, which was selected or deselected.
         \return The index of the item (type int).
 		*/ 
      int LastChanged(){
         return(m_LastChanged);
      }
		/*!	
			The index of the first selected item.
         \return The index of the item (type int).
 		*/       
      int FirstSelected(){
         m_SearchFrom=0;
         return(NextSelected());
      }
		/*!	
			The index of the next selected item (that follows the item received through the last call of FirstSelected() or NextSelected()).
         \return The index of the item (type int).
 		*/       
      int NextSelected(){
            for(int i=m_SearchFrom;i<ArraySize(m_ItemText);i++){
               if(m_Itemselected[i]){
                  m_SearchFrom=i+1;
                  return(i);
               }
            }
         return(-1);
      }
      /*
         // Loop through all selected items
         int Selected=lstm.FirstSelected();
            while(Selected!=-1){
               //=======================================
               // Do something to a selected item
               Alert(Selected);
               // ======================================
               Selected=lstm.NextSelected();
            }      
      */     
};

//+------------------------------------------------------------------+
//|         Class CComBox                                            |
//+------------------------------------------------------------------+

/*!
   \brief   The Combobox control.
   \details Operation in subwindows supported. 
   \remark	One control consists of a List control,
            two text boxes OBJ_EDIT (one for the value, the other one is used as
            a button). The list name is obtained by adding to aName "_Lst",
            text field - "_E", button - "_B".
*/

class CComBox{
   protected:
      int m_Left;
      int m_Top;
      int m_Width;   
      bool m_Visible;
      string m_Value;
      int m_SubWindow;    
      int m_NpCnt;  
      bool m_ReadOnly;      
      string m_Name;
      string m_NameEdit;
      string m_NameButton;
      string m_NameList;
      string m_ExName[6];
      CList m_lst;
      color m_BgColor;
      color m_TxtColor;
      color m_ButTxtColor;
      color m_ButBgColor;
      color m_FlashColor;
      color m_WarningColor;
      bool m_Warning;
      string m_NameLbl;
      string m_Caption;
      color m_LblColor;
      void Flash(string aName,color aFlash,color aNormal){
         g.SetBgColor(aName,aFlash);
         g.Redraw();
         Sleep(100);
         g.SetBgColor(aName,aNormal);
         g.Redraw();      
      }     
      void Create(){
         color m_tcol=m_BgColor;
         if(m_Warning)m_tcol=m_WarningColor;
         w.Edit(m_NameEdit,m_SubWindow,m_Left,m_Top,m_Width-12,15,m_Value,m_tcol,m_TxtColor);
         g.Attach(m_NameEdit);
         g.SetReadOnly(m_ReadOnly);
         w.Edit(m_NameButton,m_SubWindow,m_Left+m_Width-13,m_Top,13,15," \/",m_ButBgColor,m_ButTxtColor,6);
         g.SetReadOnly(m_NameButton,true);
         m_lst.SetSubWindow(m_SubWindow);
         int m_center=(int)ChartGetInteger(0,CHART_HEIGHT_IN_PIXELS,m_SubWindow)/2;
            if(m_Top-7>m_center){
               m_lst.SetPos(m_Left,m_Top-m_lst.Height()+1); 
            }
            else{
                m_lst.SetPos(m_Left,m_Top+14);             
            }   
            if(m_Caption!=""){ // There is a caption
               w.Label(m_NameLbl,m_SubWindow,m_Left+m_Width+1,m_Top+2,m_Caption,m_LblColor,7,"Arial"); // Create a label
            }
      }    
      void Delete(){
         ObjectDelete(0,m_NameEdit);
         ObjectDelete(0,m_NameButton);
         ObjectDelete(0,m_NameLbl);         
      }
   public:
		/*!	
			Control initialization.
            \param		string aName="CComBox" - name,
            \param		int aWidth=100 - width,
            \param		string aCaption="CComBox" - text.
 		*/      
      void Init(string aName="CComBox",int aWidth=100,string aCaption="CComBox"){
         m_Visible=false;
         m_Width=aWidth;
         m_Name=aName;
         m_ReadOnly=true;
         m_SubWindow=0;
         m_NpCnt=0;     
         m_Warning=false;    
         m_NameEdit=m_Name+"_E";
         m_NameButton=m_Name+"_B";
         m_NameList=aName+"_Lst";   
         m_NameLbl=aName+"_L";  
         m_ExName[0]=m_Name+"_Lst_SB_LB";
         m_ExName[1]=m_Name+"_Lst_SB_UB";
         m_ExName[2]=m_Name+"_Lst_SB_S";
         m_ExName[3]=m_Name+"_Lst_SB_LF";
         m_ExName[4]=m_Name+"_Lst_SB_UF";
         m_ExName[5]=m_Name+"_B";
         m_Caption=aCaption;
         m_lst.Init(m_NameList,aWidth,1);
         m_lst.SetAllowDeselect(false);
         m_BgColor=ClrScheme.Color(0);       // Like for the input field
         m_TxtColor=ClrScheme.Color(1);      // Like for the input field
         m_ButTxtColor=ClrScheme.Color(1);   // Color of button labels, should match the color of text box borders
         m_ButBgColor=ClrScheme.Color(4);    // Color buttons like for the spin box
         m_FlashColor=ClrScheme.Color(5);    // Color of shimmering like for the spin box
         m_WarningColor=ClrScheme.Color(3);  // Warning color
         m_LblColor=ClrScheme.Color(2);      // Label color
      }
		/*!	
			Clearing the list:
         \remark	   If a control is displayed, update using Refresh() is required.
 		*/         
      void Clear(){
         m_lst.Clear();
         m_lst.SetHeightInItems(1); 
         m_Value="";
      }   
		/*!	
			Adding an item to the list.
         \param		string aText - text.			
			\remark	   If a control is displayed, update using Refresh() is required.
 		*/            
      void AddItem(string aItem){
         m_lst.AddItem(aItem);
         m_lst.SetHeightInItems((int)MathMin(8,m_lst.Count()));           
      }
		/*!	
			Deleting an item from the list.
         \param		int aIndex - the index of an item to delete.			
			\remark	   If a control is displayed, update using Refresh() is required.
 		*/       
      void DeleteItem(int aIndex){
         m_lst.DeleteItem(aIndex);
         m_lst.SetHeightInItems((int)MathMin(8,m_lst.Count()));           
      }   
		/*!	
			The number of items in the list.
			\return The number of elements (type int).
 		*/        
      int Count(){
         return(m_lst.Count());
      }
		/*!	
			Selecting an item.
         \param		int aIndex - the index of the item.					
 		*/         
      void SetSelectedIndex(int aIndex){
         m_lst.SetSelectedIndex(aIndex);
         m_lst.ScrollTo(aIndex);
         m_Value=m_lst.SelectedText();
            if(m_Visible){
               g.SetText(m_NameEdit,m_Value);
               g.Redraw();
            }
      }
		/*!	
			Setting a value.
         \param		string aValue - text.					
 		*/       
      void SetValue(string aValue){
            for(int i=0;i<m_lst.Count();i++){
               if(aValue==m_lst.Text(i)){
                  SetSelectedIndex(i);
                  return;
               }
            }
         m_lst.SetSelectedIndex(-1);
         m_lst.ScrollTo(0);
         m_Value=aValue;
            if(m_Visible){
               g.SetText(m_NameEdit,m_Value);
               g.Redraw();            
            }
      }
		/*!	
			Setting the text of an item by its index.
         \param		int aIndex - item index,
         \param		int aText - item text,
 		*/       
      void SetText(int aIndex,string aText){
         m_lst.SetText(aIndex,aText);
            if(aIndex==m_lst.SelectedIndex()){
               m_Value=aText;
                  if(m_Visible){
                     g.SetText(m_NameEdit,m_Value);
                     g.Redraw();            
                  }
            }
      }
		/*!	
			Enable visibility.
 		*/        
      void Show(){
         m_Visible=true;
         Create();
         ChartRedraw();
      }  
		/*!	
			Visibility of a control element.
			\return Type bool. True/false - visible/hidden.
 		*/        
      bool Visible(){
         return(m_Visible);
      }
		/*!	
			Setting the X and Y coordinates.
            \param		int aLeft - the X coordinate (distance from the left chart border),
            \param		int aTop - the Y coordinate (distance from the upper chart border).
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/       
      void SetPos(int aLeft,int aTop){
         m_Left=aLeft;
         m_Top=aTop;
      }
		/*!	
			Setting the X coordinate.
            \param		int aLeft - the X coordinate (distance from the left chart border).
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/        
      void SetPosLeft(int aLeft){
         m_Left=aLeft;
      }      
		/*!	
			Setting the Y coordinate.
            \param		int aTop - the Y coordinate (distance from the upper chart border).
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/        
      void SetPosTop(int aTop){
         m_Top=aTop;
      }   
		/*!	
			Enable visibility at a given position.
         \param		int aLeft - the X coordinate (distance from the left chart border),
         \param		int aTop - the Y coordinate (distance from the upper chart border).			
 		*/        
      void Show(int aLeft,int aTop){
         m_Left=aLeft;
         m_Top=aTop;
         Show();
      }   
		/*!	
			Hiding a control (delete objects).
 		*/          
      void Hide(){
         m_Visible=false;
         Delete();
            if(m_lst.Visible()){
               m_lst.Hide();
            }
            else{               
               ChartRedraw(); 
            }               
      }
		/*!	
			Update (hide and show with new parameters).
 		*/         
      void Refresh(){
         Delete();
         Create();
         m_lst.Hide();
         ChartRedraw();         
      }
		/*!	
			Setting the read-only property.
			\param int aValue - true/false - read-only/editable.
 		*/        
      void SetReadOnly(bool aValue){
         m_ReadOnly=aValue;
            if(m_Visible){
               g.Attach(m_NameEdit);
               g.SetReadOnly(m_ReadOnly);
               g.Redraw();
            }
      }
		/*!	
			Getting the read-only property.
			\return Type bool. True/false - read-only/editable.
 		*/        
      bool ReadOnly(){
         return(m_ReadOnly);
      }
		/*!	
			The index of a selected item.
			\return The index of the selected item (type int), if there are no selected items, -1 is returned.
 		*/        
      int SelectedIndex(){
         return(m_lst.SelectedIndex());
      }
		/*!	
			Text of the selected item.
			\return Text of the selected item (type string), if there are no selected items,"" is returned.
 		*/        
      string SelectedText(){
         return(m_lst.SelectedText());
      }  
		/*!	
			A value from the text field.
			\return Text (type string).
 		*/         
      string Value(){
         return(m_Value);
      } 
		/*!	
			Getting width.
			\return  Value (type int).
			\remark  Label width is not considered.
 		*/        
      int Width(){
         return(m_Width);
      }  
		/*!	
			Getting height.
			\return  Value (type int).
 		*/          
      int Height(){
         return(15);
      }
		/*!	
			Getting the X coordinate.
			\return  Value (type int).
 		*/       
      int Left(){
         return(m_Left);      
      }
		/*!	
			Getting the Y coordinate.
			\return  Value (type int).
 		*/       
      int Top(){
         return(m_Top);        
      }
		/*!	
			Event handling method.
			\remark  The method is called from the OnChartEvent() function, all parameters correspond to the parameters of the OnChartEvent() function.
			\return  0 or 1. 0 - no event. 1 – event of value change by user.
 		*/       
      int Event(const int id,const long& lparam,const double& dparam,const string& sparam){
         int m_event=0;
            if(sparam==""){
               m_NpCnt++;
                  if(m_NpCnt>1){
                     m_lst.Hide();
                  }
            }
            else{
               m_NpCnt=0;
                  if(m_lst.Event(id,lparam,dparam,sparam)==2){
                     g.Attach(m_NameEdit);
                        if(m_lst.SelectedText()!=g.Text()){
                           m_event=1;
                           g.SetText(m_lst.SelectedText());
                           m_Value=g.Text();
                           g.Redraw();
                           
                           Sleep(100);
                        }
                  }
                  if(id==CHARTEVENT_OBJECT_ENDEDIT){
                     if(sparam==m_NameEdit){
                        g.Attach(m_NameEdit);
                           if(m_Value!=g.Text()){
                              m_event=1;
                              m_Value=g.Text();
                              m_lst.SetSelectedIndex(-1);
                                 for(int i=0;i<m_lst.Count();i++){
                                    if(m_Value==m_lst.Text(i)){
                                       m_lst.SetSelectedIndex(i);
                                       m_lst.ScrollTo(i);
                                       break;
                                    }
                                 }
                              
                           }
                     }                        
                  }
                  if(id==CHARTEVENT_OBJECT_CLICK){
                     if(sparam==m_NameButton){
                        Flash(m_NameButton,m_FlashColor,m_ButBgColor);
                           if(m_lst.Visible()){
                              m_lst.Hide();
                           }
                           else{
                              m_lst.Show();
                           }
                     }

                  } 
                  if(
                     !(sparam==m_ExName[0] ||
                     sparam==m_ExName[1] ||
                     sparam==m_ExName[2] ||
                     sparam==m_ExName[3] ||
                     sparam==m_ExName[4] ||
                     sparam==m_ExName[5])
                  ){
                     if(m_lst.Visible()){
                        m_lst.Hide();
                     }           
                  }                                            
            
            }
          return(m_event);
      } 
		/*!	
			Setting a subwindow by a number.
			\param int aNumber - subwindow number.
 		*/       
      void SetSubWindow(int aNumber){
         int m_itmp=(int)MathMax(aNumber,0);
            if(m_itmp!=m_SubWindow){
               m_SubWindow=m_itmp;
               Refresh();
            }
      }    
		/*!	
			Setting a subwindow by the subwindow name.
			\param string aName - subwindow name.
 		*/              
      void SetSubWindow(string aName){
         SetSubWindow(ChartWindowFind(0,aName));
      } 
		/*!	
			Setting a tag.
			\param string aValue - text.
 		*/       
      void SetTag(string aValue){
         m_lst.SetTag(aValue);
      }
		/*!	
			Getting a tag.
			\return A value (type string).
 		*/       
      string Tag(){ 
         return(m_lst.Tag());
      }   
		/*!	
			Enable/disable the warning color.
			\param bool aValue - true/false (warning/normal). 
 		*/        
      void SetWarning(bool aValue){
            if(m_Visible){
               if(aValue){
                  if(!m_Warning){
                     g.Attach(m_NameEdit);
                     g.SetBgColor(m_WarningColor); 
                  }
               }
               else{
                  if(m_Warning){
                     g.Attach(m_NameEdit);
                     g.SetBgColor(m_BgColor);
                  }
               }
            }
         m_Warning=aValue;
      }
		/*!	
			Getting the warning mode.
			\return Type bool. True/false - warning/normal.
 		*/        
      bool Warning(){
         return(m_Warning);
      }                     
};

//+------------------------------------------------------------------+
//|         Class CHMenu                                             |
//+------------------------------------------------------------------+

/*!
   \brief   Graphic control element Horizontal Menu.
   \details Operation in subwindows supported. 
   \remark	The control consists of the following objects 
            "edit box" (OBJ_EDIT), four fields are used as buttons:
            scroll to start, scroll on one "screen" to the left, scroll 
            one "screen" to the right, scroll to the end. Other fields are used
            for the menu items. The following prefixes are added to aName to get button names:
            "_LBB", "_LBS", "_RBS", "_RBB", for item names - "_IC" and index
            of an item in parentheses.
*/

class CHMenu{
   private:
      bool m_Visible;
      string m_Name;
      int m_Left;
      int m_Top;
      int m_Width;
      int m_VisItems;
      int m_DefVisItems;
      int m_Start;
      string m_Items[];
      bool m_Checked[];
      int m_SubWindow;
      string m_NameLBB;
      string m_NameLBS;      
      string m_NameRBB;
      string m_NameRBS;    
      string m_Tag;   
      color m_BgColorOn;
      color m_BgColorOf;
      color m_BgColor;
      color m_TxtColor;
      color m_ButTxtColor;
      color m_ButBgColor;
      color m_ButFlashColor;
      color m_ItemFlashColor;
      color m_WarningColor;
      color m_CheckColor;
      int m_CheckCnt;
      int m_LastClickedX;
      int m_LastClickedY;
      int m_LastClickedQuarter;   
      int m_LastClickedW;   
      void ScrollTo(){
         if(m_Visible){
            if(ArraySize(m_Items)>0){
               string m_stri;
                  for(int i=0;i<m_VisItems;i++){
                     m_stri=IntegerToString(i);
                     g.Attach(m_Name+"_IT("+m_stri+")");
                     int j=i+m_Start;
                        if(j<ArraySize(m_Items)){
                           g.SetText("    "+m_Items[j]);
                        }
                        else{
                           g.SetText("");
                        }
                     g.Attach(m_Name+"_IC("+m_stri+")");                     
                        if(m_Checked[j]){
                           g.SetText(CharToString(252));
                        }
                        else{
                           g.SetText(" ");
                        }
                  }
            }               
         }
      }
      void Delete(){
         string m_stri;
            for(int i=0;i<m_VisItems;i++){
               m_stri=IntegerToString(i);
               ObjectDelete(0,m_Name+"_IT("+m_stri+")");
               ObjectDelete(0,m_Name+"_IC("+m_stri+")");
            }
         ObjectDelete(0,m_NameLBB);
         ObjectDelete(0,m_NameLBS);
         ObjectDelete(0,m_NameRBS);
         ObjectDelete(0,m_NameRBB);
      }   
      void DefineBgColor(){
         if(m_CheckCnt>0){
            m_BgColor=m_BgColorOn;
            m_ItemFlashColor=m_BgColorOf;
         }
         else{
            m_BgColor=m_BgColorOf;            
            m_ItemFlashColor=m_BgColorOn;
         }        
      }
      void SetBgColor(){
         DefineBgColor();
            for(int i=0;i<m_VisItems;i++){
               string m_stri=IntegerToString(i);
               g.SetBgColor(m_Name+"_IT("+m_stri+")",m_BgColor);
            }
      }      
      void Create(){
         DefineBgColor();
         w.Edit(m_NameLBB,m_SubWindow,m_Left,m_Top,9,15,"I",m_ButBgColor,m_ButTxtColor,7,"Arial");
         g.SetReadOnly(m_NameLBB,true);
         w.Edit(m_NameLBS,m_SubWindow,m_Left+8,m_Top,11,15,"<",m_ButBgColor,m_ButTxtColor,7,"Arial");
         g.SetReadOnly(m_NameLBS,true);
         w.Edit(m_NameRBS,m_SubWindow,m_Left+m_Width-19,m_Top,11,15,">",m_ButBgColor,m_ButTxtColor,7,"Arial");
         g.SetReadOnly(m_NameRBS,true);
         w.Edit(m_NameRBB,m_SubWindow,m_Left+m_Width-9,m_Top,9,15,"I",m_ButBgColor,m_ButTxtColor,7,"Arial");
         g.SetReadOnly(m_NameRBB,true);
         int m_tw=(m_Width-40)/m_VisItems;   
         string m_stri;      
         int m_z3=0;
            for(int i=0;i<m_VisItems;i++){
               int m_z1=i*(m_Width-40+2)/m_VisItems;
               int m_z2=(i+1)*(m_Width-40+2)/m_VisItems;
               m_stri=IntegerToString(i);
               m_z3=m_Left+18+m_z1;
               w.Edit(m_Name+"_IT("+m_stri+")",m_SubWindow,m_z3,m_Top,(m_z2-m_z1+1),15,"",m_BgColor,m_TxtColor);
               g.SetReadOnly(m_Name+"_IT("+m_stri+")",true);
               w.Label(m_Name+"_IC("+m_stri+")",m_SubWindow,m_Left+18+m_z1+3,m_Top+2," ",m_CheckColor,9,"Wingdings"); 
            }
            if(m_VisItems>0){
               m_stri=IntegerToString(m_VisItems-1);
               g.Attach(m_Name+"_IT("+m_stri+")");
               g.SetXSize(m_Left+m_Width-18-m_z3);
            }
      }   
      void Flash(string aName,color aFlash,color aNormal){
         g.SetBgColor(aName,aFlash);
         g.Redraw();
         Sleep(100);
         g.SetBgColor(aName,aNormal);
         g.Redraw();      
      }        
   public:
		/*!	
			Control initialization.
            \param		string aName="CHMenu" - name,
            \param		int aWidth=100 - width,
            \param		int aVisibleItems=3 - number of visible items.
 		*/     
      void Init(string aName="CHMenu",int aWidth=300,int aVisibleItems=3){
         m_BgColorOn=ClrScheme.Color(15);
         m_BgColorOf=ClrScheme.Color(16);
         m_TxtColor=ClrScheme.Color(1);
         m_ButTxtColor=ClrScheme.Color(1);
         m_ButBgColor=ClrScheme.Color(4);
         m_ButFlashColor=ClrScheme.Color(5);
         m_WarningColor=ClrScheme.Color(3); 
         m_CheckColor=ClrScheme.Color(17);
         m_BgColor=m_BgColorOf;
         m_ItemFlashColor=m_BgColorOn;
         m_SubWindow=0;
         m_Visible=false;
         m_Name=aName;
         m_NameLBB=m_Name+"_LBB";
         m_NameLBS=m_Name+"_LBS";      
         m_NameRBB=m_Name+"_RBB";
         m_NameRBS=m_Name+"_RBS";              
         m_Width=aWidth;
         m_VisItems=aVisibleItems;
         m_DefVisItems=aVisibleItems;
         m_Start=0;
         ArrayResize(m_Items,0);
         ArrayResize(m_Checked,0);
         m_Tag="";
         m_CheckCnt=0;
         m_LastClickedX=-1;
         m_LastClickedY=-1;
         m_LastClickedQuarter=-1;
         m_LastClickedW=-1;
      }
		/*!	
			Adding an item to the list.
         \param		string aText - text.			
			\remark	   If a control is displayed, update using Refresh() is required.
 		*/      
      void AddItem(string aItem,bool aChecked=false){
         ArrayResize(m_Items,ArraySize(m_Items)+1);
         m_Items[ArraySize(m_Items)-1]=aItem;
         m_VisItems=MathMin(m_DefVisItems,ArraySize(m_Items));
         ArrayResize(m_Checked,ArraySize(m_Checked)+1);
         m_Checked[ArraySize(m_Checked)-1]=aChecked;  
         if(aChecked)m_CheckCnt++;       
      }
		/*!	
			Enable visibility at a given position.
         \param		int aLeft - the X coordinate (distance from the left chart border),
         \param		int aTop - the Y coordinate (distance from the upper chart border).			
 		*/  
      void Show(int aLeft,int aTop){
         m_Left=aLeft;
         m_Top=aTop;
         Show();
      }
		/*!	
			Enable visibility.
 		*/       
      void Show(){
         m_Visible=true;
         Create();
         ScrollTo();
         ChartRedraw();
      }
		/*!	
			Hiding a control (delete objects).
 		*/         
      void Hide(){
         m_Visible=false;
         Delete();
         ChartRedraw();
      }
		/*!	
			Update (hide and show with new parameters).
 		*/  
      void Refresh(){
         if(m_Visible){
            Delete();
            Show();
         }            
      }   
		/*!	
			Visibility of a control element.
			\return Type bool. True/false - visible/hidden.
 		*/       
      bool Visible(){
         return(m_Visible);
      }
		/*!	
			Setting a selected item.
         \param		int aIndex - item index,
         \param		bool aValue - true/false, a selected item is marked by a check mark,
 		*/  
      void SetChecked(int aIndex,bool aValue){
            if(m_Checked[aIndex] && !aValue){
               m_CheckCnt--; 
            }
            if(!m_Checked[aIndex] && aValue){
               m_CheckCnt++; 
            }            
         m_Checked[aIndex]=aValue;
            if(m_Visible){
               SetBgColor();
               int m_n=aIndex-m_Start;
                  if(m_n>=0 && m_n<m_VisItems){
                     g.Attach(m_Name+"_IC("+IntegerToString(m_n)+")");
                        if(aValue){
                           g.SetText(CharToString(252));   
                        }
                        else{
                           g.SetText(" ");   
                        }
                  }
               ChartRedraw();                  
            }
      }
		/*!	
			Check if an item is selected.
         \param		int aIndex - the index of the item.	
         \return  Type bool. True/false - selected/not.				
 		*/        
      bool Checked(int aIndex){
         return(m_Checked[aIndex]);
      }  
		/*!	
			Check whether selected items exist.
         \return  Type bool. True/false - there is a selected item/no.				
 		*/        
      bool CheckedExist(){
         return(m_CheckCnt>0);
      }
		/*!	
			Getting the text of an item by its index.
         \param		int aIndex - the index of the item.					
			\return The text of the item (type string).
 		*/   
      string Text(int aIndex){
         return(m_Items[aIndex]);
      }  
		/*!	
			Setting the X and Y coordinates.
            \param		int aLeft - the X coordinate (distance from the left chart border),
            \param		int aTop - the Y coordinate (distance from the upper chart border).
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/ 
      void SetPos(int aLeft,int aTop){
         m_Left=aLeft;
         m_Top=aTop;
      }
		/*!	
			Setting the X coordinate.
            \param		int aLeft - the X coordinate (distance from the left chart border).
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/  
      void SetPosLeft(int aLeft){
         m_Left=aLeft;
      }  
		/*!	
			Setting the Y coordinate.
            \param		int aTop - the Y coordinate (distance from the upper chart border).
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/    
      void SetPosTop(int aTop){
         m_Top=aTop;
      }   
		/*!	
			Getting width.
			\return  Value (type int).
 		*/    
      int Width(){
         return(m_Width);
      }  
		/*!	
			Getting height.
			\return  Value (type int).
 		*/  
      int Height(){
         return(15);
      }
		/*!	
			Getting the X coordinate.
			\return  Value (type int).
 		*/ 
      int Left(){
         return(m_Left);      
      }
		/*!	
			Getting the Y coordinate.
			\return  Value (type int).
 		*/ 
      int Top(){
         return(m_Top);        
      }
		/*!	
			Event handling method.
			\remark  The method is called from the OnChartEvent() function, all parameters correspond to the parameters of the OnChartEvent() function.
			\return  0 or 1. 0 - no event. 1 – an event of a click on an item.
 		*/         
      int Event(const int id,const long& lparam,const double& dparam,const string& sparam){
         int m_rv=-1;
            if(id==CHARTEVENT_OBJECT_CLICK){
               if(sparam==m_NameLBB){
                  if(m_Start>0){
                     Flash(m_NameLBB,m_ButFlashColor,m_ButBgColor);
                     m_Start=0;
                     ScrollTo();
                     ChartRedraw();
                  }
                  else{
                     Flash(m_NameLBB,m_WarningColor,m_ButBgColor);
                  }
               }
               if(sparam==m_NameLBS){
                  if(m_Start>0){
                     Flash(m_NameLBS,m_ButFlashColor,m_ButBgColor);                
                     m_Start-=m_VisItems;
                     if(m_Start<0)m_Start=0;
                     ScrollTo();
                     ChartRedraw();
                  }
                  else{
                     Flash(m_NameLBS,m_WarningColor,m_ButBgColor);
                  }                  
               }               
               
               if(sparam==m_NameRBB){
                  if(m_Start<ArraySize(m_Items)-m_VisItems){
                     Flash(m_NameRBB,m_ButFlashColor,m_ButBgColor);                 
                     m_Start=ArraySize(m_Items)-m_VisItems;
                     ScrollTo();
                     ChartRedraw();
                  }
                  else{
                     Flash(m_NameRBB,m_WarningColor,m_ButBgColor);
                  }                  
               }

               if(sparam==m_NameRBS){
                  if(m_Start<ArraySize(m_Items)-m_VisItems){
                     Flash(m_NameRBS,m_ButFlashColor,m_ButBgColor);              
                     m_Start+=m_VisItems;
                     m_Start=MathMin(m_Start,ArraySize(m_Items)-m_VisItems);
                     ScrollTo();
                     ChartRedraw();
                  }
                  else{
                     Flash(m_NameRBS,m_WarningColor,m_ButBgColor);
                  }                  
               }               
               if(StringFind(sparam,m_Name+"_I",0)==0){
                  g.Attach(sparam);
                  m_LastClickedX=g.XDistance();
                  m_LastClickedY=g.YDistance();
                  m_LastClickedW=g.XSize();
                  int m_ocx=g.XDistance()+g.XSize()/2;
                  int m_ocy=g.YDistance()+g.YSize()/2;
                  int m_ccx=(int)ChartGetInteger(0,CHART_WIDTH_IN_PIXELS,m_SubWindow)/2;
                  int m_ccy=(int)ChartGetInteger(0,CHART_HEIGHT_IN_PIXELS,m_SubWindow)/2;
                     if(m_ocy<m_ccy){
                        if(m_ocx<m_ccx){
                           m_LastClickedQuarter=1;
                        }
                        else{
                           m_LastClickedQuarter=2;
                        }
                     }
                     else{
                        if(m_ocx<m_ccx){
                           m_LastClickedQuarter=3;
                        }
                        else{
                           m_LastClickedQuarter=4;                        
                        }                     
                     }
                  Flash(sparam,m_ItemFlashColor,m_BgColor);
                  int m_pos=StringFind(sparam,"(",0);
                  int m_index=m_Start+(int)StringToInteger(StringSubstr(sparam,m_pos+1,StringLen(sparam)-m_pos-2));
                  return(m_index);
               }
            }
         return(m_rv);
      }
		/*!	
			Setting a subwindow by a number.
			\param int aNumber - subwindow number.
 		*/       
      void SetSubWindow(int aNumber){
         int m_itmp=(int)MathMax(aNumber,0);
            if(m_itmp!=m_SubWindow){
               m_SubWindow=m_itmp;
               Refresh();
            }
      }      
		/*!	
			Setting a subwindow by the subwindow name.
			\param string aName - subwindow name.
 		*/   
      void SetSubWindow(string aName){
         SetSubWindow(ChartWindowFind(0,aName));
      } 
		/*!	
			Setting a tag.
			\param string aValue - text.
 		*/          
      void SetTag(string aValue){
         m_Tag=aValue;
      }
		/*!	
			Getting a tag.
			\return A value (type string).
 		*/       
      string Tag(){ 
         return(m_Tag);
      }  
		/*!	
			The X coordinate of the point at which the last event occurred.
			\return Value (type int).
 		*/  
      int LastClickedX(){
         return(m_LastClickedX);
      }  
		/*!	
			The Y coordinate of the point at which the last event occurred.
			\return Value (type int).
 		*/           
      int LastClickedY(){
         return(m_LastClickedY);
      }
		/*!	
			One fourth of the chart in which there is a point at which the last event occurred.
			\return Value (type int). 1 - upper left, 2 - upper right, 3 - lower left, 4 - lower right.
 		*/        
      int LastClickedQuarter(){
         return(m_LastClickedQuarter);
      }     
		/*!	
			The width of the point on which the last event occurred.
			\return Value (type int).
 		*/        
      int LastClickedW(){
         return(m_LastClickedW);
      }            
};

//+------------------------------------------------------------------+
//|         Class CVMenu                                             |
//+------------------------------------------------------------------+

/*!
   \brief   Graphic control element Vertical Menu.
   \details Operation in subwindows supported. 
   \remark	The control consists of the following objects 
            "edit box" (OBJ_EDIT), and one control "vertical 
            scrollbar". To get the name of the scroll bar,
            "_SB" is added to aName, for text fields "_IT" is added and item index 
            in parentheses.
*/

class CVMenu{
   protected:
      string m_ItemText[];
      bool m_Checked[];
      string m_Name;
      int m_Left;
      int m_Top;
      int m_Width;
      int m_HeightInItems;
      int m_DefHeightInItems;
      int m_Start;
      CVScrollBar m_sb;
      bool m_Visible;
      color m_BgColorOn;
      color m_BgColorOf;
      color m_BgColor;
      color m_TxtColor;
      color m_ButTxtColor;
      color m_ButBgColor;
      color m_ButFlashColor;
      color m_ItemFlashColor;
      color m_WarningColor;
      color m_CheckColor;
      int m_SubWindow;
      int m_CheckCnt;
      string m_Tag;
      int m_LastClickedX;
      int m_LastClickedY;
      int m_LastClickedQuarter;         
      void ScrollTo(){
         for(int i=0;i<m_HeightInItems;i++){
            int j=m_Start+i;
               if(j<ArraySize(m_ItemText)){
                  g.Attach(m_Name+"_IT("+IntegerToString(i)+")");
                  g.SetText("    "+m_ItemText[j]);
                  string m_chtxt=" ";
                     if(m_Checked[j]){                     
                        m_chtxt=CharToString(252);
                     }
                  g.Attach(m_Name+"_IC("+IntegerToString(i)+")");
                  g.SetText(m_chtxt);
               }
               else{
                  g.Attach(m_Name+"_IT("+IntegerToString(i)+")");
                  g.SetText(" ");
                  g.Attach(m_Name+"_IC("+IntegerToString(i)+")");
                  g.SetText(" ");                  
               }
         }
      }   
      void DefineBgColor(){
         if(m_CheckCnt>0){
            m_BgColor=m_BgColorOn;
            m_ItemFlashColor=m_BgColorOf;
         }
         else{
            m_BgColor=m_BgColorOf;            
            m_ItemFlashColor=m_BgColorOn;
         }        
      }
      void SetBgColor(){
         DefineBgColor();
            for(int i=0;i<m_HeightInItems;i++){
               string m_stri=IntegerToString(i);
               g.SetBgColor(m_Name+"_IT("+m_stri+")",m_BgColor);
            }
      }      
      void Create(){
         DefineBgColor();
         int m_w=m_Width;
            if(ArraySize(m_ItemText)>m_HeightInItems){
               m_w=m_Width-m_sb.Width();
               m_sb.Show(m_Left+m_w,m_Top);
               m_w++;
            }      
            for(int i=0;i<m_HeightInItems;i++){
               w.Edit(m_Name+"_IT("+IntegerToString(i)+")",m_SubWindow,m_Left,m_Top+i*14,m_w,15," ",m_BgColor,m_TxtColor,7,"Arial");
               g.SetReadOnly(m_Name+"_IT("+IntegerToString(i)+")",true);
               w.Label(m_Name+"_IC("+IntegerToString(i)+")",m_SubWindow,m_Left+3,m_Top+i*14+2," ",m_CheckColor,9,"Wingdings");                     
            }
         m_sb.SetSubWindow(m_SubWindow);            
      }
      void Delete(){
         for(int i=0;i<m_HeightInItems;i++){
            ObjectDelete(0,m_Name+"_IT("+IntegerToString(i)+")");
            ObjectDelete(0,m_Name+"_IC("+IntegerToString(i)+")");               
         }
      }
      void Flash(string aName,color aFlash,color aNormal){
         g.SetBgColor(aName,aFlash);
         g.Redraw();
         Sleep(100);
         g.SetBgColor(aName,aNormal);
         g.Redraw();      
      }         
   public:
		/*!	
			Control initialization.
            \param		string aName="CVMenu" - name,
            \param		int aWidth=100 - width,
            \param		int aVisibleItems=10 - the number of visible items.
 		*/      
      void Init(string aName="CVMenu",int aWidth=100,int aVisibleItems=10){
         m_BgColorOn=ClrScheme.Color(15);
         m_BgColorOf=ClrScheme.Color(16);
         m_TxtColor=ClrScheme.Color(1);
         m_ButTxtColor=ClrScheme.Color(1);
         m_ButBgColor=ClrScheme.Color(4);
         m_ButFlashColor=ClrScheme.Color(5);
         m_WarningColor=ClrScheme.Color(3); 
         m_CheckColor=ClrScheme.Color(17);
         m_SubWindow=0;
         m_CheckCnt=0;
         m_Visible=false;
         m_Name=aName;
         m_Width=aWidth;
         m_HeightInItems=aVisibleItems;
         m_DefHeightInItems=aVisibleItems;
         m_Left=0;
         m_Top=0;
         m_Start=0;
         ArrayResize(m_ItemText,0);
         ArrayResize(m_Checked,0);
         m_sb.Init(aName+"_SB",aVisibleItems*14+1,1);
         m_sb.SetMin(0);
         m_sb.SetValue(0);
         m_sb.SetSmallChange(1);
         m_sb.SetLageChange(aVisibleItems);
         m_Tag="";
         m_LastClickedX=-1;
         m_LastClickedY=-1;
         m_LastClickedQuarter=-1;         
      }
		/*!	
			Adding an item to the list.
         \param		string aText - text.			
			\remark	   If a control is displayed, update using Refresh() is required.
 		*/          
      void AddItem(string aText,bool aChecked=false){
         ArrayResize(m_ItemText,ArraySize(m_ItemText)+1);
         m_ItemText[ArraySize(m_ItemText)-1]=aText;
         ArrayResize(m_Checked,ArraySize(m_Checked)+1);
         m_Checked[ArraySize(m_Checked)-1]=aChecked;
         m_HeightInItems=MathMin(m_DefHeightInItems,ArraySize(m_ItemText));
            if(ArraySize(m_ItemText)>m_HeightInItems){
               m_sb.SetMax(ArraySize(m_ItemText)-m_HeightInItems);
            }
         if(aChecked)m_CheckCnt++;                
      }
		/*!	
			Enable visibility at a given position.
         \param		int aLeft - the X coordinate (distance from the left chart border),
         \param		int aTop - the Y coordinate (distance from the upper chart border).			
 		*/        
      void Show(int aLeft,int aTop){
         m_Left=aLeft;
         m_Top=aTop;
         Show();
      }
		/*!	
			Enable visibility.
 		*/        
      void Show(){
         m_Visible=true;
         Create();
         ScrollTo();            
         ChartRedraw(0);
      }
		/*!	
			Hiding a control (delete objects).
 		*/        
      void Hide(){
         m_Visible=false;
         Delete();
            if(m_sb.Visible()){
               m_sb.Hide();
            }
            else{
               ChartRedraw();
            }               
      }
		/*!	
			Update (hide and show with new parameters).
 		*/        
      void Refresh(){
         if(m_Visible){
            Delete();
               if(m_sb.Visible()){
                  m_sb.Hide();
               }
            Show();
         }            
      }
		/*!	
			Visibility of a control element.
			\return Type bool. True/false - visible/hidden.
 		*/      
      bool Visible(){
         return(m_Visible);
      }
		/*!	
			Setting a selected item.
         \param		int aIndex - item index,
         \param		bool aValue - true/false, a selected item is marked by a check mark.
 		*/        
      void SetChecked(int aIndex,bool aValue){
            if(m_Checked[aIndex] && !aValue){
               m_CheckCnt--; 
            }
            if(!m_Checked[aIndex] && aValue){
               m_CheckCnt++; 
            }        
         m_Checked[aIndex]=aValue;
            if(m_Visible){
               SetBgColor();
               int m_n=aIndex-m_Start;
                  if(m_n>=0 && m_n<m_HeightInItems){
                     g.Attach(m_Name+"_IC("+IntegerToString(m_n)+")");
                        if(aValue){
                           g.SetText(CharToString(252));   
                        }
                        else{
                           g.SetText(" ");   
                        }
                  }
               ChartRedraw();
            }
      }
		/*!	
			Check if an item is selected.
         \param		int aIndex - the index of the item.	
         \return  Type bool. True/false - selected/not.				
 		*/        
      bool Checked(int aIndex){
         return(m_Checked[aIndex]);
      }  
		/*!	
			Check whether selected items exist.
         \return  Type bool. True/false - there is a selected item/no.				
 		*/ 
      bool CheckedExist(){
         return(m_CheckCnt>0);
      }
		/*!	
			Getting the text of an item by its index.
         \param		int aIndex - the index of the item.					
			\return The text of the item (type string).
 		*/   
      string Text(int aIndex){
         return(m_ItemText[aIndex]);
      } 
		/*!	
			Setting the X and Y coordinates.
            \param		int aLeft - the X coordinate (distance from the left chart border),
            \param		int aTop - the Y coordinate (distance from the upper chart border).
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/ 
      void SetPos(int aLeft,int aTop){
         m_Left=aLeft;
         m_Top=aTop;
      }  
		/*!	
			Setting the X coordinate.
            \param		int aLeft - the X coordinate (distance from the left chart border).
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/            
      void SetPosLeft(int aLeft){
         m_Left=aLeft;
      }
		/*!	
			Setting the Y coordinate.
            \param		int aTop - the Y coordinate (distance from the upper chart border).
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/        
      void SetPosTop(int aTop){
         m_Top=aTop;
      }
		/*!	
			Getting width.
			\return  Value (type int).
 		*/       
      int Width(){
         return(m_Width);
      }   
		/*!	
			Getting height.
			\return  Value (type int).
 		*/
      int Height(){
         return(m_HeightInItems*14+1);
      }
		/*!	
			Getting the X coordinate.
			\return  Value (type int).
 		*/       
      int Left(){
         return(m_Left);      
      }
		/*!	
			Getting the Y coordinate.
			\return  Value (type int).
 		*/       
      int Top(){
         return(m_Top);        
      }
		/*!	
			Event handling method.
			\remark  The method is called from the OnChartEvent() function, all parameters correspond to the parameters of the OnChartEvent() function.
			\return  0 or 1. 0 - no event. 1 – an event of a click on an item.
 		*/         
      int Event(const int id,const long& lparam,const double& dparam,const string& sparam){
            if(m_sb.Event(id,lparam,dparam,sparam)==1){
               m_Start=m_sb.Value();
               ScrollTo();
               ChartRedraw();
            }
            if(id==CHARTEVENT_OBJECT_CLICK){
               if(StringFind(sparam,m_Name+"_I",0)==0){
                  g.Attach(sparam);
                  m_LastClickedX=g.XDistance();
                  m_LastClickedY=g.YDistance();
                  int m_ocx=g.XDistance()+g.XSize()/2;
                  int m_ocy=g.YDistance()+g.YSize()/2;
                  int m_ccx=(int)ChartGetInteger(0,CHART_WIDTH_IN_PIXELS,m_SubWindow)/2;
                  int m_ccy=(int)ChartGetInteger(0,CHART_HEIGHT_IN_PIXELS,m_SubWindow)/2;
                     if(m_ocy<m_ccy){
                        if(m_ocx<m_ccx){
                           m_LastClickedQuarter=1;
                        }
                        else{
                           m_LastClickedQuarter=2;
                        }
                     }
                     else{
                        if(m_ocx<m_ccx){
                           m_LastClickedQuarter=3;
                        }
                        else{
                           m_LastClickedQuarter=4;                        
                        }                     
                     }               
                  Flash(sparam,m_ItemFlashColor,m_BgColor);
                  int m_pos=StringFind(sparam,"(",0);
                  int m_index=m_Start+(int)StringToInteger(StringSubstr(sparam,m_pos+1,StringLen(sparam)-m_pos-2));
                  return(m_index);
               }
            }
         return(-1);
      }
		/*!	
			Setting a subwindow by a number.
			\param int aNumber - subwindow number.
 		*/         
      void SetSubWindow(int aNumber){
         int m_itmp=(int)MathMax(aNumber,0);
            if(m_itmp!=m_SubWindow){
               m_SubWindow=m_itmp;
               m_sb.SetSubWindow(m_SubWindow);
               Refresh();
            }
      }  
		/*!	
			Setting a subwindow by the subwindow name.
			\param string aName - subwindow name.
 		*/                
      void SetSubWindow(string aName){
         SetSubWindow(ChartWindowFind(0,aName));
      } 
		/*!	
			Setting a tag.
			\param string aValue - text.
 		*/        
      void SetTag(string aValue){
         m_Tag=aValue;
      }
		/*!	
			Getting a tag.
			\return A value (type string).
 		*/        
      string Tag(){ 
         return(m_Tag);
      }    
		/*!	
			The X coordinate of the point at which the last event occurred.
			\return Value (type int).
 		*/  
      int LastClickedX(){
         return(m_LastClickedX);
      }  
		/*!	
			The Y coordinate of the point at which the last event occurred.
			\return Value (type int).
 		*/           
      int LastClickedY(){
         return(m_LastClickedY);
      }
		/*!	
			One fourth of the chart in which there is a point at which the last event occurred.
			\return Value (type int). 1 - upper left, 2 - upper right, 3 - lower left, 4 - lower right.
 		*/        
      int LastClickedQuarter(){
         return(m_LastClickedQuarter);
      }  
		/*!	
			The height of one item.
			\return Value (type int).
 		*/        
      int ItemHeight(){
         return(15);
      }        
};

//+------------------------------------------------------------------+
//|         Class CHProgress                                             |
//+------------------------------------------------------------------+

/*!
   \brief   Graphic control element Horizontal Progress Bar.
   \details Operation in subwindows supported. 
   \remark	The control consists of two objects 
            OBJ_EDIT (background and bar) and two labels 
            (OBJ_LABEL) to display the percentage of completion and the remaining
            time. The following prefixes are added to aName to get button names:
            "_C1", "_C2", "_L1", "_L2".
*/

class CHProgress{
   protected:
      bool m_Started;
      string m_Name;
      string m_NameC1;
      string m_NameC2;
      string m_NameL1;
      string m_NameL2;
      int m_Left;
      int m_Top;
      int m_Width;
      int m_Height;
      double m_Min;
      double m_Max;
      double m_Value;
      int m_Digits;
      bool m_Visible;
      int m_Len;
      uint m_St;
      ulong m_Add;
      int m_RefreshInterval;
      datetime m_LastTime;
      color m_BgColor;
      color m_BorderColor;
      color m_ProgrColor;
      color m_TxtColor;
      int m_SubWindow;
      string m_Tag;
      string FormatSec(long aSec){
         string m_rs="";
         long m_h=aSec/3600;
         aSec-=m_h*3600;
         long m_m=aSec/60;
         aSec-=m_m*60;
            if(m_h>0){
               if(m_h<10){
                  m_rs="0"+IntegerToString(m_h)+":";
               }
               else{
                  m_rs=IntegerToString(m_h)+":";
               }
            }
           
            if(m_m<10){
               m_rs=m_rs+"0"+IntegerToString(m_m)+":";
            }
            else{
               m_rs=m_rs+IntegerToString(m_m)+":";
            }
            if(aSec<10){
               m_rs=m_rs+"0"+IntegerToString(aSec);
            }
            else{
               m_rs=m_rs+IntegerToString(aSec);
            } 
         return(m_rs);                       
      }
      void Labels(){
         double m_done=(m_Value-m_Min)/(m_Max-m_Min);
         m_Len=(int)MathRound(m_done*(m_Width-2));
         g.Attach(m_NameC2);               
         g.SetXSize(m_Len);       
         g.Attach(m_NameL1);
         g.SetText(DoubleToString(m_done*100.0,2)+"%");                 
            if(m_Started){
               uint m_tcn=GetTickCount();
               ulong m_tms;
                  if(m_tcn<m_St){
                     m_Add=ULONG_MAX-m_St;
                     m_St=0;
                  }
               m_tms=m_Add+(m_tcn-m_St);
               long m_lt=0;
               if(m_done>0)m_lt=(int)MathRound(1.0+0.001*m_tms*(1.0-m_done)/m_done);
               g.Attach(m_NameL2);
               g.SetText(FormatSec(m_lt));               
            }                     
    
      }      
      void Create(){
         w.Edit(m_NameC1,m_SubWindow,m_Left,m_Top,m_Width,m_Height," ",m_BgColor,m_BorderColor);
         g.SetReadOnly(m_NameC1,true);
         w.Edit(m_NameC2,m_SubWindow,m_Left+1,m_Top+1,m_Len,m_Height-2," ",m_ProgrColor,m_ProgrColor);  
         g.SetReadOnly(m_NameC2,true);
         w.Label(m_NameL1,m_SubWindow,m_Left+4,m_Top+2," ",m_TxtColor,7);
         w.Label(m_NameL2,m_SubWindow,m_Left+m_Width-4,m_Top+2," ",m_TxtColor,7); 
         g.SetAnchor(m_NameL2,ANCHOR_RIGHT_UPPER);
         //Labels();
      }
      void Delete(){
         g.Delete(m_NameC1);
         g.Delete(m_NameC2); 
         g.Delete(m_NameL1);
         g.Delete(m_NameL2);  
      }
   public:
		/*!	
			Control initialization.
            \param		string aName="CHProgress" - name,
            \param		int aWidth=200 - width.
 		*/    
      void Init(string aName="CHProgress",int aWidth=200){
         m_Name=aName;
         m_NameC1=m_Name+"_C1";
         m_NameC2=m_Name+"_C2";
         m_NameL1=m_Name+"_L1";
         m_NameL2=m_Name+"_L2";      
         m_Visible=false;
         m_Name=aName;
         m_Min=0;
         m_Max=100;
         m_Width=aWidth;
         m_Height=15;
         m_Value=0;
         m_Len=0;
         m_RefreshInterval=0;  
         m_BgColor=ClrScheme.Color(18);
         m_BorderColor=ClrScheme.Color(19);
         m_ProgrColor=ClrScheme.Color(20);
         m_TxtColor=ClrScheme.Color(21);
         m_SubWindow=0;
         m_Tag="";
      }
		/*!	
			Setting the refresh interval.
         \param		int aSeconds - refresh interval in seconds.
 		*/        
      void SetRefreshInterval(int aSeconds){
         m_RefreshInterval=aSeconds;
      }
		/*!	
			Setting the width.
            \param		int aWidth - width.
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/        
      void SetWidth(int aWidth){
         m_Width=aWidth;
      }
		/*!	
			Update (hide and show with new parameters).
 		*/        
      void Refersh(){
         if(m_Visible){
            Hide();
            Show();
         }
      }
		/*!	
			Setting the X and Y coordinates.
            \param		int aLeft - the X coordinate (distance from the left chart border),
            \param		int aTop - the Y coordinate (distance from the upper chart border).
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/       
      void SetPos(int aLeft,int aTop){
         m_Left=aLeft;
         m_Top=aTop;
      }   
		/*!	
			Setting the X coordinate.
            \param		int aLeft - the X coordinate (distance from the left chart border).
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/           
      void SetPosLeft(int aLeft){
         m_Left=aLeft;
      }
		/*!	
			Setting the Y coordinate.
            \param		int aTop - the Y coordinate (distance from the upper chart border).
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/        
      void SetPosTop(int aTop){
         m_Top=aTop;
      }   
		/*!	
			Getting width.
			\return  Value (type int).
 		*/         
      int Width(){
         return(m_Width);
      }
		/*!	
			Getting height.
			\return  Value (type int).
 		*/       
      int Height(){
         return(15);
      }
		/*!	
			Getting the X coordinate.
			\return  Value (type int).
 		*/       
      int Left(){
         return(m_Left);
      }
		/*!	
			Getting the Y coordinate.
			\return  Value (type int).
 		*/       
      int Top(){
         return(m_Top);
      }
		/*!	
			Enable visibility at a given position.
         \param		int aLeft - the X coordinate (distance from the left chart border),
         \param		int aTop - the Y coordinate (distance from the upper chart border).			
 		*/        
      void Show(int aLeft,int aTop){
         m_Left=aLeft;
         m_Top=aTop;
         Show();
      }
		/*!	
			Enable visibility.
 		*/   
      void Show(){
         m_Visible=true;
         Create();
         ChartRedraw();
      }
		/*!	
			Hiding a control (delete objects).
 		*/         
      void Hide(){
         m_Visible=false;
         Delete();                
         ChartRedraw();
      }  
		/*!	
			Update (hide and show with new parameters).
 		*/        
      void Refresh(){
         Delete();
         Show();
      }    
		/*!	
			A method for the start of use of the progress bar. Called just before the loop 
			whose progress is to be displayed.
         \param		double aMin=0 - initial value,
         \param		double aMax=100 - final value.
 		*/        
      void Begin(double aMin=0,double aMax=100){
         Reset();  
         m_Started=true;
         m_Min=aMin;
         m_Max=aMax;
         m_St=GetTickCount();
         m_Add=0;
         m_Value=m_Min;
      }  
		/*!	
			Reset at the end of a controlled loop. 
 		*/         
      void Reset(){
         m_Started=false;
         m_Value=m_Min;
            if(m_Visible){
               g.SetXSize(m_NameC2,0);            
               g.SetText(m_NameL1," ");
               g.SetText(m_NameL2," ");
               g.Redraw();
            }
      }
		/*!	
			Setting a value. Called from a controlled loop. 
         \param		double aValue - value.
 		*/       
      void SetValue(double aValue){
         m_Value=aValue;
         if(TimeLocal()<m_LastTime+m_RefreshInterval)return;
         m_LastTime=TimeLocal();
            if(m_Visible){
               Labels();
               ChartRedraw();
            }
      }
		/*!	
			Setting a subwindow by a number.
			\param int aNumber - subwindow number.
 		*/         
      void SetSubWindow(int aNumber){
         int m_itmp=(int)MathMax(aNumber,0);
            if(m_itmp!=m_SubWindow){
               m_SubWindow=m_itmp;
               Refresh();
            }
      }   
		/*!	
			Setting a subwindow by the subwindow name.
			\param string aName - subwindow name.
 		*/               
      void SetSubWindow(string aName){
         SetSubWindow(ChartWindowFind(0,aName));
      } 
		/*!	
			Setting a tag.
			\param string aValue - text.
 		*/         
      void SetTag(string aValue){
         m_Tag=aValue;
      }
		/*!	
			Getting a tag.
			\return A value (type string).
 		*/         
      string Tag(){ 
         return(m_Tag);
      } 
};

//+------------------------------------------------------------------+
//|         Class CDialer                                            |
//+------------------------------------------------------------------+

/*!
   \brief   The Dialer control.
   \details Used as a part of the control "Edit field 
            with a dialer". Work in subwindows is supported. 
   \remark	The control consists of the following objects  
            (OBJ_EDIT). To get the name of the background object add
            "_Frame" to aName, for button names:
            "_B1", "_B2", "_B3", "_B4", "_B5", "_B6", "_B7", "_B8",
            "_B9", "_B0" (numbers), "_BD" (point), "_BX" (close),
            "_BC" (reset), "_BE" (ok), "_M" (minus), "_T" (the field
            in which the input value is displayed).
*/

class CDialer{
   private:
      string m_NameFrame;
      string m_Name1;
      string m_Name2;
      string m_Name3;
      string m_Name4;
      string m_Name5;
      string m_Name6;
      string m_Name7;
      string m_Name8;
      string m_Name9;
      string m_Name0; 
      string m_NameD;
      string m_NameX;
      string m_NameC;
      string m_NameE;
      string m_NameT;
      string m_NameM;      
      int m_ButtonSize;
      int m_TextSize; 
      int m_Left;
      int m_Top;
      color m_BGColor;
      color m_BorderColor;      
      color m_ButDigTxColor;      
      color m_ButDigBgColor;
      color m_ButDigCtrlBgColor;
      color m_ButDigOkBgColor;
      color m_ButDigClColor;      
      color m_TxBgColor;
      color m_TxTxColor;
      color m_WrongFlashColor;
      bool m_Visible;
      int m_Width;
      int m_Height;  
      double m_Value;   
      string m_Tag;
      int m_SubWindow;      
      void Flash(string aName,color aColor){
         g.Attach(aName);
         color restc=g.BgColor();
         g.SetBgColor(aColor);
         g.Redraw();
         Sleep(100);
         g.SetBgColor(restc);
         g.Redraw(); 
      }
      void Push(string aName){
         g.Attach(aName);
         int m_x=g.XDistance();
         int m_y=g.YDistance();
         g.SetXDistance(m_x+1);
         g.SetYDistance(m_y+1);   
         g.Redraw();
         Sleep(100);
         g.SetXDistance(m_x);
         g.SetYDistance(m_y);
         g.Redraw();                                
      }      
      void Create(){
         w.Edit(m_NameFrame,m_SubWindow,m_Left,m_Top,m_Width,m_Height," ",m_BGColor,m_BorderColor);
         w.Edit(m_Name7,m_SubWindow,m_Left+2,m_Top+2,m_ButtonSize,m_ButtonSize," 7",m_ButDigBgColor,m_ButDigTxColor,8);
         w.Edit(m_Name8,m_SubWindow,m_Left+m_ButtonSize+4,m_Top+2,m_ButtonSize,m_ButtonSize," 8",m_ButDigBgColor,m_ButDigTxColor,8);
         w.Edit(m_Name9,m_SubWindow,m_Left+6+m_ButtonSize*2,m_Top+2,m_ButtonSize,m_ButtonSize," 9",m_ButDigBgColor,m_ButDigTxColor,8);
         w.Edit(m_Name4,m_SubWindow,m_Left+2,m_Top+4+m_ButtonSize,m_ButtonSize,m_ButtonSize," 4",m_ButDigBgColor,m_ButDigTxColor,8);
         w.Edit(m_Name5,m_SubWindow,m_Left+4+m_ButtonSize,m_Top+4+m_ButtonSize,m_ButtonSize,m_ButtonSize," 5",m_ButDigBgColor,m_ButDigTxColor,8);
         w.Edit(m_Name6,m_SubWindow,m_Left+6+2*m_ButtonSize,m_Top+4+m_ButtonSize,m_ButtonSize,m_ButtonSize," 6",m_ButDigBgColor,m_ButDigTxColor,8);
         w.Edit(m_Name1,m_SubWindow,m_Left+2,m_Top+6+2*m_ButtonSize,m_ButtonSize,m_ButtonSize," 1",m_ButDigBgColor,m_ButDigTxColor,8);
         w.Edit(m_Name2,m_SubWindow,m_Left+4+m_ButtonSize,m_Top+6+2*m_ButtonSize,m_ButtonSize,m_ButtonSize," 2",m_ButDigBgColor,m_ButDigTxColor,8);
         w.Edit(m_Name3,m_SubWindow,m_Left+6+2*m_ButtonSize,m_Top+6+2*m_ButtonSize,m_ButtonSize,m_ButtonSize," 3",m_ButDigBgColor,m_ButDigTxColor,8);
         w.Edit(m_Name0,m_SubWindow,m_Left+2,m_Top+8+3*m_ButtonSize,2*m_ButtonSize+2,m_ButtonSize," 0",m_ButDigBgColor,m_ButDigTxColor,8);
         w.Edit(m_NameD,m_SubWindow,m_Left+6+2*m_ButtonSize,m_Top+8+3*m_ButtonSize,m_ButtonSize,m_ButtonSize,"    '",m_ButDigBgColor,m_ButDigTxColor,5);
         w.Edit(m_NameX,m_SubWindow,m_Left+8+3*m_ButtonSize,m_Top+2,m_ButtonSize,m_ButtonSize," X",m_ButDigClColor,m_ButDigTxColor,8);
         w.Edit(m_NameC,m_SubWindow,m_Left+8+3*m_ButtonSize,m_Top+4+m_ButtonSize,m_ButtonSize,m_ButtonSize," C",m_ButDigCtrlBgColor,m_ButDigTxColor,8);
         w.Edit(m_NameM,m_SubWindow,m_Left+8+3*m_ButtonSize,m_Top+6+2*m_ButtonSize,m_ButtonSize,m_ButtonSize," -",m_ButDigBgColor,m_ButDigTxColor,10);
         w.Edit(m_NameE,m_SubWindow,m_Left+8+3*m_ButtonSize,m_Top+8+3*m_ButtonSize,m_ButtonSize,m_ButtonSize,"OK",m_ButDigOkBgColor,m_ButDigTxColor,7);
         w.Edit(m_NameT,m_SubWindow,m_Left+2,m_Top+10+4*m_ButtonSize,4*m_ButtonSize+6,m_TextSize,"",m_TxBgColor,m_TxTxColor,7);
         g.SetReadOnly(m_NameFrame,true);
         g.SetReadOnly(m_Name7,true);
         g.SetReadOnly(m_Name8,true);
         g.SetReadOnly(m_Name9,true);
         g.SetReadOnly(m_Name4,true);
         g.SetReadOnly(m_Name5,true);
         g.SetReadOnly(m_Name6,true);
         g.SetReadOnly(m_Name1,true);
         g.SetReadOnly(m_Name2,true);
         g.SetReadOnly(m_Name3,true);
         g.SetReadOnly(m_Name0,true);
         g.SetReadOnly(m_NameD,true);
         g.SetReadOnly(m_NameX,true);
         g.SetReadOnly(m_NameC,true);
         g.SetReadOnly(m_NameM,true);
         g.SetReadOnly(m_NameE,true);
         g.SetReadOnly(m_NameT,true);      
      }  
      void Delete(){
         g.Delete(m_NameFrame);
         g.Delete(m_Name1);
         g.Delete(m_Name2);
         g.Delete(m_Name3);
         g.Delete(m_Name4);
         g.Delete(m_Name5);
         g.Delete(m_Name6);
         g.Delete(m_Name7);
         g.Delete(m_Name8);
         g.Delete(m_Name9);
         g.Delete(m_Name0);
         g.Delete(m_NameD);
         g.Delete(m_NameX);
         g.Delete(m_NameC);
         g.Delete(m_NameE);
         g.Delete(m_NameT);
         g.Delete(m_NameM);         
      }
   public:
		/*!	
			Control initialization.
            \param		string aName="CDialer" - name.
 		*/     
      void Init(string aName="CDialer"){
         m_NameFrame=aName+"_Frame";
         m_Name1=aName+"_B1";
         m_Name2=aName+"_B2";
         m_Name3=aName+"_B3";
         m_Name4=aName+"_B4";
         m_Name5=aName+"_B5";
         m_Name6=aName+"_B6";
         m_Name7=aName+"_B7";
         m_Name8=aName+"_B8";
         m_Name9=aName+"_B9";
         m_Name0=aName+"_B0";      
         m_NameD=aName+"_BD";        
         m_NameX=aName+"_BX";       
         m_NameC=aName+"_BC";   
         m_NameE=aName+"_BE";  
         m_NameT=aName+"_T"; 
         m_NameM=aName+"_M";          
         m_ButtonSize=20;
         m_TextSize=15;   
         m_BGColor=ClrScheme.Color(22);
         m_BorderColor=ClrScheme.Color(23);
         m_ButDigBgColor=ClrScheme.Color(24);
         m_ButDigTxColor=ClrScheme.Color(25);
         m_ButDigCtrlBgColor=ClrScheme.Color(26);
         m_ButDigOkBgColor=ClrScheme.Color(27);
         m_ButDigClColor=ClrScheme.Color(28);
         m_TxBgColor=ClrScheme.Color(29);
         m_TxTxColor=ClrScheme.Color(30);
         m_WrongFlashColor=ClrScheme.Color(31);
         m_Width=4*m_ButtonSize+10;
         m_Height=4*m_ButtonSize+12+m_TextSize;         
         m_Visible=false;
         m_SubWindow=0;
      }  
		/*!	
			Setting a tag.
			\param string aValue - text.
 		*/       
      void SetTag(string aTag){
         m_Tag=aTag;
      }
		/*!	
			Getting a tag.
			\return A value (type string).
 		*/       
      string Tag(){
         return(m_Tag);
      }    
		/*!	
			Enable visibility at a given position.
         \param		int aLeft - the X coordinate (distance from the left chart border),
         \param		int aTop - the Y coordinate (distance from the upper chart border).			
 		*/          
      void Show(int aLeft,int aTop){
         m_Left=aLeft;
         m_Top=aTop;
         Show();
      }
		/*!	
			Enable visibility.
 		*/         
      void Show(){
         m_Visible=true;       
         Create();
         ChartRedraw();
      }
		/*!	
			Hiding a control (delete objects).
 		*/       
      void Hide(){
         m_Visible=false;
         Delete();
         ChartRedraw();
      }
		/*!	
			Update (hide and show with new parameters).
 		*/       
      void Refresh(){
         if(m_Visible){
            Delete();
            Show();
         }            
      }
		/*!	
			Setting the X and Y coordinates.
            \param		int aLeft - the X coordinate (distance from the left chart border),
            \param		int aTop - the Y coordinate (distance from the upper chart border).
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/       
      void SetPos(int aLeft,int aTop){
         m_Left=aLeft;    
         m_Top=aTop;           
      }
		/*!	
			Setting the X coordinate.
            \param		int aLeft - the X coordinate (distance from the left chart border).
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/        
      void SetPosLeft(int aLeft){
         m_Left=aLeft;
      }
		/*!	
			Setting the Y coordinate.
            \param		int aTop - the Y coordinate (distance from the upper chart border).
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/        
      void SetPosTop(int aTop){
         m_Top=aTop;
      }   
		/*!	
			Getting width.
			\return  Value (type int).
 		*/          
      int Width(){
         return(m_Width);
      }
		/*!	
			Getting height.
			\return  Value (type int).
 		*/        
      int Height(){
         return(m_Height);
      }
		/*!	
			Getting the X coordinate.
			\return  Value (type int).
 		*/       
      int Left(){
         return(m_Left);
      }
		/*!	
			Getting the Y coordinate.
			\return  Value (type int).
 		*/       
      int Top(){
         return(m_Top);
      }
		/*!	
			Visibility of a control element.
			\return Type bool. True/false - visible/hidden.
 		*/          
      bool Visible(){
         return(m_Visible);
      }
		/*!	
			The last entered value.
			\return Value (type double).
 		*/        
      double Value(){
         return(m_Value);
      }
		/*!	
			Event handling method.
			\remark  The method is called from the OnChartEvent() function, all parameters correspond to the parameters of the OnChartEvent() function.
			\return  0 or 1. 0 - no event. 1 – a new value entered.
 		*/         
      int Event(const int id,const long& lparam,const double& dparam,const string& sparam){
         int m_rv=0;
            if(id==CHARTEVENT_OBJECT_CLICK){
               if(sparam==m_Name1){
                  Push(sparam);
                  g.Attach(m_NameT);
                  g.SetText(g.Text()+"1"); 
                  g.Redraw();   
                  m_rv=2;               
               }
               if(sparam==m_Name2){
                  Push(sparam);
                  g.Attach(m_NameT);
                  g.SetText(g.Text()+"2"); 
                  g.Redraw();   
                  m_rv=2;                
               }  
               if(sparam==m_Name3){
                  Push(sparam);
                  g.Attach(m_NameT);
                  g.SetText(g.Text()+"3"); 
                  g.Redraw();   
                  m_rv=2;                 
               }
               if(sparam==m_Name4){
                  Push(sparam);
                  g.Attach(m_NameT);
                  g.SetText(g.Text()+"4"); 
                  g.Redraw(); 
                  m_rv=2;                  
               }              
               if(sparam==m_Name5){
                  Push(sparam);
                  g.Attach(m_NameT);
                  g.SetText(g.Text()+"5"); 
                  g.Redraw(); 
                  m_rv=2;                 
               }
               if(sparam==m_Name6){
                  Push(sparam);
                  g.Attach(m_NameT);
                  g.SetText(g.Text()+"6"); 
                  g.Redraw();  
                  m_rv=2;               
               }  
               if(sparam==m_Name7){
                  Push(sparam);
                  g.Attach(m_NameT);
                  g.SetText(g.Text()+"7"); 
                  g.Redraw(); 
                  m_rv=2;                
               }
               if(sparam==m_Name8){
                  Push(sparam);
                  g.Attach(m_NameT);
                  g.SetText(g.Text()+"8"); 
                  g.Redraw();
                  m_rv=2;                 
               }    
               if(sparam==m_Name9){
                  Push(sparam);
                  g.Attach(m_NameT);
                  g.SetText(g.Text()+"9"); 
                  g.Redraw();   
                  m_rv=2;            
               }
               if(sparam==m_Name0){
                  Push(sparam);
                  g.Attach(m_NameT);
                  g.SetText(g.Text()+"0"); 
                  g.Redraw();
                  m_rv=2;   
               }  
               if(sparam==m_NameD){
                  g.Attach(m_NameT);
                     if(StringFind(g.Text(),".",0)==-1){
                        Push(sparam);
                        g.Attach(m_NameT);
                        if(g.Text()=="" || g.Text()=="-")g.SetText(g.Text()+"0");
                        g.SetText(g.Text()+"."); 
                        g.Redraw();
                     }
                     else{
                        Flash(sparam,m_WrongFlashColor);
                     }
                  m_rv=2;                        
               }
               if(sparam==m_NameX){
                  Push(sparam);
                  Hide();
                  m_rv=2;   
               }
               if(sparam==m_NameC){
                  Push(sparam);
                  g.Attach(m_NameT);
                  g.SetText("");
                  g.Redraw();
                  m_rv=2;   
               }  
               if(sparam==m_NameE){
                  Push(sparam);
                  g.Attach(m_NameT);
                  string sVal=g.Text();
                  m_Value=StringToDouble(sVal);
                  Hide();
                  m_rv=1;
               }  
               if(sparam==m_NameM){
                  Push(sparam);
                  g.Attach(m_NameT);
                     if(StringSubstr(g.Text(),0,1)=="-"){
                        g.SetText(StringSubstr(g.Text(),1,StringLen(g.Text())-1));
                     }
                     else{
                        g.SetText("-"+g.Text());
                     }
                  g.Redraw();
                  m_rv=2;   
               }   
               if(sparam==m_NameFrame){
                  m_rv=2;
               }
               if(sparam==m_NameT){
                  m_rv=2;
               }  
            }             
         return(m_rv);      
      }
		/*!	
			Setting a subwindow by a number.
			\param int aNumber - subwindow number.
 		*/         
      void SetSubWindow(int aNumber){
         int m_itmp=(int)MathMax(aNumber,0);
            if(m_itmp!=m_SubWindow){
               m_SubWindow=m_itmp;
               Refresh();
            }
      } 
		/*!	
			Setting a subwindow by the subwindow name.
			\param string aName - subwindow name.
 		*/               
      void SetSubWindow(string aName){
         SetSubWindow(ChartWindowFind(0,aName));
      }      
};

//+------------------------------------------------------------------+
//|         Class CDialerInputBox                                    |
//+------------------------------------------------------------------+

/*!
   \brief   Graphic control element Edit Box with a Dialer.
   \details Operation in subwindows supported. 
   \remark	The control consists of the following controls:
            Edit Field, Dialer, text fields to show
            the entered number and button (OBJ_EDIT) and a Label (OBJ_LABEL).
            To get the Dialer name add "_D" to aName, 
            add "_I" for the edit field, add "_B" for a button and "_L" for a Label.
*/

class CDialerInputBox{
   private:
      int m_SubWindow;
      int m_Left;
      int m_Top;
      int m_Width;
      int m_Height;
      string m_DName;
      string m_IName;
      string m_BName;
      string m_LName;
      string m_Caption;
      CDialer m_d;
      CInputBox m_ib;
      color m_ColDBg;
      color m_ColDTx;
      color m_ColL;
      int m_cc;
      bool m_Visible;
      string m_Tag;
         void Create(){
            w.Edit(m_BName,m_SubWindow,m_Left+m_Width-13,m_Top,13,m_Height,"d",m_ColDBg,m_ColDTx,7,"Arial");
            g.SetReadOnly(m_BName,true);               
               if(m_Caption!=""){ // There is a caption
                  w.Label(m_LName,m_SubWindow,m_Left+m_Width+1,m_Top+2,m_Caption,m_ColL,7,"Arial"); // Create a Label
               } 
         }      
         void Delete(){
            ObjectDelete(0,m_BName);
            ObjectDelete(0,m_LName);            
         }
   public:
		/*!	
			Control initialization.
            \param		string aName="CDialerInputBox" - name,
            \param		int aWidth=50 - width,
            \param		int aDigits=4 - the number of decimal places,
            \param		string aCaption="CDialerInputBox" - label text.
 		*/      
      void Init(string aName="CDialerInputBox",int aWidth=50,int aDigits=4,string aCaption="CDialerInputBox"){
         m_ColDBg=ClrScheme.Color(4);  // Like for a spin box
         m_ColDTx=ClrScheme.Color(1);
         m_ColL=ClrScheme.Color(2);
         m_Visible=false;
         m_Left=0;
         m_Top=0;
         m_Width=aWidth;
         m_Height=15;
         m_Caption=aCaption;
         m_DName=aName+"_D";
         m_IName=aName+"_I";
         m_BName=aName+"_B";
         m_LName=aName+"_L";
         m_ib.Init(m_IName,m_Width-12,aDigits,""); // Initialization of an input field
         m_ib.SetReadOnly(true);
         m_d.Init(m_DName);
         m_cc=0;
         m_Tag="";
      }
		/*!	
			Setting the read-only property.
			\param int aValue - true/false - read-only/editable.
 		*/         
      void SetReadOnly(bool aValue){
         m_ib.SetReadOnly(aValue);
      }
		/*!	
			Getting the read-only property.
			\return Type bool. True/false - read-only/editable.
 		*/       
      bool ReadOnly(){
         return(m_ib.ReadOnly());
      }
		/*!	
			Setting the number of decimal places.
			\param int aValue - the number of decimal places.
 		*/         
      void SetDigits(int aValue){
         m_ib.SetDigits(aValue);
      }
		/*!	
			Getting the number of decimal places.
			\return Type int.
			\remark Determined by the step value.
 		*/         
      int Digits(){
         return(m_ib.Digits());
      }  
		/*!	
			Setting the minimum allowed value.
			\param double aValue - minimum allowed value. 
 		*/            
      void SetMinValue(double aValue){
         m_ib.SetMinValue(aValue);
      }
		/*!	
			Getting the minimum allowed value.
			\return Value (type double).
 		*/        
      double MinValue(){
         return(m_ib.MinValue());
      }
		/*!	
			Setting the maximum allowed value.
			\param double aValue - maximum allowed value. 
 		*/        
      void SetMaxValue(double aValue){
         m_ib.SetMaxValue(aValue);      
      }
		/*!	
			Getting the maximum allowed value.
			\return Value (type double).
 		*/        
      double MaxValue(){
         return(m_ib.MaxValue());
      }   
		/*!	
			Setting the width.
            \param		int aWidth - width.
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/ 
      void SetWidth(int aValue){
         m_Width=aValue;
         m_ib.SetWidth(m_Width-12);
      }  
		/*!	
			Getting width.
			\return  Value (type int).
			\remark  Only the value of the text box, not taking into account the label width.
 		*/        
      int Width(){
         return(m_Width);
      }
		/*!	
			Getting height.
			\return  Value (type int).
 		*/       
      int Height(){
         return(m_Height);
      }   
		/*!	
			Getting the X coordinate.
			\return  Value (type int).
 		*/       
      int Left(){
         return(m_Left);
      }
		/*!	
			Getting the Y coordinate.
			\return  Value (type int).
 		*/       
      int Top(){
         return(m_Top);
      }
		/*!	
			Update (hide and show with new parameters).
 		*/         
      void Refresh(){
         if(m_Visible){
            Delete();
            m_d.Hide();            
            m_ib.Hide();
            Show();
         }
      }
		/*!	
			Setting the X and Y coordinates.
            \param		int aLeft - the X coordinate (distance from the left chart border),
            \param		int aTop - the Y coordinate (distance from the upper chart border).
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/       
      void SetPos(int aLeft,int aTop){
         m_Left=aLeft;
         m_Top=aTop;
         m_ib.SetPos(m_Left,m_Top);
      }
		/*!	
			Setting the X coordinate.
            \param		int aLeft - the X coordinate (distance from the left chart border).
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/  
      void SetPosLeft(int aLeft){
         m_Left=aLeft;
         m_ib.SetPosLeft(m_Left);
      }  
		/*!	
			Setting the Y coordinate.
            \param		int aTop - the Y coordinate (distance from the upper chart border).
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/   
      void SetPosTop(int aTop){
         m_Top=aTop;
         m_ib.SetPosTop(m_Top);
      }
		/*!	
			Enable visibility.
 		*/         
      void Show(){
         m_Visible=true;
         Create();
         m_ib.Show();
      }
		/*!	
			Enable visibility at a given position.
         \param		int aLeft - the X coordinate (distance from the left chart border),
         \param		int aTop - the Y coordinate (distance from the upper chart border).			
 		*/       
      void Show(int aLeft,int aTop){
         SetPos(aLeft,aTop);
         Show();
      }
		/*!	
			Hiding a control (delete objects).
 		*/        
      void Hide(){
         m_Visible=false;
         Delete();
         m_d.Hide();            
         m_ib.Hide();
      }
		/*!	
			Getting a value.
			\return Value (type double).
 		*/ 
      double Value(){
         return(m_ib.ValueDouble());
      }
		/*!	
			Setting a value. 
         \param		double aValue - value.
 		*/        
      void SetValue(double aValue){
         m_ib.SetValue(aValue);
      }
		/*!	
			Event handling method.
			\remark  The method is called from the OnChartEvent() function, all parameters correspond to the parameters of the OnChartEvent() function.
			\return  0 or 1. 0 - no event. 1 – a new value entered.
 		*/        
      int Event(const int id,const long& lparam,const double& dparam,const string& sparam){
         int m_event=0;
            if(sparam==""){
               if(id==CHARTEVENT_CLICK){
                  m_cc++;
                     if(m_cc>=2){
                        if(m_d.Visible()){
                           m_d.Hide();
                        }
                     }
               }                  
            }
            else{
               m_cc=0;
                  if(m_ib.Event(id,lparam,dparam,sparam)==1){
                     m_event=1;
                  }
               int m_dev=m_d.Event(id,lparam,dparam,sparam);
                  if(m_dev==1){
                     double m_oldvalue=m_ib.ValueDouble();
                     m_ib.SetValue(m_d.Value());
                        if(m_oldvalue!=m_d.Value()){
                           m_event=1;
                        }
                     ChartRedraw();
                  }
                  if(id==CHARTEVENT_OBJECT_CLICK){
                     if(sparam==m_BName){
                        if(m_d.Visible()){
                           m_d.Hide();
                        }  
                        else{
                           int m_w=(int)ChartGetInteger(0,CHART_WIDTH_IN_PIXELS,m_SubWindow)/2;
                           int m_h=(int)ChartGetInteger(0,CHART_HEIGHT_IN_PIXELS,m_SubWindow)/2;
                           int m_x=m_Left+m_Width/2;
                           int m_y=m_Top+m_Height/2;
                           int m_cx;
                           int m_cy;
                              if(m_x<m_w){
                                 m_cx=m_Left;
                              }
                              else{
                                 m_cx=m_Left-m_d.Width()+m_Width;
                              }
                              if(m_y<m_h){
                                 m_cy=m_Top+m_ib.Height()-1;
                              }
                              else{
                                 m_cy=m_Top-m_d.Height()+1;
                              }                           
                           m_d.Show(m_cx,m_cy);
                        }                      
                     }
                     else{
                        if(m_dev!=2){
                           if(m_d.Visible()){
                              m_d.Hide();
                           } 
                        }
                     }
                  }
            }
         return(m_event);
      }
		/*!	
			Setting a tag.
			\param string aValue - text.
 		*/        
      void SetTag(string aTag){
         m_Tag=aTag;
      }
		/*!	
			Getting a tag.
			\return A value (type string).
 		*/       
      string Tag(){
         return(m_Tag);
      } 
		/*!	
			Setting a subwindow by a number.
			\param int aNumber - subwindow number.
 		*/          
      void SetSubWindow(int aNumber){
         int m_itmp=(int)MathMax(aNumber,0);
            if(m_itmp!=m_SubWindow){
               m_SubWindow=m_itmp;
               m_ib.SetSubWindow(m_SubWindow);
               m_d.SetSubWindow(m_SubWindow);               
               Refresh();
            }
      }  
		/*!	
			Setting a subwindow by the subwindow name.
			\param string aName - subwindow name.
 		*/               
      void SetSubWindow(string aName){
         SetSubWindow(ChartWindowFind(0,aName));
      }  
		/*!	
			Getting the warning mode.
			\return Type bool. True/false - warning/normal.
 		*/          
      bool Warning(){
         return(m_ib.Warning());
      }     
		/*!	
			Enable/disable the warning color.
			\param bool aValue - true/false (warning/normal). 
 		*/                    
      void SetWarning(bool aValue){
         m_ib.SetWarning(aValue);
      }
};

//+------------------------------------------------------------------+
//|         Class CTable                                             |
//+------------------------------------------------------------------+

/*!
   \brief   The Table control.
   \details Provides the ability to separately change the height of each row
            and the width of each column to control the properties of each cell: color 
            background, text, font size and type. It is possible to combine several
            cells into one horizontally and vertically. There is a way to export
            a table to HTML. Work in subwindows is supported. 
   \remark	The control element consists of two scroll bars (vertical and
            horizontal) and text fields. To get the names of scroll bars, to aName add 
            "_VSB" (vertical) and "_HSB" (horizontal). 
            To get the names of the text fields (cells) "_Cell_R([R])_C([C])" is added, 
            where R is the row index, C is the column index.
*/
class CTable{
   private:
      struct sRow{
         int RowHeight;
         string CellText[];
         color CellBGColor[];
         color CellTxtColor[];
         string CellFont[];
         int CellFontSize[];
         int CellCollSpan[];
         int CellRowSpan[];
         int CellExist[];
         int CellMergeWidth[];
         int CellMergeHeight[];
      };
      sRow m_row[];
      CVScrollBar m__vsb;
      CHScrollBar m__hsb;
      string m_Name;
      int m_CollsCount;    // number of columns
      int m_CollWidth[];   // width of columns
      int m_RowsCount;     // number of rows
      int m_Width;         // width in pixels
      int m_Height;        // height in pixels
      int m_left;          // left indent
      int m_Top;           // right indent
      bool m_Visible;      // visibility flag
      int m_tWidth;        // calculated width
      int m_tHeight;       // calculated height
      bool m_vsb;          // visibility flag 
      bool m_hsb;
      color m_DefBgColor;
      color m_DefTxColor;
      string m_DefFontFace;
      int m_DefFontSize;
      int m_SubWindow;
      int m_mrc;
      int m_mcc;
      color m_FlashColor;
      int m_PreSelectedR;
      int m_PreSelectedC;
      bool m_PreNorm;
      string m_Tag;
      int m_LastClickedRow;
      int m_LastClickedColl;
      bool m_AllowSelection;
      void SB(){
         CountTWidth();
         CountTHeight();
         m_hsb=false;
         m_vsb=false;
         int m_bheight=m_Height;
         int m_bwidth=m_Width;
         int m_tth=m_tHeight;
         int m_ttw=m_tWidth;
            if(m_tWidth>m_bwidth){
               m_tWidth=m_bwidth;
               m_hsb=true;
               m_bheight-=m__hsb.Height();
            }
            if(m_tHeight>m_bheight){
               m_tHeight=m_bheight;
               m_vsb=true;
               m_bwidth-=m__vsb.Width();
            }
            if(m_tWidth>m_bwidth){
               m_tWidth=m_bwidth;
                  if(!m_hsb){
                     m_hsb=true;
                     m_bheight-=m__hsb.Height();
                  }
            }
            if(m_tHeight>m_bheight){
               m_tHeight=m_bheight;
                  if(!m_vsb){
                     m_vsb=true;
                     m_bwidth-=m__vsb.Width();
                 }
            }
            if(m_vsb){
               m__vsb.SetMax(m_tth-m_bheight);
               m__vsb.SetSmallChange((int)MathMax(MathMin(25,m_bheight),1));
               m__vsb.SetLageChange((int)MathMax(m_bheight,1));
            }
            else{
               m__vsb.SetValue(0);
            }
            if(m_hsb){
               m__hsb.SetMax(m_ttw-m_bwidth);
               m__hsb.SetSmallChange((int)MathMax(MathMin(25,m_bwidth),1));
               m__hsb.SetLageChange((int)MathMax(m_bwidth,1));
            }
            else{
               m__hsb.SetValue(0);
            }
      }     
      void CountTWidth(){
         m_tWidth=0;
            for(int i=0;i<m_CollsCount;i++){
               m_tWidth+=m_CollWidth[i];
            }
      }
      void CountTHeight(){
         m_tHeight=0;
            for(int i=0;i<m_RowsCount;i++){
               m_tHeight+=m_row[i].RowHeight;
            }          
      }
      string iif(bool aBool,string aIfTrue,string aIfFalse){
            if(aBool){
               return(aIfTrue);
            }
         return(aIfFalse);
      }
      string its(int aValue){
         return(IntegerToString(aValue));
      }
      void GetRGB(color aColor,int & aR,int & aG, int & aB){
         aR=aColor;
         aB=aR/65536;
         aR-=aB*65536;
         aG=aR/256;
         aR-=aG*256;
      }   
      string WEBColor(color aColor){
         int ttr=0,ttg=0,ttb=0;   
         GetRGB(aColor,ttr,ttg,ttb);
         return("#"+StringFormat("%02x",ttr)+StringFormat("%02x",ttg)+StringFormat("%02x",ttb));
      }    
      void Create(){
         m_PreSelectedR=-1;
         m_PreSelectedC=-1;   
         m_PreNorm=false;      
         SB();         
         m_mrc=MathMax(m_mrc,m_RowsCount);   
         m_mcc=MathMax(m_mcc,m_CollsCount);       
         int m_xpos=0;
         int m_ypos=0;
            if(m_vsb){
               m__vsb.SetHeight(m_tHeight);
               m__vsb.Show(m_left+m_tWidth,m_Top);
            }  
            else{
               m__vsb.Hide();
            }          
            if(m_hsb){
               m__hsb.SetWidth(m_tWidth);
               m__hsb.Show(m_left,m_Top+m_tHeight);
            }         
            else{
               m__hsb.Hide();
            }          
         int m_xs=m__hsb.Value();
         int m_ys=m__vsb.Value();
         m_ypos=-m_ys;
            for(int i=0;i<m_RowsCount;i++){
               m_xpos=-m_xs;
               bool m_br=false;
                  for(int j=0;j<m_CollsCount;j++){
                        if(m_row[i].CellExist[j]){
                           int m_w=m_CollWidth[j];
                           int m_h=m_row[i].RowHeight;
                              if(m_row[i].CellCollSpan[j]>1 || m_row[i].CellRowSpan[j]>1){
                                 if(m_row[i].CellCollSpan[j]>1){
                                    for(int k=j+1;k<m_CollsCount;k++){
                                          if(m_row[i].CellExist[k]){
                                             break;
                                          }
                                       m_w+=m_CollWidth[k];
                                    }
                                 }
                                 if(m_row[i].CellRowSpan[j]>1){
                                    for(int k=i+1;k<m_RowsCount;k++){
                                          if(m_row[k].CellExist[j]){
                                             break;
                                          }
                                       m_h+=m_row[k].RowHeight;
                                    } 
                                 }
                              }
                              if(m_xpos>m_tWidth){
                                    for(;j<m_CollsCount;j++){
                                       ObjectDelete(0,m_Name+"_Cell_R("+IntegerToString(i)+")_C("+IntegerToString(j)+")");
                                    }                              
                                 break;
                              }
                              if(m_ypos>m_tHeight){
                                    for(;j<m_CollsCount;j++){
                                       ObjectDelete(0,m_Name+"_Cell_R("+IntegerToString(i)+")_C("+IntegerToString(j)+")");
                                    }
                                 break;
                              }
                              if(m_left+m_xpos+m_w>m_left+m_tWidth){
                                 m_w=m_tWidth-m_xpos;
                                 m_br=true;
                              }
                              
                              if(m_ypos+m_h>m_tHeight){
                                 m_h=m_tHeight-m_ypos;
                              }
                           int m_l2=m_left+m_xpos;
                           int m_t2=m_Top+m_ypos;
                              if(m_xpos+m_w>0 && m_ypos+m_h>0){
                                    if(m_xpos<0){
                                       m_l2=m_left;
                                       m_w=m_xpos+m_w;
                                    }
                                    if(m_ypos<0){
                                       m_t2=m_Top;
                                       m_h=m_ypos+m_h;
                                    }
                                 w.Edit(m_Name+"_Cell_R("+IntegerToString(i)+")_C("+IntegerToString(j)+")",m_SubWindow,m_l2,m_t2,m_w,m_h,m_row[i].CellText[j],m_row[i].CellBGColor[j],m_row[i].CellTxtColor[j],m_row[i].CellFontSize[j],m_row[i].CellFont[j]);
                                 g.SetReadOnly(m_Name+"_Cell_R("+IntegerToString(i)+")_C("+IntegerToString(j)+")",true);
                              }
                              else{
                                 ObjectDelete(0,m_Name+"_Cell_R("+IntegerToString(i)+")_C("+IntegerToString(j)+")");
                              }                              
                              if(m_br){
                                 j++;
                                    for(;j<m_CollsCount;j++){
                                       ObjectDelete(0,m_Name+"_Cell_R("+IntegerToString(i)+")_C("+IntegerToString(j)+")");
                                    }
                                 break;
                              }
                        }
                     m_xpos+=m_CollWidth[j];                     
                  }
               m_ypos+=m_row[i].RowHeight;
            }
            
      }       
      void Delete(){
            for(int i=0;i<m_mrc;i++){
               for(int j=0;j<m_mcc;j++){
                  ObjectDelete(0,m_Name+"_Cell_R("+IntegerToString(i)+")_C("+IntegerToString(j)+")");
               }
            }  
         m_mrc=0;
         m_mcc=0;
      }  
      void SetCrossColor(int aR,int aC,bool aNormal){
         if(aNormal){
            for(int i=0;i<m_RowsCount;i++){
               string m_tn=m_Name+"_Cell_R("+IntegerToString(i)+")_C("+IntegerToString(aC)+")";
                  if(ObjectFind(0,m_tn)==m_SubWindow){
                     g.Attach(m_tn);
                     g.SetBgColor(m_row[i].CellBGColor[aC]);
                  }
            }
            for(int i=0;i<m_CollsCount;i++){
               string m_tn=m_Name+"_Cell_R("+IntegerToString(aR)+")_C("+IntegerToString(i)+")";
                  if(ObjectFind(0,m_tn)==m_SubWindow){
                     g.Attach(m_tn);
                     g.SetBgColor(m_row[aR].CellBGColor[i]);
                  }
            }  
         }
         else{
            for(int i=0;i<m_RowsCount;i++){
               string m_tn=m_Name+"_Cell_R("+IntegerToString(i)+")_C("+IntegerToString(aC)+")";
                  if(ObjectFind(0,m_tn)==m_SubWindow){
                     g.Attach(m_tn);
                     g.SetBgColor(m_FlashColor);
                  }
            }
            for(int i=0;i<m_CollsCount;i++){
               string m_tn=m_Name+"_Cell_R("+IntegerToString(aR)+")_C("+IntegerToString(i)+")";
                  if(ObjectFind(0,m_tn)==m_SubWindow){
                     g.Attach(m_tn);
                     g.SetBgColor(m_FlashColor);
                  }
            }           }
      }                       
   public:
		/*!	
			Control initialization.
            \param		string aName="CTable" - name,
            \param		int aWidth=200 - maximum width,
            \param		int aHeight=200 - maximum height.
            \remark     If the table size exceeds the set size, scroll bars are enabled.
 		*/      
      void Init(string aName="CTable",int aWidth=200,int aHeight=200){
         m_SubWindow=0;
         m_Visible=false;
         m_Name=aName;
         m_CollsCount=0;
         m_RowsCount=0;         
         ArrayResize(m_CollWidth,0);
         ArrayResize(m_row,0);
         m_Width=aWidth;
         m_Height=aHeight;
         m_left=0;
         m_Top=0;
         m_tWidth=0;
         m_tHeight=0;  
         m_DefBgColor=ClrScheme.Color(0);
         m_DefTxColor=ClrScheme.Color(1);
         m_FlashColor=ClrScheme.Color(14);
         m_DefFontFace="Arial";
         m_DefFontSize=7;
         m_PreSelectedR=-1;
         m_PreSelectedC=-1;   
         m_PreNorm=true;      
         m_Tag="";
         m__vsb.Init(m_Name+"_VSB",m_Height);      
         m__hsb.Init(m_Name+"_HSB",m_Width);
         m_LastClickedRow=-1;
         m_LastClickedColl=-1;
         m_AllowSelection=true;
      }
		/*!	
			Add a row.
			\remark The size of the array of rows is increased and default values are assigned to new cells. If a control is displayed, refresh it using the Refresh() method.
 		*/        
      void AddRow(){
         ArrayResize(m_row,m_RowsCount+1);
         ArrayResize(m_row[m_RowsCount].CellBGColor,m_CollsCount);
         ArrayResize(m_row[m_RowsCount].CellText,m_CollsCount);         
         ArrayResize(m_row[m_RowsCount].CellTxtColor,m_CollsCount);
         ArrayResize(m_row[m_RowsCount].CellFont,m_CollsCount);         
         ArrayResize(m_row[m_RowsCount].CellFontSize,m_CollsCount);   
         ArrayResize(m_row[m_RowsCount].CellCollSpan,m_CollsCount);         
         ArrayResize(m_row[m_RowsCount].CellRowSpan,m_CollsCount);  
         ArrayResize(m_row[m_RowsCount].CellExist,m_CollsCount);                
         m_row[m_RowsCount].RowHeight=15;
            for(int i=0;i<m_CollsCount;i++){
               m_row[m_RowsCount].CellBGColor[i]=m_DefBgColor;
               m_row[m_RowsCount].CellText[i]="";  
               m_row[m_RowsCount].CellTxtColor[i]=m_DefTxColor;
               m_row[m_RowsCount].CellFont[i]=m_DefFontFace;
               m_row[m_RowsCount].CellFontSize[i]=m_DefFontSize;
               m_row[m_RowsCount].CellCollSpan[i]=1;
               m_row[m_RowsCount].CellRowSpan[i]=1;
               m_row[m_RowsCount].CellExist[i]=true;
            }
         m_RowsCount++;
         CountTHeight();  
      }
		/*!	
			Deleting a row with the specified index.
			\param   int aIndex - the index of the row to delete,
			\remark  If a control is displayed, update using Refresh() is required.
 		*/        
      void DeleteRow(int aIndex){
         if(m_RowsCount>0){
               for(int i=aIndex;i<m_RowsCount-1;i++){
                  ArrayResize(m_row[i].CellBGColor,ArraySize(m_row[i+1].CellBGColor));
                  ArrayCopy(m_row[i].CellBGColor,m_row[i+1].CellBGColor);
                  ArrayResize(m_row[i].CellCollSpan,ArraySize(m_row[i+1].CellCollSpan));
                  ArrayCopy(m_row[i].CellCollSpan,m_row[i+1].CellCollSpan);  
                  ArrayResize(m_row[i].CellExist,ArraySize(m_row[i+1].CellExist));
                  ArrayCopy(m_row[i].CellExist,m_row[i+1].CellExist);                 
                  ArrayResize(m_row[i].CellFont,ArraySize(m_row[i+1].CellFont));
                  ArrayCopy(m_row[i].CellFont,m_row[i+1].CellFont);  
                  ArrayResize(m_row[i].CellFontSize,ArraySize(m_row[i+1].CellFontSize));
                  ArrayCopy(m_row[i].CellFontSize,m_row[i+1].CellFontSize);  
                  ArrayResize(m_row[i].CellMergeHeight,ArraySize(m_row[i+1].CellMergeHeight));
                  ArrayCopy(m_row[i].CellMergeHeight,m_row[i+1].CellMergeHeight);  
                  ArrayResize(m_row[i].CellMergeWidth,ArraySize(m_row[i+1].CellMergeWidth));
                  ArrayCopy(m_row[i].CellMergeWidth,m_row[i+1].CellMergeWidth);  
                  ArrayResize(m_row[i].CellRowSpan,ArraySize(m_row[i+1].CellRowSpan));
                  ArrayCopy(m_row[i].CellRowSpan,m_row[i+1].CellRowSpan);  
                  ArrayResize(m_row[i].CellText,ArraySize(m_row[i+1].CellText));
                  ArrayCopy(m_row[i].CellText,m_row[i+1].CellText); 
                  ArrayResize(m_row[i].CellTxtColor,ArraySize(m_row[i+1].CellTxtColor));
                  ArrayCopy(m_row[i].CellTxtColor,m_row[i+1].CellTxtColor); 
                  m_row[i].RowHeight=m_row[i+1].RowHeight;
               }
            m_RowsCount--;
            ArrayResize(m_row,m_RowsCount);
         }    
      }
		/*!	
			Enable visibility at a given position.
         \param		int aLeft - the X coordinate (distance from the left chart border),
         \param		int aTop - the Y coordinate (distance from the upper chart border).			
 		*/ 
      void Show(int aLeft,int aTop){
         m_left=aLeft;
         m_Top=aTop;
         Show();
      }
		/*!	
			Enable visibility.
 		*/        
      void Show(){
         m_Visible=true;
         Create();
         ChartRedraw();
      }  
		/*!	
			Hiding a control (delete objects).
 		*/             
      void Hide(){
         m_Visible=false;
         Delete();
            if(m__vsb.Visible() || m__hsb.Visible()){
               m__vsb.Hide();
               m__hsb.Hide();
            }
         ChartRedraw();
      }
		/*!	
			Update (hide and show with new parameters).
 		*/        
      void Refresh(){
         Delete();
            if(m__hsb.Visible()){
               m__hsb.Hide();
            }
            if(m__vsb.Visible()){
               m__vsb.Hide();
            }            
         Show();
      }
		/*!	
			Setting the X and Y coordinates.
            \param		int aLeft - the X coordinate (distance from the left chart border),
            \param		int aTop - the Y coordinate (distance from the upper chart border).
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/       
      void SetPos(int aLeft,int aTop){
         m_left=aLeft;
         m_Top=aTop;
      }
		/*!	
			Setting the X coordinate.
            \param		int aLeft - the X coordinate (distance from the left chart border).
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/        
      void SetPosLeft(int aLeft){
         m_left=aLeft;
      } 
		/*!	
			Setting the Y coordinate.
            \param		int aTop - the Y coordinate (distance from the upper chart border).
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/            
      void SetPosTop(int aTop){
         m_Top=aTop;
      }     
		/*!	
			Getting the X coordinate.
			\return  Value (type int).
 		*/ 
      int Left(){
         return(m_left);
      }
		/*!	
			Getting the Y coordinate.
			\return  Value (type int).
 		*/         
      int Top(){
         return(m_Top);
      }
		/*!	
			Setting the width.
            \param		int aWidth - width.
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/ 
      void SetWidth(int aWidth){
         m_Width=aWidth;
      }
		/*!	
			Setting the height.
            \param		int aWidth - height.
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/        
      void SetHeight(int aHeight){
         m_Height=aHeight;
      }
		/*!	
			Getting width.
			\return  Value (type int).
 		*/         
      int Width(){
         return(m_Width);
      }
		/*!	
			Getting height.
			\return  Value (type int).
 		*/        
      int Height(){
         return(m_Height);
      }   
		/*!	
			Setting the number of columns in the table.
            \param		int aCount - the number of columns.
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/          
      void SetCollsCount(int aCount){
         int m_tmp=m_CollsCount;
         m_CollsCount=aCount;
         ArrayResize(m_CollWidth,m_CollsCount);
            for(int j=m_tmp;j<m_CollsCount;j++){
               m_CollWidth[j]=30;
            }
            for(int i=0;i<m_RowsCount;i++){
               ArrayResize(m_row[i].CellBGColor,m_CollsCount);
               ArrayResize(m_row[i].CellText,m_CollsCount);               
               ArrayResize(m_row[i].CellTxtColor,m_CollsCount);    
               ArrayResize(m_row[i].CellFont,m_CollsCount);               
               ArrayResize(m_row[i].CellFontSize,m_CollsCount); 
               ArrayResize(m_row[i].CellCollSpan,m_CollsCount);               
               ArrayResize(m_row[i].CellRowSpan,m_CollsCount);  
               ArrayResize(m_row[i].CellExist,m_CollsCount);                
                  for(int j=m_tmp;j<m_CollsCount;j++){
                     m_row[i].CellBGColor[j]=m_DefBgColor;
                     m_row[i].CellText[j]="";  
                     m_row[i].CellTxtColor[j]=m_DefTxColor;
                     m_row[i].CellFont[j]=m_DefFontFace;
                     m_row[i].CellFontSize[j]=m_DefFontSize;
                     m_row[i].CellCollSpan[j]=1;
                     m_row[i].CellRowSpan[j]=1;
                     m_row[i].CellExist[j]=true;
                  }
            }
         CountTWidth();
      }
		/*!	
			Setting the width of the column.
            \param		int aCollIndex - index of a column,
            \param		int aWidth - column width,            
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/       
      void SetCollWidth(int aCollIndex,int aWidth){
         m_CollWidth[aCollIndex]=aWidth;
         CountTWidth();
      }
		/*!	
			Setting the number of rows.
            \param		int aRowsCount - the number of rows.
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/        
      void SetRowsCount(int aRowsCount){
            if(aRowsCount<m_RowsCount){
               m_RowsCount=aRowsCount;
               ArrayResize(m_row,m_RowsCount); 
               CountTHeight();        
            }
            else{
               for(int i=m_RowsCount;i<aRowsCount;i++){
                  AddRow();
               }
            }
         
      }
		/*!	
			Cleaning the table.
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/        
      void Clear(){
         ArrayResize(m_row,0);
         ArrayResize(m_CollWidth,0);
         m_CollsCount=0;
         m_RowsCount=0;
         m__hsb.SetValue(0);
         m__vsb.SetValue(0);
      }
		/*!	
			Setting the height.
            \param		int aRowIndex - row index,
            \param		int aHeight - row height,            
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/        
      void SetRowHeight(int aRowIndex,int aHeight){
         m_row[aRowIndex].RowHeight=aHeight;
         CountTHeight();
      }
		/*!	
			Óñòàíîâêà òåêñòà ÿ÷åéêè.
            \param		int aRowIndex - row index,
            \param		int aCollIndex - index of a column,            
            \param		string aText - text.           
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/        
      void SetCellText(int aRowIndex,int aCollIndex,string aText){
         m_row[aRowIndex].CellText[aCollIndex]=aText;
         //string m_tn=m_Name+"_Cell_R("+IntegerToString(aRowIndex)+")_C("+IntegerToString(aCollIndex)+")";
         //g.SetText(m_tn,aText);
         //g.Redraw();
      }
      void CellRefresh(int aRowIndex,int aCollIndex){
         if(!m_Visible)return;
         g.Attach(m_Name+"_Cell_R("+IntegerToString(aRowIndex)+")_C("+IntegerToString(aCollIndex)+")");
         g.SetBgColor(m_row[aRowIndex].CellBGColor[aCollIndex]);
         g.SetFont(m_row[aRowIndex].CellFont[aCollIndex]);    
         g.SetFontSize(m_row[aRowIndex].CellFontSize[aCollIndex]);       
         g.SetText(m_row[aRowIndex].CellText[aCollIndex]); 
         g.SetColor(m_row[aRowIndex].CellTxtColor[aCollIndex]);         
         g.Redraw();
      }
		/*!	
			Setting the background color of the cell.
            \param		int aRowIndex - row index,
            \param		int aCollIndex - index of a column,            
            \param		color aBGColor - background color.           
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/         
      void SetCellBGColor(int aRowIndex,int aCollIndex,color aBGColor){
         m_row[aRowIndex].CellBGColor[aCollIndex]=aBGColor;
      }
		/*!	
			Setting the color of text in a cell.
            \param		int aRowIndex - row index,
            \param		int aCollIndex - index of a column,            
            \param		color aTxtColor - text color.           
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/        
      void SetCellTxtColor(int aRowIndex,int aCollIndex,color aTxtColor){
         m_row[aRowIndex].CellTxtColor[aCollIndex]=aTxtColor;
      }
		/*!	
			Setting the cell font.
            \param		int aRowIndex - row index,
            \param		int aCollIndex - index of a column,            
            \param		string aFont - font type.           
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/        
      void SetCellFont(int aRowIndex,int aCollIndex,string aFont="Arial"){
         m_row[aRowIndex].CellFont[aCollIndex]=aFont;
      }
		/*!	
			Setting the font size of the cell.
            \param		int aRowIndex - row index,
            \param		int aCollIndex - index of a column,            
            \param		aFontSize - font size.           
            \remark	   If a control is displayed, update using Refresh() is required.
 		*/         
      void SetCellFontSize(int aRowIndex,int aCollIndex,int aFontSize){
         m_row[aRowIndex].CellFontSize[aCollIndex]=aFontSize;
      }
		/*!	
			Merge cells.
            \param		int aRowIndex - row index,
            \param		int aCollIndex - index of a column,            
            \param		int aRowSpan - number of cells vertically,
            \param		int aCollSpan - number of cells horizontally.
            \remark	   If a control is displayed, update using Refresh() is required. A value of 1 of aRowSpan and aCollSpan means no merging of cells.
 		*/       
      void SetCellsMerge(int aRowIndex,int aCollIndex,int aRowSpan,int aCollSpan){
         aRowSpan=(int)MathMax(aRowSpan,1);
         aCollSpan=(int)MathMax(aCollSpan,1);
         if(m_row[aRowIndex].CellExist[aCollIndex]){
            int m_rs=m_row[aRowIndex].CellRowSpan[aCollIndex];
            int m_cs=m_row[aRowIndex].CellCollSpan[aCollIndex];
               for(int i=aRowIndex;i<MathMin(m_RowsCount,aRowIndex+m_rs);i++){
                  for(int j=aCollIndex;j<MathMin(m_CollsCount,aCollIndex+m_cs);j++){
                     m_row[i].CellExist[j]=true;
                  }
               }
            m_rs=aRowSpan;
            m_cs=aCollSpan;    
               for(int i=aRowIndex;i<MathMin(m_RowsCount,aRowIndex+m_rs);i++){
                  for(int j=aCollIndex;j<MathMin(m_CollsCount,aCollIndex+m_cs);j++){
                     m_row[i].CellExist[j]=false;
                  }
               }
            m_row[aRowIndex].CellRowSpan[aCollIndex]=aRowSpan;
            m_cs=m_row[aRowIndex].CellCollSpan[aCollIndex]=aCollSpan;   
            m_row[aRowIndex].CellExist[aCollIndex]=true;
         }
      }
		/*!	
			Number of columns.
			\return  Value (type int).
 		*/       
      int CollsCount(){
         return(m_CollsCount);
      }    
		/*!	
			Column width.
			\param	int aCollIndex - column index.
			\return  Value (type int).
 		*/         
      int CollWidth(int aCollIndex){
         return(m_CollWidth[aCollIndex]);
      }  
		/*!	
			The number of rows.
			\return  Value (type int).
 		*/         
      int RowsCount(){
         return(m_RowsCount);
      }  
		/*!	
			Row height.
			\param	int aRowIndex - row index.
			\return  Value (type int).
 		*/        
      int RowHeight(int aRowIndex){
         return(m_row[aRowIndex].RowHeight);
      }
		/*!	
			Cell text.
			\param	int aRowIndex - row index,
			\param	int aCollIndex - column index.			
			\return  Value (type string).
 		*/       
      string CellText(int aRowIndex,int aCollIndex){
         return(m_row[aRowIndex].CellText[aCollIndex]);
      }
		/*!	
			Cell background color.
			\param	int aRowIndex - row index,
			\param	int aCollIndex - column index.			
			\return  Value (type color).
 		*/         
      color CellBGColor(int aRowIndex,int aCollIndex){
         return(m_row[aRowIndex].CellBGColor[aCollIndex]);
      }
		/*!	
			Color of a cell text.
			\param	int aRowIndex - row index,
			\param	int aCollIndex - column index.			
			\return  Value (type color).
 		*/         
      color CellTxtColor(int aRowIndex,int aCollIndex){
         return(m_row[aRowIndex].CellTxtColor[aCollIndex]);
      }
		/*!	
			Cell font.
			\param	int aRowIndex - row index,
			\param	int aCollIndex - column index.			
			\return  Font (type string).
 		*/                
      string CellFont(int aRowIndex,int aCollIndex){
         return(m_row[aRowIndex].CellFont[aCollIndex]);
      }
		/*!	
			Cell font size.
			\param	int aRowIndex - row index,
			\param	int aCollIndex - column index.			
			\return  Size (type int).
 		*/         
      int CellFontSize(int aRowIndex,int aCollIndex){
         return(m_row[aRowIndex].CellFontSize[aCollIndex]);
      } 
		/*!	
			Event handling method.
			\remark  The method is called from the OnChartEvent() function, all parameters correspond to the parameters of the OnChartEvent() function.
			\return  0 or 1. 0 - no event. 1 – an event of a click on a cell.
 		*/ 
      int Event(const int id,const long& lparam,const double& dparam,const string& sparam){
         int m_rv=0;
               if(m__hsb.Event(id,lparam,dparam,sparam) || m__vsb.Event(id,lparam,dparam,sparam)){
                  Show();
               }
               if(id==CHARTEVENT_OBJECT_CLICK){
                  if(StringFind(sparam,m_Name+"_Cell",0)==0){
                     int m_p1=StringFind(sparam,"R(",0)+2;
                     int m_p2=StringFind(sparam,")",0);
                     m_LastClickedRow=(int)StringToInteger(StringSubstr(sparam,m_p1,m_p2-m_p1));
                     m_p1=StringFind(sparam,"C(",0)+2;
                     m_p2=StringFind(sparam,")",0);
                     m_LastClickedColl=(int)StringToInteger(StringSubstr(sparam,m_p1,m_p2-m_p1));
                     m_rv=1;
                     //string m_tn=m_Name+"_Cell_R("+IntegerToString(m_LastClickedRow)+")_C("+IntegerToString(m_LastClickedColl)+")";
                        if(m_AllowSelection){
                              if(m_LastClickedRow==m_PreSelectedR && m_LastClickedColl==m_PreSelectedC){
                                 if(!m_PreNorm){
                                    SetCrossColor(m_PreSelectedR,m_PreSelectedC,true);
                                    m_PreNorm=true;
                                 } 
                                 else{
                                    SetCrossColor(m_PreSelectedR,m_PreSelectedC,false);
                                    m_PreNorm=false;                           
                                 }
                              }
                              else{
                                    if(m_PreSelectedR!=-1){
                                       SetCrossColor(m_PreSelectedR,m_PreSelectedC,true); 
                                    }                              
                                 SetCrossColor(m_LastClickedRow,m_LastClickedColl,false); 
                                 m_PreNorm=false;
                              }
                           m_PreSelectedR=m_LastClickedRow;
                           m_PreSelectedC=m_LastClickedColl;
                        }
                     ChartRedraw(0);
                  }
               }
         return(m_rv);
      }     
		/*!	
			Export to HTML.
			\return  HTML code (type string).
 		*/       
      string HTML(){
         string m_ms="style=\""+
            "border: 1px solid "+WEBColor(m_DefTxColor)+";"+
            "border-spacing: 0;"+
                                 "font-family: "+m_DefFontFace+";"+
                                 "font-size: "+its(m_DefFontSize)+"pt;"+
                                 "color: "+WEBColor(m_DefTxColor)+";"+    
                                 "background-color: "+WEBColor(m_DefBgColor)+";"+                             
            "\"";
         string m_str="<table "+m_ms+" cellspacing=0>\n";
            for(int i=0;i<ArraySize(m_row);i++){
               m_str=m_str+"<tr>\n";
                  for(int j=0;j<m_CollsCount;j++){
                     if(m_row[i].CellExist[j]){
                        string m_t1=iif(m_row[i].CellCollSpan[j]>1," colspan="+IntegerToString(m_row[i].CellCollSpan[j]),"");
                        string m_t2=iif(m_row[i].CellRowSpan[j]>1," rowspan="+IntegerToString(m_row[i].CellRowSpan[j]),"");
                        string m_t3="style=\"";
                           m_t3=m_t3+"border: 1px solid "+WEBColor(m_row[i].CellTxtColor[j])+";";
                           if(m_row[i].CellBGColor[j]!=m_DefBgColor)m_t3=m_t3+"background-color: "+WEBColor(m_row[i].CellBGColor[j])+";";
                           if(m_row[i].CellFont[j]!=m_DefFontFace)m_t3=m_t3+"font-family: "+m_row[i].CellFont[j]+";";
                           if(m_row[i].CellFontSize[j]!=m_DefFontSize)m_t3=m_t3+"font-size: "+its(m_row[i].CellFontSize[j])+"pt;";
                           if(m_row[i].CellTxtColor[j]!=m_DefTxColor)m_t3=m_t3+"color: "+WEBColor(m_row[i].CellTxtColor[j])+";";
                        m_t3=m_t3+"\"";
                        int m_w=0;
                           for(int k=j;k<j+m_row[i].CellCollSpan[j];k++){
                              if(k<m_CollsCount){
                                 m_w+=m_CollWidth[j];
                              }
                           }
                        int m_h=0;
                           for(int k=i;k<i+m_row[i].CellRowSpan[j];k++){
                              if(k<ArraySize(m_row)){
                                 m_h+=m_row[k].RowHeight;
                              }
                           } 
                        m_h-=2;
                        m_str=m_str+"<td "+m_t3+" width="+its(m_w)+" height="+its(m_h)+m_t1+m_t2+">"+ m_row[i].CellText[j]+"</td>\n";
                     }
                  }
               m_str=m_str+"</tr>\n";            
            }
         m_str=m_str+"</table>\n";     
         return(m_str);
      }   
		/*!	
			Setting a tag.
			\param string aValue - text.
 		*/         
      void SetTag(string aTag){
         m_Tag=aTag;
      }
		/*!	
			Getting a tag.
			\return A value (type string).
 		*/     
      string Tag(){
         return(m_Tag);
      } 
		/*!	
			Setting a subwindow by a number.
			\param int aNumber - subwindow number.
 		*/         
      void SetSubWindow(int aNumber){
         int m_itmp=(int)MathMax(aNumber,0);
            if(m_itmp!=m_SubWindow){
               m_SubWindow=m_itmp;
               m__hsb.SetSubWindow(m_SubWindow);
               m__vsb.SetSubWindow(m_SubWindow);               
               Refresh();
            }
      } 
		/*!	
			Setting a subwindow by the subwindow name.
			\param string aName - subwindow name.
 		*/                
      void SetSubWindow(string aName){
         SetSubWindow(ChartWindowFind(0,aName));
      }   
		/*!	
			The index of the row at which the last event occurred.
			\return Value (type int).
 		*/        
      int LastClickedRaw(){
         return(m_LastClickedRow);
      }
		/*!	
			The index of the column at which the last event occurred.
			\return Value (type int).
 		*/    
      int LastClickedColl(){
         return(m_LastClickedColl);
      }
		/*!	
			Enabling cross-hairs.
			\param bool aValue - true/false - enabled/disabled.
 		*/       
      void SetAllowSelection(bool aValue){
         m_AllowSelection=aValue;
      }
		/*!	
			Check if the crosshair function is enabled.
			\return Type bool. True - enabled, false - disabled.
 		*/        
      bool AllowSelection(){
         return(m_AllowSelection);
      }      
};
