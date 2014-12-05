//
//  ViewController.m
//  Explorer
//
//  Created by Janusz Chudzynski on 12/5/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//

#import "ViewController.h"
#import "MapDelegate.h"

@import MapKit;
@import CoreLocation;


@interface ViewController ()
@property (strong, nonatomic) IBOutlet MKMapView *mapview;
@property (strong, nonatomic)  MapDelegate * mapDelegate;
@end

@implementation ViewController


#pragma mark DON'T CHANGE CODE
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _mapDelegate = [[MapDelegate alloc]initWithMapView:self.mapview];
    [self prepareLocations];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark END


/** 
    TO DO Implement this method
*/
-(NSArray *)prepareLocations{
    // UWF 30.548991 -87.219072
    // Flounders @30.334061 -87.139992
    // Seville @30.409683 @-87.212842

    NSArray * locations;
 

    
    NSLog(@"%@",locations);
    
    [self.mapDelegate displayLocations:locations];
    
    return locations;
}


@end
