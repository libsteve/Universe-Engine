//
//  Distance.m
//  Universe Engine
//
//  Created by Steve on 7/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Distance.h"
#import "XYPair.h"


@implementation Distance

+ (double)distanceFrom:(XYPair *)a To:(XYPair *)b{
	
	double xchange = a.X - b.X;
	double ychange = a.Y - b.Y;
	
	double distance = sqrt( pow(xchange, 2.0) + pow(ychange, 2.0) );
	
	
	return distance;
}

+ (double)angleFrom:(XYPair *)a To:(XYPair *)b{
	
	double xchange = a.X - b.X;
	double ychange = a.Y - b.Y;
	
	double angle = atan( ychange / xchange );
	
	if( xchange < 0 ){
		angle += M_PI;
	}
	else if( ychange < 0 ){
		angle += M_PI * 2;
	}
	
	
	return angle;
}

+ (XYPair *)pairFrom:(double)length Angle:(double)angle{
	
	double x = length * cos( angle );
	if( angle == M_PI ) {
		x = 0;
	}
	x = 0 - x;
	
	double y = length * sin( angle );
	if( angle == (3 * M_PI)/2 ){
		y = 0;
	}
	y = 0 - y;
	
	XYPair * result = [[XYPair alloc] initWithX:x Y:y];
	return result;
	
}

@end
