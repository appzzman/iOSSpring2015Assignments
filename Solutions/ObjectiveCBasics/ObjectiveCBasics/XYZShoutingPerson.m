//
//  XYZShoutingPerson.m
//  ObjectiveCBasics
//
//  Created by Janusz Chudzynski on 1/13/15.
//  Copyright (c) 2015 Janusz Chudzynski. All rights reserved.
//

#import "XYZShoutingPerson.h"

@implementation XYZShoutingPerson

-(void)saySomething:(NSString *)message;{
    NSString * capitalized = [message uppercaseString];
    [super saySomething:capitalized];
}

@end
