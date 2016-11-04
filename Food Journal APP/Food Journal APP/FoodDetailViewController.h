//
//  FoodDetailViewController.h
//  Food Journal APP
//
//  Created by BridgeLabz Solutions LLP  on 11/3/16.
//  Copyright © 2016 BridgeLabz Solutions LLP . All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface FoodDetailViewController : UIViewController 
@property (weak, nonatomic) IBOutlet UILabel *foodLabel;
@property (weak, nonatomic) IBOutlet UILabel *restaurantLabel;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property NSDictionary *displayFood;
@property NSDictionary *foodLocation;
@end
