//
//  XYPair.m
//  Universe Engine
//
//  Created by Steve on 7/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "XYPair.h"


@implementation XYPair

@synthesize X;
@synthesize Y;

- (id)init{
	if (self = [super init]) {
		self.X = 0.0;
		self.Y = 0.0;
	}
	return self;
}
- (id)initWithX:(double)x Y:(double)y{
	if (self = [super init]) {
		self.X = x;
		self.Y = y;
	}
	return self;
}
- (void)dealloc{
	[super dealloc];
}

@end
