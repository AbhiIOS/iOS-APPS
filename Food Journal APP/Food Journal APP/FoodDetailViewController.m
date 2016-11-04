//
//  FoodDetailViewController.m
//  Food Journal APP
//
//  Created by BridgeLabz Solutions LLP  on 11/3/16.
//  Copyright © 2016 BridgeLabz Solutions LLP . All rights reserved.
//

#import "FoodDetailViewController.h"
#import "FoodTableViewController.h"
@interface FoodDetailViewController ()

@end

@implementation FoodDetailViewController
@synthesize foodLabel;
@synthesize restaurantLabel;
@synthesize displayFood;
@synthesize mapView;
@synthesize foodLocation;

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
    [foodLabel setText:[displayFood objectForKey:foodNameIdentifier]];
    [restaurantLabel setText:[displayFood objectForKey:restroNameIdentifier]];
    
    NSNumber *latitude = [foodLocation objectForKey:restroLatitude];
    NSNumber *longitude = [foodLocation objectForKey:restroLongitude];
    
    MKCoordinateRegion region;
    region.span = MKCoordinateSpanMake(0.02, 0.02);
    region.center = CLLocationCoordinate2DMake([latitude floatValue], [longitude floatValue]);
    [mapView setRegion:region];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
