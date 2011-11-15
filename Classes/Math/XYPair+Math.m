//
//  XYPair+Math.m
//  Universe Engine
//
//  Created by Steve on 7/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "XYPair+Math.h"
#import "XYPair.h"


@implementation XYPair (Math)

- (void)add:(XYPair	*)addition{
	self.X += addition.X;
	self.Y += addition.Y;
}

- (void)subtract:(XYPair *)subtraction{
	self.X -= subtraction.X;
	self.Y -= subtraction.Y;
}

- (void)multiply:(double)constant{
	self.X = self.X * constant;
	self.Y = self.Y * constant;
}

- (void)divideBy:(double)denominator{
	self.X = self.X / denominator;
	self.Y = self.Y / denominator;
}

- (XYPair *)copy{
	XYPair * copy = [[XYPair alloc] initWithX:self.X Y:self.Y];
	return copy;
}

@end
