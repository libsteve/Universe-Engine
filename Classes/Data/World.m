//
//  World.m
//  Universe Engine
//
//  Created by Steve on 7/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "World.h"
#import "XYPair+Math.h"


@implementation World

@synthesize mass;

@synthesize position;
@synthesize velocity;
@synthesize acceleration;

@synthesize nextAcceleration;

@synthesize name;

////////////////////////////////////////////////////////
/*------------------init methods----------------------*/
////////////////////////////////////////////////////////

- (id)init{
	if (self = [super init]) {
		self.name = @"UNNAMED";
		self.mass = 0.0;
		self.position = [[XYPair alloc] init];
		self.velocity = [[XYPair alloc] init];
		self.acceleration = [[XYPair alloc] init];
		
		self.nextAcceleration = [[XYPair alloc] init];
	}
	return self;
}
- (id)initWithName:(NSString *)worldName{
	if (self = [super init]) {
		self.name = worldName;
		self.mass = 0.0;
		self.position = [[XYPair alloc] init];
		self.velocity = [[XYPair alloc] init];
		self.acceleration = [[XYPair alloc] init];
		
		self.nextAcceleration = [[XYPair alloc] init];
	}
	return self;
}
- (id)initWithName:(NSString *)worldName
			  Mass:(double)worldMass 
		  Position:(XYPair *)worldPosition 
		  Velocity:(XYPair *)worldVelocity{
	if (self = [super init]) {
		self.name = worldName;
		self.mass = worldMass;
		self.position = worldPosition;
		self.velocity = worldVelocity;
		self.acceleration = [[XYPair alloc] init];
		
		self.nextAcceleration = [[XYPair alloc] init];
	}
	return self;
}
- (void)dealloc{
	[self.name release];
	[self.position release];
	[self.velocity release];
	[self.acceleration release];
	[self.nextAcceleration release];
	[super dealloc];
}

///////////////////////////////////////////////////////////////////
/*-------------------------update methods------------------------*/
///////////////////////////////////////////////////////////////////

- (void)addAcceleration:(XYPair *)addition{
	[addition retain];
	[self.nextAcceleration add:addition];
	[addition release];
}

- (void)updateAcceleration{
	[self.acceleration release];
	self.acceleration = self.nextAcceleration;
	self.nextAcceleration = [[XYPair alloc] init];
}

- (void)updateVelocityFor:(double)time{
	double x = self.acceleration.X;
	double y =self.acceleration.Y;
	XYPair * velocityChange = [[XYPair alloc] initWithX:x*time Y:y*time];
	[self.velocity add:velocityChange];
	[velocityChange release];
}

- (void)updatePositionFor:(double)time{
	double x = self.velocity.X;
	double y =self.velocity.Y;
	XYPair * positionChange = [[XYPair alloc] initWithX:x*time Y:y*time];
	[self.velocity add:positionChange];
	[positionChange release];
}

- (void)updateFor:(double)time{
	[self updateAcceleration];
	[self updateVelocityFor:time];
	[self updatePositionFor:time];
}

@end
