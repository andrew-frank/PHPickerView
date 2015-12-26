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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [super viewDidLoad];
    
    CGRect frame = self.view.bounds;
    frame.origin.y = frame.size.height/2 - 60/2;
    frame.size.height = 60;
    self.pickerView = [[PHPickerView alloc] initWithFrame:frame];
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    self.pickerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.pickerView];
    
    self.pickerView.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20];
    self.pickerView.highlightedFont = [UIFont fontWithName:@"HelveticaNeue" size:20];
    self.pickerView.interitemSpacing = 20.0;
//    self.pickerView.fisheyeFactor = 0.001;
//    self.pickerView.pickerViewStyle = PHPickerViewStyle3D;
    self.pickerView.pickerViewStyle = PHPickerViewStyleFlat;

//    self.pickerView.maskDisabled = YES;    
    self.pickerView.multipleSelection = YES;
    
    self.titles = @[@"Tokyo",
                    @"Kanagawa",
                    @"Osaka",
                    @"Aichi",
                    @"Saitama",
                    @"Chiba",
                    @"Hyogo",
                    @"Hokkaido",
                    @"Fukuoka",
                    @"Shizuoka"];
    
    [self.pickerView reloadData];
}

#pragma mark - PHPickerViewDataSource

- (void)pickerView:(PHPickerView *)pickerView configureCell:(PHPickerCollectionViewCell **)cell forItem:(NSInteger)item
{
    (*cell).contentView.backgroundColor = [UIColor colorWithWhite:0.4 alpha:0.2];
}

- (NSUInteger)numberOfItemsInPickerView:(PHPickerView *)pickerView
{
    return [self.titles count];
}

/*
 * PHPickerView now support images!
 *
 * Please comment '-pickerView:titleForItem:' entirely
 * and uncomment '-pickerView:imageForItem:' to see how it works.
 *
 */

//*
- (NSString *)pickerView:(PHPickerView *)pickerView titleForItem:(NSInteger)item
{
    return self.titles[item];
}
//*/
 
/*
 - (UIImage *)pickerView:(PHPickerView *)pickerView imageForItem:(NSInteger)item
 {
     //return [UIImage imageNamed:self.titles[item]];
     return [UIImage imageNamed:[NSString stringWithFormat:@"%i", (int)item%4]];
 }
*/

#pragma mark - PHPickerViewDelegate

- (void)pickerView:(PHPickerView *)pickerView didSelectItem:(NSInteger)item
{
    NSLog(@"%@", self.titles[item]);
}


/*
 * Label Customization
 *
 * You can customize labels by their any properties (except font,)
 * and margin around text.
 * These methods are optional, and ignored when using images.
 *
 */

/*
 - (void)pickerView:(PHPickerView *)pickerView configureLabel:(UILabel *const)label forItem:(NSInteger)item
 {
	label.textColor = [UIColor lightGrayColor];
	label.highlightedTextColor = [UIColor whiteColor];
	label.backgroundColor = [UIColor colorWithHue:(float)item/(float)self.titles.count
 saturation:1.0
 brightness:1.0
 alpha:1.0];
 }
 */

/*
 - (CGSize)pickerView:(PHPickerView *)pickerView marginForItem:(NSInteger)item
 {
	return CGSizeMake(40, 20);
 }
 */

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
