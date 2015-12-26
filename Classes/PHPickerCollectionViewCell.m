//
//  PHCollectionViewCell.m
//  PHPickerView
//
//  Created by Andrzej on 24/11/15.
//  Copyright © 2015 A&A.make LTD. All rights reserved.
//

#import "PHPickerCollectionViewCell.h"

@interface PHPickerCollectionViewCell ()

@end

@implementation PHPickerCollectionViewCell

- (void)initialize
{
    self.layer.doubleSided = NO;
    self.label = [[UILabel alloc] initWithFrame:self.contentView.bounds];
    self.label.backgroundColor = [UIColor clearColor];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.textColor = [UIColor grayColor];
    self.label.numberOfLines = 1;
    self.label.lineBreakMode = NSLineBreakByTruncatingTail;
    self.label.highlightedTextColor = [UIColor blackColor];
    self.label.font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    self.label.autoresizingMask = (UIViewAutoresizingFlexibleTopMargin |
                                   UIViewAutoresizingFlexibleLeftMargin |
                                   UIViewAutoresizingFlexibleBottomMargin |
                                   UIViewAutoresizingFlexibleRightMargin);
    
    [self.contentView addSubview:self.label];
    
    self.imageView = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
    self.imageView.backgroundColor = [UIColor clearColor];
    self.imageView.contentMode = UIViewContentModeCenter;
    self.imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.contentView addSubview:self.imageView];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    
    CATransition *transition = [CATransition animation];
    [transition setType:kCATransitionFade];
    [transition setDuration:0.15];
    [self.label.layer addAnimation:transition forKey:nil];
    
    self.label.font = self.selected ? self.highlightedFont : self.font;
}

//- (void)prepareForReuse
//{
//    self.sel
//}

@end