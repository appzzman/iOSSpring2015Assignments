//
//  main.m
//  Logging
//
//  Created by Janusz Chudzynski on 1/13/15.
//  Copyright (c) 2015 Janusz Chudzynski. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Assignment 1");
        // Date and Temperature objects
        NSNumber *year = [NSNumber numberWithInt:2011]; NSNumber *month = [NSNumber numberWithInt:9]; NSNumber *day = [NSNumber numberWithInt:2];
        NSNumber *avgToday = [NSNumber numberWithDouble:92.3]; NSNumber *avgMonth = [NSNumber numberWithDouble:89.0];;
        //Create Collections
        NSArray *info = [NSArray arrayWithObjects: @"average temperature", @"September", @"June", nil]; NSDictionary *tempInfo = [NSDictionary dictionaryWithObjectsAndKeys:
                                                                                                                                  month, @"Month",
                                                                                                                                  day, @"Day",
                                                                                                                                  year, @"Year",
                                                                                                                                  avgToday, @"AverageToday", avgMonth, @"AverageSeptember", nil];
        //Format and Display the Output
        NSLog(@"Historical records show that the %@ for %@-%@-%@ is %4.1f.",
              [info objectAtIndex:0],
              [tempInfo objectForKey:@"Month"],
              [tempInfo objectForKey:@"Day"],
              [tempInfo objectForKey:@"Year"],
              [[tempInfo objectForKey:@"AverageToday"]doubleValue],
              nil
            );
        NSLog(@"Assignment 1 Complete");
    }
    return 0;
}
