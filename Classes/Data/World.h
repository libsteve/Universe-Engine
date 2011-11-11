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

@property (retain, nonatomic) XYPair * position;
@property (retain, nonatomic) XYPair * velocity;
@property (retain, nonatomic) XYPair * acceleration;

@property (retain, nonatomic) XYPair * nextAcceleration;

@property (retain, nonatomic) NSString * name;

/*-------------init methods--------------*/

- (id)init;
- (id)initWithName:(NSString *)worldName;
- (id)initWithName:(NSString *)worldName
			  Mass:(double)worldMass 
		  Position:(XYPair *)worldPosition 
		  Velocity:(XYPair *)worldVelocity;
- (void)dealloc;

/*-------------update methods--------------*/

- (void)addAcceleration:(XYPair *)addition;

- (void)updateAcceleration;

- (void)updateVelocityFor:(double)time;

- (void)updatePositionFor:(double)time;

- (void)updateFor:(double)time;

@end
