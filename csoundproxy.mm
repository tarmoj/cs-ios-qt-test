#include "csoundproxy.h"


#import "CsoundObj.h"
#include "csound-iOS/classes/CsoundObj.h"
#include "csound.h"



CsoundProxy::CsoundProxy()
{
  CsoundObj *cs = [[CsoundObj alloc] init ];
    /*
    
    CSOUND *csound = [cs getCsound];
    
    
    const char* orc = "sr=44100\n"
      "ksmps=32\n"
      "nchnls=2\n"
      "0dbfs=1\n\n"
      "instr 1\n"
      "aout vco2 0.5, 440\n"
      "outs aout, aout\n"
      "endin";
    
    const char* sco = "i1 0 1";
    
    
    
    if ( csound ) {
        
        csoundSetOption(csound, "-odac");
        
        csoundCompileOrc(csound, orc);
        
        csoundReadScore(csound, (char*)sco);
        
        
        csoundStart(csound);
        
        csoundPerform(csound);
        
        csoundStop(csound);
    } else {
        NSLog(@"Csound is NULL");
    }
     */

 NSString *csdFile = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"csd"];
     NSLog(@"FILE PATH: %@", csdFile);


   [cs play:csdFile];
    NSLog(@"NEXT LINE");
    
    CSOUND *csound = [cs getCsound];
    NSLog(@"Csound: %@", csound);
    
    


}
