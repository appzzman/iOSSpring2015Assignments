//
//  XYZPerson.m
//  ObjectiveCBasics
//
//  Created by Janusz Chudzynski on 1/13/15.
//  Copyright (c) 2015 Janusz Chudzynski. All rights reserved.
//

#import "XYZPerson.h"

@implementation XYZPerson
-(void)saySomething:(NSString *)message;{
        NSLog(@"Hello: %@",message);
  }

+(id)person{
    
    return [[self alloc]init];
 }





@end
