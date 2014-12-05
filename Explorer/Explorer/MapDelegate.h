//
//  MapDelegate.h
//  Explorer
//
//  Created by Janusz Chudzynski on 12/5/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;
@import MapKit;

@interface MapDelegate : NSObject
-(id)initWithMapView:(MKMapView *)mapview;
-(void)displayLocations:(NSArray *)locations;

@end
