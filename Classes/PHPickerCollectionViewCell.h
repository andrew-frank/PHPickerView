//
//  PHCollectionViewCell.h
//  PHPickerView
//
//  Created by Andrzej on 24/11/15.
//  Copyright © 2015 A&A.make LTD. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PHPickerCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) UIFont *highlightedFont;

@end