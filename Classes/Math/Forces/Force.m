//
//  Force.m
//  Universe Engine
//
//  Created by Steve on 7/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Force.h"
#import "World.h"


@implementation Force

@synthesize K;

- (id)init{
	if (self = [super init]) {
		self.K = 0.0;
	}
	return self;
}

- (void)updateBetween:(World *)a And:(World *)b{
	
}

@end
