//
//  Distance+World.m
//  Universe Engine
//
//  Created by Steve on 7/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Distance+World.h"
#import "Distance.h"
#import "World.h"

@implementation Distance (World)

+ (double)distanceFromWorld:(World *)a ToWorld:(World *)b{
	[a retain];
	[b retain];
	
	double xchange = a.position.X - b.position.X;
	double ychange = a.position.Y - b.position.Y;
	
	double distance = sqrt( pow(xchange, 2.0) + pow(ychange, 2.0) );
	
	[a release];
	[b release];
	
	return distance;
}

+ (double)angleFromWorld:(World *)a ToWorld:(World *)b{
	[a retain];
	[b retain];
	
	double xchange = a.position.X - b.position.X;
	double ychange = a.position.Y - b.position.Y;
	
	double angle = atan( ychange / xchange );
	
	if( xchange < 0 ){
		angle += M_PI;
	}
	else if( ychange < 0 ){
		angle += M_PI * 2;
	}
	
	[a release];
	[b release];
	
	return angle;
}

@end
