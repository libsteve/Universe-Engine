//
//  Momentum.m
//  Universe Engine
//
//  Created by Steve on 7/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Momentum.h"
#import "Force.h"
#import "Distance+World.h"
#import "XYPair+Math.h"
#import "World.h"


@implementation Momentum

- (void)updateBetween:(World *)a And:(World *)b{
	[a retain];
	[b retain];
	
	double distance = [Distance distanceFromWorld:a ToWorld:b];
	
	double radiusA = a.mass	/ 2;
	double radiusB = b.mass / 2;
	
	if (distance <= radiusA + radiusB) {
		[Momentum  swap:a And:b];
	}
	
	[a release];
	[b release];
}

// swap the momentum of a with that of b and visa-versa
+ (void)swap:(World *)a And:(World *)b{
	[a retain];
	[b retain];
	
	// a's momentum
	XYPair * momentumA = [a.velocity copy];
	[momentumA multiply:a.mass];
	// b's momentum
	XYPair * momentumB = [b.velocity copy];
	[momentumB multiply:b.mass];
	
	// b's new velocity
	[momentumA divideBy:b.mass];
	// a's new velocity
	[momentumB divideBy:a.mass];
	
	[a.velocity release];
	a.velocity = momentumB;
	
	[b.velocity release];
	b.velocity = momentumA;
	
	[a release];
	[b release];
}

@end
