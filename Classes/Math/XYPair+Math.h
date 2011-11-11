//
//  XYPair+Math.h
//  Universe Engine
//
//  Created by Steve on 7/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "XYPair.h"


@interface XYPair (Math)

- (void)add:(XYPair *)addition;

- (void)subtract:(XYPair *)subtraction;

- (void)multiply:(double)constant;

- (void)divideBy:(double)denominator;

- (XYPair *)copy;

@end
