//
//  UniverseData.h
//  Universe Engine
//
//  Created by Steve on 7/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "World.h"


@interface UniverseData : NSObject {
	
	// the list of worlds
	@private
	NSMutableSet * worlds;

}

@property (readonly, retain) NSMutableSet * worlds;

- (id)init;
- (void)dealloc;

// add world to universe
- (void)addWorld:(World *)world;

// add a world with information
- (void)addWorldWithName:(NSString *)worldName
					Mass:(double)worldMass 
				Position:(XYPair *)worldPosition 
				Velocity:(XYPair *)worldVelocity;

// remove world from universe
- (void)removeWorld:(World *)world;

// remove a world with name
- (void)removeWorldWithName:(NSString *)name;

// get an enumerator for all the worlds
- (NSEnumerator *)worldEnum;

// find world with name
- (World *)findWorld:(NSString *)name;

@end
