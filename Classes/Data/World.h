//
//  World.h
//  Universe Engine
//
//  Created by Steve on 7/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "XYPair+Math.h"


@interface World : NSObject {
	
	double mass;
	
	XYPair * position;
	XYPair * velocity;
	XYPair * acceleration;
	
	XYPair * nextAcceleration;
	
	NSString * name;

}

@property (assign) double mass;

@property (strong, nonatomic) XYPair * position;
@property (strong, nonatomic) XYPair * velocity;
@property (strong, nonatomic) XYPair * acceleration;

@property (strong, nonatomic) XYPair * nextAcceleration;

@property (strong, nonatomic) NSString * name;

/*-------------init methods--------------*/

- (id)init;
- (id)initWithName:(NSString *)worldName;
- (id)initWithName:(NSString *)worldName
			  Mass:(double)worldMass 
		  Position:(XYPair *)worldPosition 
		  Velocity:(XYPair *)worldVelocity;

/*-------------update methods--------------*/

- (void)addAcceleration:(XYPair *)addition;

- (void)updateAcceleration;

- (void)updateVelocityFor:(double)time;

- (void)updatePositionFor:(double)time;

- (void)updateFor:(double)time;

@end
