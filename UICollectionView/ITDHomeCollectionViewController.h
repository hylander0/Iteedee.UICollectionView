//
//  ITDViewController.h
//  UICollectionView
//
//  Created by Justin Hyland on 4/10/14.
//  Copyright (c) 2014 Justin Hyland. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ITDBasicCollectionViewCell.h"
#import "ITDSettingsPopupTableViewController.h"

@interface ITDHomeCollectionViewController : UICollectionViewController

@property  (nonatomic, weak) IBOutlet UIBarButtonItem *btnSettings;

-(IBAction)btnSettings_Click:(id)sender;
@end
