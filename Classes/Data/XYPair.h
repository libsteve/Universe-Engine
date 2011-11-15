//
//  XYPair.h
//  Universe Engine
//
//  Created by Steve on 7/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface XYPair : NSObject {
	
	double X;
	double Y;

}

@property (assign) double X;
@property (assign) double Y;

- (id)init;
- (id)initWithX:(double)x Y:(double)y;

@end
