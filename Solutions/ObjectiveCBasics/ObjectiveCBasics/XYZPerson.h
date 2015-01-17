//
//  XYZPerson.h
//  ObjectiveCBasics
//
//  Created by Janusz Chudzynski on 1/13/15.
//  Copyright (c) 2015 Janusz Chudzynski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYZPerson : NSObject
    @property NSString * firstname;
    @property NSString * lastname;
    @property NSDate *dateofbirth;

-(void)saySomething:(NSString *)message;
+(id)person;


@end
