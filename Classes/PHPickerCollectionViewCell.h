//
//  PHCollectionViewCell.h
//  PHPickerView
//
//  Created by Andrzej on 24/11/15.
//  Copyright © 2015 A&A.make LTD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PHRoundedButton.h"


@interface PHPickerCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) PHRoundedButton *roundedButton;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) UIFont *highlightedFont;

@property (nonatomic, assign) BOOL useRoundedButton;
@property (nonatomic, assign) CGFloat interitemSpacing;
@property (nonatomic, assign) CGSize roundedButtonSize;

@property (nonatomic, assign) CGSize margin;

@end