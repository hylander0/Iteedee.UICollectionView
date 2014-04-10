//
//  ITDSettingsPopupTableViewController.h
//  UICollectionView
//
//  Created by Justin Hyland on 4/10/14.
//  Copyright (c) 2014 Justin Hyland. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ITDSettingsPopupTableViewController : UITableViewController

@property (nonatomic, weak) UICollectionView *parentCollectionView;

@property (weak, nonatomic) IBOutlet UILabel *lblViewWidth;
@property (weak, nonatomic) IBOutlet UILabel *lblViewHeight;
@property (weak, nonatomic) IBOutlet UILabel *lblViewSpacing;
@property (weak, nonatomic) IBOutlet UILabel *lblItemSpacing;
@property (weak, nonatomic) IBOutlet UILabel *lblSectionInset;
@property (weak, nonatomic) IBOutlet UISegmentedControl *sgmScrollDirection;


- (IBAction)sdrViewWidth_Changed:(id)sender;
- (IBAction)sdrViewHeight_Changed:(id)sender;
- (IBAction)sdrLineSpacing_Changed:(id)sender;
- (IBAction)sdrItemSpacing_Changed:(id)sender;
- (IBAction)sdrSectionInset_Changed:(id)sender;
- (IBAction)sgmScrollDirection_Changed:(id)sender;

@end
