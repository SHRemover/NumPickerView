//
//  NumPickerView.m
//  PickerViewDemo
//
//  Created by gs_sh on 2017/12/19.
//  Copyright © 2017年 Remover. All rights reserved.
//

#import "NumPickerView.h"

@interface NumPickerView ()<UIPickerViewDelegate, UIPickerViewDataSource>
{
    CGFloat minValue;
    CGFloat maxValue;
}
@property (retain, nonatomic) NSMutableArray *numData;

@end

@implementation NumPickerView

- (void)defaultValue {
    minValue = 85;
    maxValue = 110;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configView];
    }
    return self;
}

- (void)configView {
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
