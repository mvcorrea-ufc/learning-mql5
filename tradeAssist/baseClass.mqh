// creation Path: "\Experts\learning-mql5\tradeAssist\baseClass.mqh"
class TAssist {

public:
  TAssist(void);
  ~TAssist(void);
};

TAssist::TAssist(){
  Print("TAssist:constructor");
}

TAssist::~TAssist(){
  Print("TAssist:destructor");
}