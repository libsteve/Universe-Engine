//
//  Distance.h
//  Universe Engine
//
//  Created by Steve on 7/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "XYPair.h"


@interface Distance : NSObject {

}

+ (double)distanceFrom:(XYPair *)a To:(XYPair *)b;

+ (double)angleFrom:(XYPair *)a To:(XYPair *)b;

+ (XYPair *)pairFrom:(double)length Angle:(double)angle;

@end
