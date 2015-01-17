//
//  main.m
//  ObjectiveCBasics
//
//  Created by Janusz Chudzynski on 1/13/15.
//  Copyright (c) 2015 Janusz Chudzynski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XYZPerson.h"
#import "XYZShoutingPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        XYZPerson* person = [[XYZPerson alloc]init];
        [person saySomething:@"something"];
        
        XYZShoutingPerson * shoutingPerson =   [XYZShoutingPerson person];
        [shoutingPerson saySomething:@"something"];
    }
    return 0;
}
