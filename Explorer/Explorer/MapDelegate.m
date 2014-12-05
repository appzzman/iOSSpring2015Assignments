//
//  MapDelegate.m
//  Explorer
//
//  Created by Janusz Chudzynski on 12/5/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//

#import "MapDelegate.h"
@import MapKit;
@import CoreLocation;

@interface MapDelegate()<MKMapViewDelegate, CLLocationManagerDelegate>
    @property (nonatomic,strong) MKMapView * mapView;
    @property (nonatomic,strong) CLLocationManager * locationManager;

@end


@implementation MapDelegate

-(void)displayLocations:(NSArray *)locations;{

    [self.mapView removeAnnotations:self.mapView.annotations];
    
    for(NSDictionary *location in locations){
        
        @try {
            MKPointAnnotation * annotation = [[MKPointAnnotation alloc]init];
            annotation.title = [location objectForKey:@"name"];
            CLLocationDegrees latitude = [[location objectForKey:@"latitude"]floatValue];
            CLLocationDegrees longitude = [[location objectForKey:@"longitude"]floatValue];
            
            annotation.coordinate= CLLocationCoordinate2DMake(latitude, longitude);
            [self.mapView addAnnotation:annotation];
            
        }
        @catch (NSException *exception) {
            NSLog(@"Exception %@ in %s",exception,__PRETTY_FUNCTION__);
        }
        @finally {
            
        }
       
    }
}

- (void)centerAtUWF
{
    // start off by default in UWF
    MKCoordinateRegion newRegion;
    newRegion.center.latitude = 30.409683;
    newRegion.center.longitude = -87.212842;
    newRegion.span.latitudeDelta = 0.007872;
    newRegion.span.longitudeDelta = 0.5909863;
    [self.mapView setRegion:newRegion animated:YES];
    
}



-(id)initWithMapView:(MKMapView *)mapview;
{
    if(self = [super init]){

        self.mapView = mapview;
        self.mapView.delegate = self;
        self.mapView.showsUserLocation = YES;
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        [self.locationManager requestWhenInUseAuthorization];
        
        [self centerAtUWF];
        
    }
    return self;
}
#pragma mark CoreLocationDelegate
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{

}


-(void) showCurrentLocation{
    MKCoordinateRegion newRegion;
    newRegion.center.latitude = self.mapView.userLocation.coordinate.latitude;
    newRegion.center.longitude = self.mapView.userLocation.coordinate.longitude;
    newRegion.span.latitudeDelta = 0.007872;
    newRegion.span.longitudeDelta = 0.0109863;
    [self.mapView setRegion:newRegion animated:YES];
}






#pragma mark -
#pragma mark MKMapViewDelegate

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)_control{
    ;
  
}


- (MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKUserLocation class]])
    {    MKAnnotationView *v=[[MKAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"self"];
        v.annotation=annotation;
        return nil;
    }
    // handle our two custom annotations
    else{
        
        // try to dequeue an existing pin view first
        static NSString* singleLocation = @"singleLocation";
        MKPinAnnotationView* singlePinView = (MKPinAnnotationView *)
        [self.mapView dequeueReusableAnnotationViewWithIdentifier:singleLocation];
        
        if (!singlePinView)
        {
            MKPinAnnotationView* singlePinView = [[MKPinAnnotationView alloc]
                                                    initWithAnnotation:annotation reuseIdentifier:singleLocation];
           // UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
          //  rightButton.tag=    [(Location *) annotation locationId];
            singlePinView.animatesDrop = YES;
            singlePinView.canShowCallout = YES;
            
//            UIImage *ic=[UIImage imageNamed:@"restaurant-icon.gif"];
//            UIImageView *img=[[UIImageView alloc]initWithImage:ic];
//            customPinView2.leftCalloutAccessoryView=img;
//            customPinView2.rightCalloutAccessoryView = rightButton;
            

            singlePinView.annotation=annotation;
            return singlePinView;
        }
        else{
            singlePinView.annotation=annotation;
            return singlePinView;
        }
    }
    return nil;
}





@end
