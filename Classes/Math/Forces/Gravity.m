//
//  Gravity.m
//  Universe Engine
//
//  Created by Steve on 7/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Gravity.h"
#import "Force.h"
#import "XYPair.h"
#import "Distance+World.h"
#import "World.h"


@implementation Gravity

@synthesize Gexp;

- (id)init{
	if (self = [super init]) {
		self.Gexp = -1.0;
		self.K = 6.67 * pow( 10.0, self.Gexp );
	}
	return self;
}

- (void)updateBetween:(World *)a And:(World *)b{
	
	double dist = [Distance distanceFromWorld:a ToWorld:b];
	
	double force = K * ( a.mass * b.mass / ( dist * dist ) );
	
	double angleA = [Distance angleFromWorld:a ToWorld:b];
	double angleB = [Distance angleFromWorld:b ToWorld:a];
	
	XYPair * accelerationA = [Distance pairFrom:force Angle:angleA];
	accelerationA.X = accelerationA.X / a.mass;
	accelerationA.Y = accelerationA.Y / a.mass;
	
	XYPair * accelerationB = [Distance pairFrom:force Angle:angleB];
	accelerationB.X = accelerationB.X / b.mass;
	accelerationB.Y = accelerationB.Y / b.mass;
	
	[a addAcceleration:accelerationA];
	[b addAcceleration:accelerationB];
	
	
}

@end
