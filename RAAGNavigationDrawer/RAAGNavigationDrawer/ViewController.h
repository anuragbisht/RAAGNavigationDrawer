//
//  ViewController.h
//  RAAGNavigationDrawer
//
//  Created by Vikram Bisht on 8/22/15.
//  Copyright (c) 2015 Anurag Bisht. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "naviTableViewCell.h"

@interface ViewController : UIViewController <UITableViewDelegate , UITableViewDataSource , UIScrollViewDelegate>
{
    CGFloat widthOfTheScreen,widthOfNavDrawer,HeightOfNavDrawer,xForDrawerView,heightOfTheScreen;
   // drawerMenuViewController *drawerMenuController;
    UIView *blurcontainerview ;
    UIView *transparentview ;
    UIImage *blurredImage;
    NSArray *pics , *screens;
    NSInteger drawermenu;

    UIImageView *drawerImageView;
    UILabel *drawerlLabelForName , *drawerlLabelForPlace;
    UIButton *drawerCreateButton;
    UITableView *DrawerViewtableview;
    UIView *FinalDrawerView;
    UIView *imageShadowView;
    UIImageView *newview;


}

@property (readonly,nonatomic) UISwipeGestureRecognizer *recognizer_open , *recognizer_close;
@property (strong, nonatomic) IBOutlet UIView *drawervViewMain;

@end

