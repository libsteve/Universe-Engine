//
//  Universe.h
//  Universe Engine
//
//  Created by Steve on 7/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "UniverseData.h"
#import "World.h"
#import "Force.h"


@interface Universe : UniverseData {
	
	// calculating unit of time
	double tick;
	
	// set of forces
	NSMutableSet * forces;

}

@property (nonatomic) double tick;

@property (strong, nonatomic) NSMutableSet * forces;

- (id)init;

// add a force to the universe
- (void)addForce:(Force *)force;

// compute the results of the forces
- (void)calculateTick;

// calculate all the forces between these two worlds
- (void)calculateForcesFrom:(World *)a To:(World *)b;

// apply the forces to the universe
- (void)applyTick;

// increment the universe one tick
- (void)incrementTime;

@end
