//
//  PHPickerView.h
//  PHPickerView
//
//  Created by Andrzej on 23/11/15.
//  Copyright © 2015 A&A.make LTD. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "PHPickerCollectionViewCell.h"


typedef NS_ENUM(NSInteger, PHPickerViewStyle) {
    PHPickerViewStyle3D = 1,
    PHPickerViewStyleFlat
};

typedef NS_ENUM(NSUInteger, PHPickerViewOrientation) {
    PHPickerViewOrientationHorizontal = 1,
    PHPickerViewOrientationVertical,
};


@class PHPickerView;

/////////////////////

@protocol PHPickerViewDataSource <NSObject>

@required
- (NSUInteger)numberOfItemsInPickerView:(PHPickerView *)pickerView;
@optional

/*
 Provide a title to create a UILabel in pickerViewCell or provide an appearanceIdentifier for roundedButton to create a PHRoundedButton above the label.
 */
- (NSString *)pickerView:(PHPickerView *)pickerView titleForItem:(NSInteger)item;
- (NSString *)pickerView:(PHPickerView *)pickerView selectedTitleForItem:(NSInteger)item;
- (NSString *)pickerView:(PHPickerView *)pickerView roundedButtonAppearanceIdentifierForItem:(NSInteger)item;

@end

/////////////////////

@protocol PHPickerViewDelegate <UIScrollViewDelegate>
@optional
- (void)pickerView:(PHPickerView *)pickerView didSelectItem:(NSInteger)item;
- (void)pickerView:(PHPickerView *)pickerView didDeselectItem:(NSInteger)item;
- (CGSize)pickerView:(PHPickerView *)pickerView marginForItem:(NSInteger)item;
/**
 @brief Use it to configure properly dequeued cell.
 @discussion  Called after titleForItem: and roundedButtonAppearanceIdentifierForItem:, so you can use them to have initially configured cell as a starting point.
 */
- (void)pickerView:(PHPickerView *)pickerView configureCell:(PHPickerCollectionViewCell **)cell forItem:(NSInteger)item;

@end

/////////////////////

@interface PHPickerView : UIView

@property (nonatomic, weak) id <PHPickerViewDataSource> dataSource;
@property (nonatomic, weak) id <PHPickerViewDelegate> delegate;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) UIFont *highlightedFont;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIColor *highlightedTextColor;
@property (nonatomic, assign) CGFloat interitemSpacing;
@property (nonatomic, assign) BOOL useRoundedButton;
@property (nonatomic, assign) CGSize roundedButtonSize;
@property (nonatomic, assign) CGFloat fisheyeFactor; // 0...1; slight value recommended such as 0.0001
@property (nonatomic, assign, getter=isMaskDisabled) BOOL maskDisabled;
@property (nonatomic, assign) PHPickerViewStyle pickerViewStyle;
@property (nonatomic, assign) PHPickerViewOrientation pickerViewOrientation;
@property (nonatomic, assign, readonly) CGPoint contentOffset;

/**
 A.k.a. left inset
 */
@property (nonatomic, assign) BOOL centerFirstItem;
@property (nonatomic, assign) BOOL multipleSelection;

/**
 Sets wether to allow mulptipleSelection. paginateScrolling sets if to allign first visible cell to left (only if multipleSelection=YES) and if PHPickerViewStyle = Flat.
 */
-(void)setMutlipleSelection:(BOOL)multipleSelection paginateScrolling:(BOOL)multipleSelectionPaginateScrolling;

- (void)reloadData;
- (void)scrollToItem:(NSUInteger)item animated:(BOOL)animated;
- (void)scrollToItem:(NSUInteger)item animated:(BOOL)animated scrollPosition:(UICollectionViewScrollPosition)scrollPosition;

/**
 Sets items to be selected when cells will be created. Method for setting initial selections. Items is NSArray of NSNumbers
 */
- (void)setInitialItemsSelected:(NSArray *)items;

@end
