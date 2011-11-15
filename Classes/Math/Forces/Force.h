//
//  Force.h
//  Universe Engine
//
//  Created by Steve on 7/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import	"World.h"


@interface Force : NSObject {
	
	double K;

}

@property (assign) double K;

- (id)init;

- (void)updateBetween:(World *)a And:(World *)b;

@end
