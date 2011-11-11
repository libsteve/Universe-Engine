//
//  Gravity.h
//  Universe Engine
//
//  Created by Steve on 7/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Force.h"
#import "XYPair.h"
#import "Distance.h"


@interface Gravity : Force {
	
	double Gexp;

}

@property (assign) double Gexp;

@end
