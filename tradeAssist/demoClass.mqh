class Demo {

public:
  int rsiHandle, lineTop, lineBot;
  double rsi[];
  double rsiValue, rsiV0, rsiV1, rsiV2;
  string rsiStr1, rsiStr2;
  
  Demo(void) {  lineBot = 30; lineTop = 70;
                rsiHandle = iRSI(_Symbol,_Period, 14, PRICE_CLOSE); 
                ArraySetAsSeries(rsi, true); };
               
  ~Demo(void){  IndicatorRelease(rsiHandle); 
                ArrayFree(rsi); };
  
  string getSignalStr1(){ return rsiStr1; }
  
  string getSignalStr2(){ return rsiStr2; }
  
  double getSignalValue(){ return rsiV0; }
  
  void eachTick(double&);
  
};

void Demo::eachTick(double &rsiVal){
  
  CopyBuffer(rsiHandle,0,0,3,rsi);
  rsiV0 = NormalizeDouble(rsi[0], 2); // current value
  rsiV1 = NormalizeDouble(rsi[1], 2);
  rsiV2 = NormalizeDouble(rsi[2], 2);
  
  // singnal as value
  rsiVal = rsiV0;  // testing passing references
 
  // signal descriptor 
  rsiStr1 = (rsiV0 > lineTop) ? "top" : (rsiV0 < lineBot) ? "bottom" : "middle";
  
  // se o sinal cruzar a linha de topo no sentido descendente diremos que queremos comprar.
  // se o sinal cruzar a linha de fundo no sentido ascendente diremos que queremos vender.
  // caso contrario nao iremos fazer nada.
  // no caso irei testar se ja temos 2x ticks na area superior ou inferior antes de tomar decisão (estabilizar oo sinal).
  rsiStr2 = (rsiV2 > lineTop && rsiV1 > lineTop && rsiV0 < lineTop) ? "sell" : 
            (rsiV2 < lineBot && rsiV1 < lineBot && rsiV0 > lineBot) ? "buy" : "no action";
 
}