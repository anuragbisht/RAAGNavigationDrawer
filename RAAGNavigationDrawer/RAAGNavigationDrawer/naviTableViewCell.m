//
//  naviTableViewCell.m
//  RAAGNavigationDrawer
//
//  Created by Vikram Bisht on 8/23/15.
//  Copyright (c) 2015 Anurag Bisht. All rights reserved.
//

#import "naviTableViewCell.h"

@implementation naviTableViewCell
@synthesize label,pic;
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    label.textColor = [UIColor colorWithRed:252.0f/255.0f green:241.0f/255.0f blue:223.0f/255.0f alpha:1];

    // Configure the view for the selected state
}

@end
