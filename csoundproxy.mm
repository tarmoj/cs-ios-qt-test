#include "csoundproxy.h"


#import "CsoundObj.h"
#include "csound.h"



CsoundProxy::CsoundProxy()
{
  CsoundObj *csound = [[CsoundObj alloc] init ];

NSString *csdFile = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"csd"];
    NSLog(@"FILE PATH: %@", csdFile);


  [csound play:csdFile];


}
