//
//  ViewController.m
//  RAAGNavigationDrawer
//
//  Created by Vikram Bisht on 8/22/15.
//  Copyright (c) 2015 Anurag Bisht. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end


@implementation ViewController

@synthesize recognizer_close, recognizer_open,drawervViewMain;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    widthOfTheScreen =  self.view.bounds.size.width;
    heightOfTheScreen = self.view.bounds.size.height;
    
    //status bar
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    
    UIView *view = [[UIView alloc]init];
    view.frame = [UIApplication sharedApplication].statusBarFrame;
    [view setBackgroundColor:[UIColor colorWithRed:0.0f/255.0f green:67.0f/255.0f  blue:78.0f/255.0f alpha:1 ]];
    [self.view addSubview:view];
    //nav bar
    self.navigationController.navigationBar.backgroundColor = [UIColor colorWithRed:55.0f/255.0f green:65.0f/255.0f blue:104.0f/255.0f alpha:0.40];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.navigationBar.alpha = 0.30;
    
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
    shadow.shadowOffset = CGSizeMake(0, 1);
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0], NSForegroundColorAttributeName,
                                                           shadow, NSShadowAttributeName,
                                                           [UIFont fontWithName:@"HelveticaNeue-Bold" size:21.0], NSFontAttributeName, nil]];
    
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setBackIndicatorImage:[UIImage imageNamed:@"back.png"]];
    [[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"back.png"]];
    //[[UINavigationBar appearance] setback]
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    //==============>background
    UIImageView *imageview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"project.jpg"]];
    imageview.frame = self.view.bounds;
    [self.view addSubview:imageview];
    [self.view sendSubviewToBack:imageview];
    
    //=====================>drawermenu
    recognizer_open = [[UISwipeGestureRecognizer alloc ] initWithTarget:self action:@selector(handleSwipe:)];
    recognizer_close = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    recognizer_close.direction = UISwipeGestureRecognizerDirectionLeft;
    recognizer_open.direction = UISwipeGestureRecognizerDirectionRight;
    
    [self.view addGestureRecognizer:recognizer_open];
    [self.view addGestureRecognizer:recognizer_close];
    
    
    //==========================
    [self.view addSubview:blurcontainerview];
    [self.view addSubview:transparentview];
    
    
    
    //===========================>drawerview<====================
    widthOfNavDrawer = 0.75 *widthOfTheScreen;
    xForDrawerView = 0-widthOfNavDrawer;
    FinalDrawerView = [[UIView alloc]initWithFrame:CGRectMake(xForDrawerView, 0, widthOfNavDrawer, heightOfTheScreen)];
    
    
    drawervViewMain.frame = CGRectMake(-240, 0, widthOfNavDrawer, heightOfTheScreen);
    FinalDrawerView.backgroundColor = [UIColor colorWithRed:47.0f/255.0f green:61.0f/255.0f blue:76.0f/255.0f alpha:0.8];
    
    
    [self.view bringSubviewToFront:FinalDrawerView];
    [UIView animateWithDuration:0.1 animations:^(void){
        [self.view bringSubviewToFront:FinalDrawerView];
    }];
    
    
    //===============================>image
    drawerImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0.33*widthOfNavDrawer, 0.09*heightOfTheScreen, 0.33*widthOfNavDrawer, 0.33*widthOfNavDrawer)];
    drawerImageView.layer.borderColor = [UIColor colorWithRed:9.0f/255.0f green:100.0f/255.0f blue:78.0f/255.0f alpha:1].CGColor;
    drawerImageView.layer.borderWidth = 3;
    drawerImageView.layer.cornerRadius = drawerImageView.frame.size.width / 2;
    drawerImageView.clipsToBounds = YES;
    drawerImageView.image = [UIImage imageNamed:@"Kaley-Cuoco1.png"];
    
    //================================>name label &place label
    drawerlLabelForName = [[UILabel alloc ]initWithFrame:CGRectMake(0.083*widthOfNavDrawer, 0.24*heightOfTheScreen, 0.79*widthOfNavDrawer, 0.035*heightOfTheScreen)];
    drawerlLabelForName.textColor = [UIColor colorWithRed:76.0f/255.0f green:166.0f/255.0f blue:142.0f/255.0f alpha:1];
    drawerlLabelForName.text  = @"Kaley Cuoco";
    drawerlLabelForName.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:17];
    drawerlLabelForName.textAlignment = NSTextAlignmentCenter;
    
    //================================>drawer label for place
    drawerlLabelForPlace =[[UILabel alloc ]initWithFrame:CGRectMake(0.083*widthOfNavDrawer, 0.28*heightOfTheScreen, 0.79*widthOfNavDrawer, 0.024 * heightOfTheScreen)];
    drawerlLabelForPlace.textColor = [UIColor whiteColor];
    drawerlLabelForPlace.text = @"Delhi,India";
    drawerlLabelForPlace.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:11];
    drawerlLabelForPlace.textAlignment = NSTextAlignmentCenter;
    
    //================================>drawer create button
    
    drawerCreateButton  = [[UIButton alloc]initWithFrame:CGRectMake(0.145*widthOfNavDrawer , 0.352*heightOfTheScreen, 0.68*widthOfNavDrawer, 0.052*heightOfTheScreen)];
    
    [drawerCreateButton setTitle:@"Create Story" forState:UIControlStateNormal];
    [drawerCreateButton setTitle:@"Create Story" forState:UIControlStateHighlighted];
    [drawerCreateButton setBackgroundColor:[UIColor colorWithRed:9.0f/255.0f green:100.0f/255.0f blue:78.0f/255.0f alpha:1]];
    
    drawerCreateButton.layer.cornerRadius = 3.0;
    drawerCreateButton.layer.shadowColor = [UIColor blackColor].CGColor;
    drawerCreateButton.layer.shadowOffset = CGSizeMake(1,2);
    drawerCreateButton.layer.shadowOpacity = 0.9f;
    drawerCreateButton.layer.shadowRadius = 2.0;
    
    
    
    //===================================>tableview
    DrawerViewtableview  = [[UITableView alloc]initWithFrame:CGRectMake(0, 0.45*heightOfTheScreen, widthOfNavDrawer, 0.55*heightOfTheScreen)];
    [DrawerViewtableview setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0]];
    [DrawerViewtableview setSeparatorColor:[UIColor clearColor]];
    [DrawerViewtableview registerNib:[UINib nibWithNibName:@"naviTableViewCell" bundle:nil] forCellReuseIdentifier:@"naviCell"];
    DrawerViewtableview.delegate = self;
    DrawerViewtableview.dataSource = self;
    
    //===========================>data arrays for tableview
    
    pics = [NSArray arrayWithObjects:[UIImage imageNamed:@"home120x.png"],[UIImage imageNamed:@"my_story120x.png"],[UIImage imageNamed:@"explore120x.png"],[UIImage imageNamed:@"setting120x.png"],[UIImage imageNamed:@"profile120x.png"],[UIImage imageNamed:@"sign_out120x.png"], nil];
    
    screens = [NSArray arrayWithObjects:@"Home",@"My Stories" ,@"Explore", @"Settings",@"Profile",@"Sign Out",nil];
    
    //drawermenu=1;
    

    
    
    //=========================>shadow for image view
    
    imageShadowView = [[UIView alloc]initWithFrame:CGRectMake(0.33*widthOfNavDrawer, 0.09*heightOfTheScreen, 0.33*widthOfNavDrawer, 0.33*widthOfNavDrawer)];
    imageShadowView.layer.cornerRadius = imageShadowView.frame.size.width/2;
    imageShadowView.layer.shadowColor = [UIColor blackColor].CGColor;
    imageShadowView.layer.shadowOffset = CGSizeMake(0, 0);
    imageShadowView.layer.shadowOpacity = 1;
    imageShadowView.layer.shadowRadius = 5;
    
    
    imageShadowView.backgroundColor = [UIColor redColor];
    
    [FinalDrawerView addSubview:imageShadowView];
    [FinalDrawerView insertSubview:imageShadowView belowSubview:drawerImageView];
    [FinalDrawerView addSubview:DrawerViewtableview];
    [FinalDrawerView addSubview:drawerCreateButton];
    [FinalDrawerView addSubview:drawerlLabelForName];
    [FinalDrawerView addSubview:drawerlLabelForPlace];
    [FinalDrawerView addSubview:drawerImageView];
    
    [self.view addSubview:FinalDrawerView];
    
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    blurcontainerview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    blurcontainerview.alpha = 0.0;
    transparentview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    transparentview.alpha = 1;
    [self.view addSubview:blurcontainerview];
    [self.view addSubview:transparentview];
    FinalDrawerView.frame  = CGRectMake(xForDrawerView, 0, widthOfNavDrawer, heightOfTheScreen);
    [self.view bringSubviewToFront:FinalDrawerView];
    
}

-(void)viewDidAppear:(BOOL)animated{
    [self performSelectorInBackground:@selector(captureBlur) withObject:nil];
}


-(void )captureBlur{
    //get a uiimage from the uiview
    NSLog(@"blur capture ");
    UIGraphicsBeginImageContext(self.view.bounds.size);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //blur the uiimage
    CIImage *imagetoblur  = [CIImage imageWithCGImage:viewImage.CGImage];
    
    //apply gaussian blur to image
    CIFilter *gaussianblurfilter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [gaussianblurfilter setValue:imagetoblur forKey:@"inputImage"];
    [gaussianblurfilter setValue:[NSNumber  numberWithFloat:5] forKey:@"inputRadius"];
    CIImage *resultimage = [gaussianblurfilter valueForKey:@"outputImage"];
    
    CIFilter *vibranceFilter = [CIFilter filterWithName:@"CIVibrance"];
    [vibranceFilter setValue:resultimage forKey:@"inputImage"];
    [vibranceFilter setValue:[NSNumber  numberWithFloat:1] forKey:@"inputAmount"];
    CIImage *finalimage = [gaussianblurfilter valueForKey:@"outputImage"];
    
    //crop the image
    CIImage *croped = [finalimage imageByCroppingToRect:CGRectMake(0, 0, widthOfTheScreen, heightOfTheScreen)];
    
    //create uiimage from filtered image
    blurredImage = [[UIImage alloc]initWithCIImage:croped];
    
    //place the uiimage in uiimageview
    blurcontainerview.frame = self.view.bounds;
    newview= [[UIImageView alloc ]initWithFrame:self.view.bounds];
    newview.image = blurredImage;
    
    //insert blur uiimageview below transparent view inside the blur image container
    [blurcontainerview insertSubview:newview belowSubview:transparentview];
    
}

#pragma marks- tableView Delegates

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
        return 6;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
        return 0;
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (tableView.tag == 1) {
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 5)] ;
        //    if (section == integerRepresentingYourSectionOfInterest)
        //        [headerView setBackgroundColor:[UIColor clearColor]];
        //    else
        //        [headerView setBackgroundColor:[UIColor clearColor]];
        [headerView setBackgroundColor:[UIColor clearColor]];
        return headerView;
    }else{
        //for tag 2
        UIView *view = [UIView new];
        return view;
        
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
        return 42;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
        if (indexPath.row==0){
            //<==========home============>
        }
        if(indexPath.row == 1){
            //<===============my stories===============>
            
        }
        if (indexPath.row == 2){
            //<==================explore===============>
        }
        if (indexPath.row == 3){
            //<====================settings=================>
            self.navigationController.navigationBar.hidden = NO;
            //[self performSegueWithIdentifier:@"friendwall" sender:self];
        }if (indexPath.row == 4){
            //<==================profile====================>
            [self.navigationController setNavigationBarHidden:NO];
            blurcontainerview.alpha = 0;
            [self performSegueWithIdentifier:@"wall" sender:self];
        }
        if (indexPath.row == 5){
            //<====================signout======================>
            
        }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
        naviTableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:@"naviCell" ];
        if (cell == nil){
            NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"navigatorCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
            
        }
        cell.pic.image = [pics objectAtIndex:indexPath.row];
        cell.label.text = [screens objectAtIndex:indexPath.row];
        if (indexPath.row%2 == 0){
            [cell setBackgroundColor:[UIColor colorWithRed:22.0f/255.0f green:22.0f/255.0f blue:22.0f/255.0f alpha:0.2]];
        }
        else{
            if (indexPath.row%2 == 1){
                [cell setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0]];
            }
        }
        return cell;
}

- (IBAction)drawerMenu:(id)sender {
    NSLog(@"this is the width of the drawer %f",widthOfNavDrawer);
    NSLog(@"this is the height of the drawer %f",heightOfTheScreen);
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:-5];
    [self.navigationController setNavigationBarHidden:YES];
    
    int a = 0;
    if (a==0) {
        blurcontainerview.alpha = 1.0;
        [self.navigationController setNavigationBarHidden:YES];
        [UIView animateWithDuration:0.3 animations:^{
            
            FinalDrawerView.frame = CGRectMake(0, 0, 240, 568);
            
            
            
        }];
        
    }
    
    if (a==0) {
        
        
    }
    
}


-(void)handleSwipe:(UISwipeGestureRecognizer *)sender{
    
    // YOU CAN DO THIS
    //if(sender.direction == UISwipeGestureRecognizerDirectionRight){whatever you want}
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:-5];
    
    
    //navigation drawer appears
    
    if (FinalDrawerView.frame.origin.x < 0){
        if(sender.direction == UISwipeGestureRecognizerDirectionRight){
            [self.navigationController setNavigationBarHidden:YES];
            NSLog(@"inside if");
            [UIView animateWithDuration:0.3 animations:^{
                blurcontainerview.alpha = 1.0;
                
                drawervViewMain.frame = CGRectMake(0, 0,0.75*widthOfTheScreen, heightOfTheScreen);

                FinalDrawerView.frame = CGRectMake(0, 0,0.75*widthOfTheScreen, heightOfTheScreen);
                NSLog(@"animation is going on 1");
            }];
            
            
        }
    }
    //navigation drawer disappears
    else{
        if (sender.direction == UISwipeGestureRecognizerDirectionLeft){
            NSLog(@"inside elde");
            
            [UIView animateWithDuration:0.3 animations:^{
                blurcontainerview.alpha = 0.0;
                 drawervViewMain.frame = CGRectMake(-282, 0,0.75*widthOfTheScreen, heightOfTheScreen);
                FinalDrawerView.frame = CGRectMake(-282, 0, 0.75*widthOfTheScreen, heightOfTheScreen);
                [self.navigationController setNavigationBarHidden:NO];
                
            }];
            
            
        }
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
