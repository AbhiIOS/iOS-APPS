//
//  AddfoodViewController.h
//  Food Journal APP
//
//  Created by BridgeLabz Solutions LLP  on 11/1/16.
//  Copyright © 2016 BridgeLabz Solutions LLP . All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "FoodTableViewController.h"
@interface AddfoodViewController : UIViewController <CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *restaurantTextField;
@property FoodTableViewController *foodTableViewController;
@property (weak, nonatomic) IBOutlet UITextField *foodTextField;
- (IBAction)addFoodButtonPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property CLLocationManager *locationManager;
@end
