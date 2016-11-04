//
//  FoodTableViewController.m
//  Food Journal APP
//
//  Created by BridgeLabz Solutions LLP  on 11/1/16.
//  Copyright © 2016 BridgeLabz Solutions LLP . All rights reserved.
//

#import "FoodTableViewController.h"
#import "AddfoodViewController.h"
#import "FoodDetailViewController.h"
@interface FoodTableViewController ()

@end

@implementation FoodTableViewController

@synthesize foodArray;
@synthesize locationArray;
@synthesize foodDictionary;

- (NSString *)plistPath
{
    NSString *homedirectory =  NSHomeDirectory();
    NSString *filepath = [homedirectory stringByAppendingString:@"/Documents/foods.plist"];
    return filepath;
}

-(void)saveData
{
    NSString *filepath;
    filepath = [self plistPath];
    [foodArray writeToFile:filepath atomically:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(saveData:) name:UIApplicationDidEnterBackgroundNotification object:nil];
    if ([[NSFileManager defaultManager] fileExistsAtPath:[self plistPath]])
    {
        foodArray = [[NSMutableArray alloc] initWithContentsOfFile:[self plistPath]];
    }
    else
    {
        foodDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:@"Pizza",foodNameIdentifier,@"Pizza Hut",restroNameIdentifier, nil];
        
        foodArray =[[NSMutableArray alloc] initWithObjects:foodDictionary, nil];
    }
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addFood:(NSDictionary *)newfood
{
    [foodArray addObject:newfood];
    [self saveData];
    [[self tableView] reloadData];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([[segue identifier] isEqualToString:@"addFoodSegue"]) {
    
        AddfoodViewController *addFoodViewController = [segue destinationViewController];
        [addFoodViewController setFoodTableViewController:self];
    }
    else if ([[segue identifier] isEqualToString:@"foodDetailSegue"])
    {
        NSIndexPath *selectedRow = [[self tableView] indexPathForSelectedRow];
        NSDictionary *foodObject = [foodArray objectAtIndex:[selectedRow row]];
        
        FoodDetailViewController *foodDetailViewController = [segue destinationViewController];
        [foodDetailViewController setDisplayFood:foodObject];
    }
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [foodArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BasicCell" forIndexPath:indexPath];
    
    // Configure the cell...
    int rowNum = (int)[indexPath row];
    NSDictionary *obj = [foodArray objectAtIndex:rowNum];
    NSString *food = [obj objectForKey:foodNameIdentifier];
    NSString *restaurantName = [obj objectForKey:restroNameIdentifier];
    [[cell textLabel] setText:food];
    [[cell detailTextLabel] setText:restaurantName];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [foodArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self saveData];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
