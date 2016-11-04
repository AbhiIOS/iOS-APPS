//
//  FoodTableViewController.h
//  Food Journal APP
//
//  Created by BridgeLabz Solutions LLP  on 11/1/16.
//  Copyright © 2016 BridgeLabz Solutions LLP . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoodTableViewController : UITableViewController

#define foodNameIdentifier @"foodName"
#define restroNameIdentifier @"restaurantName"
#define restroLatitude @"latitude"
#define restroLongitude @"longitude"

@property NSMutableArray *foodArray;
@property NSMutableArray *locationArray;
@property NSDictionary *foodDictionary;
-(void)addFood:(NSDictionary *)newfood;


@end
