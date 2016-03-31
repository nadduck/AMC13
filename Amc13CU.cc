#include <iostream>
#include "Amc13Description.h"
#include "Amc13Interface.h"

int main()
{
  std::string cUri1 = "ipbusudp-2.0://192.168.3.253:50001";
  std::string cAddressT1 = "file:///opt/cactus/etc/amc13/AMC13XG_T1.xml";

  std::string cUri2 = "ipbusudp-2.0://192.168.3.252:50001";
  std::string cAddressT2 = "file:///opt/cactus/etc/amc13/AMC13XG_T2.xml";

  int bgoCommand = 44;
  bool bgoRepeat = 0;
  int bgoPrescale = 1;
  int bgoBX = 64;

  Amc13Description* fAmc13 = new Amc13Description();
  fAmc13->setAMCMask({3});
  fAmc13->addBGO(bgoCommand, bgoRepeat, bgoPrescale, bgoBX);

  Amc13Interface* fAmc13Interface = new Amc13Interface(cUri1, cAddressT1, cUri2, cAddressT2);

  fAmc13Interface->setAmc13Description(fAmc13);
  fAmc13Interface->ConfigureAmc13();  
}
