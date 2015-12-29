//
//  ViewController.m
//  PHPickerView
//
//  Created by Andrzej on 03/12/15.
//  Copyright © 2015 A&A.make LTD. All rights reserved.
//

#import "ViewController.h"
#import "PHPickerView.h"

@interface ViewController ()  <PHPickerViewDataSource, PHPickerViewDelegate>

@property (nonatomic, strong) PHPickerView *pickerView;
@property (nonatomic, strong) NSArray *titles;

@end

@implementation ViewController 

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:(62.f/255.f) green:(59.f/255.f) blue:(75.f/255.f) alpha:1];
    
    
    NSDictionary *appearanceProxy2 = @{kPHRoundedButtonCornerRadius : @26,
                                       kPHRoundedButtonBorderWidth  : @1,
                                       kPHRoundedButtonRestoreSelectedState : @NO,
                                       kPHRoundedButtonBorderColor : [UIColor colorWithWhite:0.5 alpha:0.5],
                                       kPHRoundedButtonBorderAnimateToColor : [[UIColor whiteColor] colorWithAlphaComponent:0.85],
                                       kPHRoundedButtonContentColor : [[UIColor blackColor] colorWithAlphaComponent:0.5],
                                       kPHRoundedButtonContentAnimateToColor : [[UIColor whiteColor] colorWithAlphaComponent:0.85],
                                       kPHRoundedButtonForegroundColor : [[UIColor blackColor] colorWithAlphaComponent:0.3],
                                       kPHRoundedButtonForegroundAnimateToColor: [[UIColor blackColor] colorWithAlphaComponent:0.0]};
    
    [PHRoundedButtonAppearanceManager registerAppearanceProxy:appearanceProxy2 forIdentifier:@"2"];
    
    ///////////////////////////////
    
    CGRect frame = self.view.bounds;
    frame.origin.y = frame.size.height/2 - 60/2;
    frame.size.height = 76;
    
    self.pickerView = [[PHPickerView alloc] initWithFrame:frame];
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    
    self.pickerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    self.pickerView.backgroundColor = [UIColor colorWithRed:(43.f/255.f) green:(41.f/255.f) blue:(56.f/255.f) alpha:1];
    [self.view addSubview:self.pickerView];
    
    self.pickerView.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:15];
    self.pickerView.highlightedFont = [UIFont fontWithName:@"HelveticaNeue" size:15];
    self.pickerView.interitemSpacing = 20.0;
    self.pickerView.pickerViewStyle = PHPickerViewStyleFlat;
//    self.pickerView.fisheyeFactor = 0.001;
//    self.pickerView.pickerViewStyle = PHPickerViewStyle3D;
//    self.pickerView.maskDisabled = YES;
    
    self.pickerView.useRoundedButton = YES;
    self.pickerView.roundedButtonSize = CGSizeMake(52, 52);
    self.pickerView.multipleSelection = YES;
    
    self.titles = @[@"Friends",
                    @"Influencers",
                    @"Alternative",
                    @"Casual",
                    @"DJ Bar",
                    @"Gay",
                    @"Members",
                    @"Underground",
                    @"Upmarket"];
    
    [self.pickerView reloadData];
    
    ///////////////////////////////
    
//    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(doStuff:) userInfo:nil repeats:YES];
}

//- (void)doStuff:(id)sender
//{
//    NSLog(@"** DO STUFF!! **");
//    
//    [self.pickerView layoutSubviews];
//}

#pragma mark - PHPickerViewDataSource

- (void)pickerView:(PHPickerView *)pickerView configureCell:(PHPickerCollectionViewCell **)cell forItem:(NSInteger)item
{
    (*cell).label.textColor = [UIColor colorWithWhite:0.90 alpha:1];
    (*cell).label.highlightedTextColor = [UIColor colorWithWhite:1 alpha:1];
    
    (*cell).roundedButton.backgroundImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%i", (int)item%4]];
    
    NSString *title = self.titles[item];
    if(title) title = [title substringToIndex:1];
    (*cell).roundedButton.textLabel.text = title;
    (*cell).roundedButton.textLabel.font = [UIFont boldSystemFontOfSize:30];
}

-(NSString *)pickerView:(PHPickerView *)pickerView roundedButtonAppearanceIdentifierForItem:(NSInteger)item
{
    return @"2";
}

- (NSUInteger)numberOfItemsInPickerView:(PHPickerView *)pickerView
{
    return [self.titles count];
}

- (NSString *)pickerView:(PHPickerView *)pickerView titleForItem:(NSInteger)item
{
    return self.titles[item];
}

#pragma mark - PHPickerViewDelegate

- (void)pickerView:(PHPickerView *)pickerView didSelectItem:(NSInteger)item
{
    //NSLog(@"%@", self.titles[item]);
}

- (CGSize)pickerView:(PHPickerView *)pickerView marginForItem:(NSInteger)item
{
    return CGSizeMake(10, 6);
}

#pragma mark - UIScrollViewDelegate

/*
 * PHPickerViewDelegate inherits UIScrollViewDelegate.
 * You can use UIScrollViewDelegate methods
 * by simply setting pickerView's delegate.
 *
 */

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // Too noisy...
    // NSLog(@"%f", scrollView.contentOffset.x);
}

@end
