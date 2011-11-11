//
//  Momentum.h
//  Universe Engine
//
//  Created by Steve on 7/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Force.h"
#import "World.h"


@interface Momentum : Force {

}

// swap the momentum of a with that of b and visa-versa
+ (void)swap:(World *)a And:(World *)b;

@end
