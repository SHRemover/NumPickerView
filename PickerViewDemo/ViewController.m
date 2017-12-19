//
//  ViewController.m
//  PickerViewDemo
//
//  Created by gs_sh on 2017/12/19.
//  Copyright © 2017年 Remover. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDelegate, UIPickerViewDataSource>
{
    CGFloat index;
}
@property (retain, nonatomic) NSMutableArray *numData;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _numData = [NSMutableArray arrayWithCapacity:1000];
    CGFloat min = 95;
    CGFloat max = 105;
    for (CGFloat value = min; value <= max; value+=0.1) {
        [_numData addObject:[NSString stringWithFormat:@"%.1f", value]];
    }
    
    [_numData enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ([obj isEqualToString:@"103.6"]) {
            index = idx;
            *stop = YES;
        } else {
            index = 0;
        }
    }];
    
    UIPickerView *pickView = [[UIPickerView alloc]initWithFrame:CGRectMake(100, 200, 200, 160)];
    pickView.backgroundColor = [UIColor blackColor];
    pickView.alpha = 0.6;
    pickView.delegate = self;
    pickView.dataSource = self;
    pickView.showsSelectionIndicator = YES;
    [pickView selectRow:index inComponent:0 animated:NO];
    
    [self.view addSubview:pickView];
}

#pragma mark - UIPickerViewDataSource

// 返回多少列
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// 返回每列的行数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return _numData.count;
}


#pragma mark - UIPickerViewDelegate

// 反回pickerView的宽度
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component __TVOS_PROHIBITED {
    return 150;
}

// 返回pickerView的高度
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component __TVOS_PROHIBITED {
    return 50;
}

// 返回pickerView 每行的内容
//- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component __TVOS_PROHIBITED {
//
//    return _numData[row];
//}

//- (nullable NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component {
////    @{NSFontAttributeName: font}
//
//    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:_numData[row]];
//    [attStr addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, attStr.length)];
//    [attStr addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:55.0] range:NSMakeRange(0, attStr.length)];
//
////    NSAttributedString *attStr = [[NSAttributedString alloc] initWithString:_numData[row] attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont boldSystemFontOfSize:32.0]}];
//
////    [NSAttributedString alloc] in
//
//    return attStr;
//}

// 返回pickerView 每行的view
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view __TVOS_PROHIBITED {

    UILabel *myView = nil;
    
    myView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 180, 30)];
    
    myView.text = _numData[row];
    
    myView.textAlignment = NSTextAlignmentCenter;
    
    myView.font = [UIFont boldSystemFontOfSize:32.0];
    
    myView.textColor = [UIColor whiteColor];
    
//    myView.backgroundColor = [UIColor cyanColor];
    
    return myView;
}

// 选中行
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component __TVOS_PROHIBITED {

    NSLog(@"%@", _numData[row]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
