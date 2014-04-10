//
//  ITDSettingsPopupTableViewController.m
//  UICollectionView
//
//  Created by Justin Hyland on 4/10/14.
//  Copyright (c) 2014 Justin Hyland. All rights reserved.
//

#import "ITDSettingsPopupTableViewController.h"

@interface ITDSettingsPopupTableViewController ()

@end

@implementation ITDSettingsPopupTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 6;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [super tableView:tableView
                       cellForRowAtIndexPath:indexPath];
    
//    if (indexPath.section == 1 && indexPath.row == self.selectedLayoutPath.row) {
//        cell.accessoryType = UITableViewCellAccessoryCheckmark;
//    } else {
//        cell.accessoryType = UITableViewCellAccessoryNone;
//    }
    
    return cell;

}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)sdrViewWidth_Changed:(id)sender {
    UISlider *sdr = (UISlider*)sender;
    
    float value = sdr.value;
    self.lblViewWidth.text = [NSString stringWithFormat:@"%i", (int)value];
    
    [self.parentCollectionView performBatchUpdates:^{
        
        UICollectionViewFlowLayout* flowLayout = (UICollectionViewFlowLayout*) self.parentCollectionView.collectionViewLayout;
        flowLayout.itemSize = CGSizeMake(value, flowLayout.itemSize.height);
        
    } completion:nil];

}

- (IBAction)sdrViewHeight_Changed:(id)sender {
    UISlider *sdr = (UISlider*)sender;
    float value = sdr.value;
    self.lblViewHeight.text = [NSString stringWithFormat:@"%i", (int)value];
    
    [self.parentCollectionView performBatchUpdates:^{
        
        UICollectionViewFlowLayout* flowLayout = (UICollectionViewFlowLayout*) self.parentCollectionView.collectionViewLayout;
        flowLayout.itemSize = CGSizeMake(flowLayout.itemSize.width, value);
        
    } completion:nil];
    
    
}

- (IBAction)sdrLineSpacing_Changed:(id)sender {
    UISlider *sdr = (UISlider*)sender;
    float value = sdr.value;
    
    self.lblViewSpacing.text = [NSString stringWithFormat:@"%i", (int)value];
    
    [self.parentCollectionView performBatchUpdates:^{
        
        UICollectionViewFlowLayout* flowLayout = (UICollectionViewFlowLayout*) self.parentCollectionView.collectionViewLayout;
        flowLayout.minimumLineSpacing = value;
        
    } completion:nil];
    
}

- (IBAction)sdrItemSpacing_Changed:(id)sender {
    UISlider *sdr = (UISlider*)sender;
    float value = sdr.value;
    
    self.lblItemSpacing.text = [NSString stringWithFormat:@"%i", (int)value];
    
    [self.parentCollectionView performBatchUpdates:^{
        
        UICollectionViewFlowLayout* flowLayout = (UICollectionViewFlowLayout*) self.parentCollectionView.collectionViewLayout;
        flowLayout.minimumInteritemSpacing = value;
        
    } completion:nil];
}
- (IBAction)sdrSectionInset_Changed:(id)sender {
    UISlider *sdr = (UISlider*)sender;
    float value = sdr.value;
    
    self.lblSectionInset.text = [NSString stringWithFormat:@"%i", (int)value];
    
    [self.parentCollectionView performBatchUpdates:^{
        
        UICollectionViewFlowLayout* flowLayout = (UICollectionViewFlowLayout*) self.parentCollectionView.collectionViewLayout;
        flowLayout.sectionInset = UIEdgeInsetsMake(value, value, value, value);
        
    } completion:nil];

    
}

- (IBAction)sgmScrollDirection_Changed:(id)sender {
    UISegmentedControl* scrollDirectionControl = (UISegmentedControl*)sender;
    
    UICollectionViewScrollDirection newDirection = (scrollDirectionControl.selectedSegmentIndex == 0) ? UICollectionViewScrollDirectionVertical : UICollectionViewScrollDirectionHorizontal;
    
    [self.parentCollectionView performBatchUpdates:^{
        
        UICollectionViewFlowLayout* flowLayout = (UICollectionViewFlowLayout*) self.parentCollectionView.collectionViewLayout;
        flowLayout.scrollDirection = newDirection;
        
    } completion:nil];
    
}
@end
