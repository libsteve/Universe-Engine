//
//  Distance+World.h
//  Universe Engine
//
//  Created by Steve on 7/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Distance.h"
#import "World.h"


@interface Distance (World)

+ (double)distanceFromWorld:(World *)a ToWorld:(World *)b;

+ (double)angleFromWorld:(World *)a ToWorld:(World *)b;

@end
