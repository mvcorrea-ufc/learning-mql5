// tradeAssist:  helper for manual trade

#include ".\tradeAssist\baseClass.mqh"

int OnInit(){ 
  TAssist ta();
  Print("onInit finished");
  return(INIT_SUCCEEDED); 
}

void OnDeinit(const int reason){ }

void OnTick(){ }

