//
//  ITDBasicCollectionViewCell.m
//  UICollectionView
//
//  Created by Justin Hyland on 4/10/14.
//  Copyright (c) 2014 Justin Hyland. All rights reserved.
//

#import "ITDBasicCollectionViewCell.h"

@implementation ITDBasicCollectionViewCell

NSString *const ITDBasicViewReusableIdentifier = @"BasicView";

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView:frame];
    }
    return self;
}

-(void)initView:(CGRect)frame
{
    self.txtTitle = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, frame.size.width, frame.size.width)];
    
    self.txtTitle.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    self.txtTitle.textAlignment = NSTextAlignmentCenter;
    self.txtTitle.font = [UIFont boldSystemFontOfSize:18.0f];
    self.txtTitle.backgroundColor = [UIColor blackColor];
    self.txtTitle.textColor = [UIColor whiteColor];
    
    [self.contentView addSubview:self.txtTitle];
    
    self.contentView.layer.borderWidth = 1.0f;
    self.contentView.layer.borderColor = [UIColor whiteColor].CGColor;
}
@end
