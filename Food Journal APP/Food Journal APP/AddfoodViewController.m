//
//  AddfoodViewController.m
//  Food Journal APP
//
//  Created by BridgeLabz Solutions LLP  on 11/1/16.
//  Copyright © 2016 BridgeLabz Solutions LLP . All rights reserved.
//

#import "AddfoodViewController.h"
#import "FoodTableViewController.h"

@interface AddfoodViewController ()

@end

@implementation AddfoodViewController
@synthesize foodTableViewController;
@synthesize foodTextField;
@synthesize restaurantTextField;
@synthesize locationManager;
@synthesize activityIndicator;
@synthesize locationLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (locationManager == nil)
    {
        locationManager = [[CLLocationManager alloc]init];
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
    }
    
    [locationManager startUpdatingLocation];
    [activityIndicator startAnimating];
    locationLabel.text = @"Searching Location...";
    
}

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    [activityIndicator stopAnimating];
    locationLabel.text = @"Location received...";
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    [activityIndicator stopAnimating];
    locationLabel.text = @"Location error";
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addFoodButtonPressed:(id)sender {
    
    [locationManager stopUpdatingLocation];
    
    NSString *newfood = [foodTextField text];
    NSString *newRestaurantName = [restaurantTextField text];
    
    NSNumber *latitude = [NSNumber numberWithFloat:0.0];
    NSNumber *longitude = [NSNumber numberWithFloat:0.0];
    
    if (locationManager.location != nil)
    {
        CLLocationCoordinate2D currentCoordinate = locationManager.location.coordinate;
        latitude = [NSNumber numberWithFloat:currentCoordinate.latitude];
        longitude = [NSNumber numberWithFloat:currentCoordinate.longitude];
    }
    NSDictionary *foodDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:newfood,foodNameIdentifier,newRestaurantName,restroNameIdentifier,latitude,restroLatitude,longitude,restroLongitude, nil];
    
       [foodTableViewController addFood:foodDictionary];
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
}
@end
