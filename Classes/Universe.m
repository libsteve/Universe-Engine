//
//  Universe.m
//  Universe Engine
//
//  Created by Steve on 7/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Universe.h"
#import "UniverseData.h"
#import "World.h"
#import "Force.h"


@implementation Universe

@synthesize tick;

@synthesize forces;

- (id)init{
	if (self = [super init]) {
		self.tick = 1.0;
		self.forces = [[NSMutableSet alloc] init];
	}
	return self;
}
- (void)dealloc{
	[self.forces release];
	[super dealloc];
}

// add a force to the universe
- (void)addForce:(Force *)force{
	[self.forces addObject:force];
}

// compute the results of the forces
- (void)calculateTick{
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	
	NSMutableSet * visited = [[NSMutableSet alloc] init];
	
	NSEnumerator * enumWorlds = [self worldEnum];
	World * world;
	while(world = [enumWorlds nextObject]){
		
		if (![visited containsObject:world]) {
			NSEnumerator * enumWorlds2 = [self worldEnum];
			World * world2;
			while(world2 = [enumWorlds2 nextObject]){
				
				if(world != world2 && ![visited containsObject:world2]){
					[self calculateForcesFrom:world To:world2];
				}
				
			}
			[enumWorlds2 release];
			[visited addObject:world];
		}
		
	}
	[enumWorlds release];
	
	[visited release];
	
	[pool drain];
}

// calculate all the forces between these two worlds
- (void)calculateForcesFrom:(World *)a To:(World *)b{
	[a retain];
	[b retain];
	
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	
	NSEnumerator * enumForces = [self.forces objectEnumerator];
	
	Force * force;
	
	while (force = [enumForces nextObject]) {
		[force updateBetween:a And:b];
	}
	
	[enumForces release];
	
	[pool drain];
	
	[a release];
	[b release];
}

// apply the forces to the universe
- (void)applyTick{
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	
	NSEnumerator * worldEnum = [self worldEnum];
	
	World * current;
	
	while (current = [worldEnum nextObject]) {
		[current retain];
		
		[current updateFor:self.tick];
		
		[current release];
	}
	
	[worldEnum release];
	
	[pool drain];
}

// increment the universe one tick
- (void)incrementTime{
	[self calculateTick];
	[self applyTick];
}


@end
