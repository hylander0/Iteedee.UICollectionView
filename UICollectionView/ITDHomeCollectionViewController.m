//
//  ITDViewController.m
//  UICollectionView
//
//  Created by Justin Hyland on 4/10/14.
//  Copyright (c) 2014 Justin Hyland. All rights reserved.
//

#import "ITDHomeCollectionViewController.h"

@interface ITDHomeCollectionViewController ()

@end

@implementation ITDHomeCollectionViewController
{
    int items;
    __weak UIPopoverController *settingsPopover;
}
-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        items = 60;
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [self RegisterReuableCells];
}

-(void)RegisterReuableCells
{
    [self.collectionView registerClass:[ITDBasicCollectionViewCell class] forCellWithReuseIdentifier:ITDBasicViewReusableIdentifier];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma -mark UICollectionViewDelegates

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return items;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell* cell = nil;
    
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:ITDBasicViewReusableIdentifier
                                                     forIndexPath:indexPath];
    
    
    ((ITDBasicCollectionViewCell*)cell).txtTitle.text = [NSString stringWithFormat:@"%i", indexPath.row + 1];
    return cell;
}
#pragma mark - UIStoryboardSegue methods
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"sgSettings"]) {
        
        ITDSettingsPopupTableViewController* actionsVC = segue.destinationViewController;
        actionsVC.parentCollectionView = self.collectionView;
        
        // we store the popover in case we press the action button again. we don't want to present another popover on top
        settingsPopover = ((UIStoryboardPopoverSegue*)segue).popoverController;
        
    }
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if ([identifier isEqualToString:@"sgSettings"] && settingsPopover) {
        
        [settingsPopover dismissPopoverAnimated:YES];
        return NO;
        
    } else {
        return YES;
    }
}
#pragma mark - Button Event methods

-(IBAction)btnSettings_Click:(id)sender
{
    [self performSegueWithIdentifier:@"sgSettings" sender:sender];
}

@end
