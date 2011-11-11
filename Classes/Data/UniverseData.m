//
//  UniverseData.m
//  Universe Engine
//
//  Created by Steve on 7/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UniverseData.h"
#import "World.h"


@implementation UniverseData

@synthesize worlds;

- (id)init{
	if (self = [super init]) {
		self->worlds = [[NSMutableSet alloc] init];
	}
	return self;
}
- (void)dealloc{
	[self.worlds release];
	[super dealloc];
}


// add a world
- (void)addWorld:(World *)world{
	[world retain];
	[self.worlds addObject:world];
}

// add a world with information
- (void)addWorldWithName:(NSString *)worldName
					Mass:(double)worldMass 
				Position:(XYPair *)worldPosition 
				Velocity:(XYPair *)worldVelocity{
	World * world = [[World alloc] initWithName:worldName
										   Mass:worldMass
									   Position:worldPosition
									   Velocity:worldVelocity];
	[self.worlds addObject:world];
}


// remove a world
- (void)removeWorld:(World *)world{
	[self.worlds removeObject:world];
	[world release];
}

// remove a world with name
- (void)removeWorldWithName:(NSString *)name{
	World * world = [self findWorld:name];
	NSString * errorName = @"WORLD_NOT_FOUND";
	if (![world.name isEqualTo:errorName]) {
		[self.worlds removeObject:world];
	}
	[errorName release];
	[world release];
}


// get an enumerator for all the worlds
- (NSEnumerator *)worldEnum{
	NSEnumerator * worldEnum = [worlds objectEnumerator];
	[worldEnum autorelease];
	return worldEnum;
}


// find world with name
- (World *)findWorld:(NSString *)name{
	NSEnumerator * worldEnum = [self worldEnum];
	World * current;
	while (current = [worldEnum nextObject]) {
		if ([current.name isEqualTo:name]) {
			[worldEnum release];
			return current;
		}
	}
	[worldEnum release];
	[current release];
	return [[World alloc] initWithName:@"WORLD_NOT_FOUND"];
}

@end
