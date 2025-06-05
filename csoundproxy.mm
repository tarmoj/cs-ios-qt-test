
//#import "CsoundObj.h"
//#include "csound-iOS/classes/CsoundObj.h"
//#include "csound.h"


#import "csoundproxy.h"

#import "csound-iOS/classes/CsoundObj.h"


CsoundProxy::CsoundProxy(QObject *parent)
: QObject(parent)
{
  
   //cs = [[CsoundObj alloc] init ];
    CsoundObj *csObj = [[CsoundObj alloc] init];
    cs = (void *)csObj;
    
    if (!cs) {
        NSLog(@"Failed to initialize CsoundObj");
    } else {
        NSLog(@"CsoundObj initialized: %@", cs);
    }
    
    NSString *csdFile = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"csd"];
        NSLog(@"Csound FILE PATH: %@", csdFile);
    
    

    [(CsoundObj *)cs play:csdFile];
    
    NSLog(@"Csound after play");
    


}

CsoundProxy::~CsoundProxy()
{
    //CsoundObj *csObj = (CsoundObj *)cs;
    cs = nullptr;
}


void CsoundProxy::play()
{
    if (!cs) {
            NSLog(@"[CsoundProxy] CsoundObj pointer is null. Cannot play.");
            return;
        }
    NSLog(@"CsoundProxy PLAY");

    CsoundObj *csObj = (__bridge CsoundObj *)cs;
   
    NSLog(@"CsoundProxy PLAY");
    
    CSOUND *csound = [csObj getCsound];
    // NSLog(@"Csound: %@", csound);
    
    if (csound) {
        NSLog(@"Csound is not NULL");
        csoundReadScore(csound, "i 1 0.1 3 ");
        
    } else {
        NSLog(@"Csound is null");
    }
    
    float randomValue = 100 + (arc4random_uniform(901)); // 100–1000 inclusive
       NSLog(@"[CsoundProxy] Setting slider channel to: %f", randomValue);
    NSString *score = [NSString stringWithFormat:@"i2 0.1 2 %f", randomValue];
    [csObj sendScore:@"i1 0.05 2 0.6"];
    [csObj sendScore:score];
    


   
    
       
}


