// tradeAssist:  helper for manual trade
#include <..\Experts\learning-mql5\tradeAssist\demoClass.mqh>

double rsiVal;
Demo* ta;

int OnInit(){ 
  ResetLastError();
  ta = new Demo();
  Print("onInit finished");
  return(INIT_SUCCEEDED); 
}

void OnDeinit(const int reason){ }

void OnTick(){ 
  ta.eachTick(rsiVal);
  Comment("var1: ", rsiVal, 
          "\nvar2: ", ta.getSignalValue(),
          "\nvar3: ", ta.getSignalStr1(),
          "\nvar4: ", ta.getSignalStr2()
          );
}

