//
//  ViewController.m
//  TggStarEvaluationViewDemo
//
//  Created by 铁拳科技 on 16/7/16.
//  Copyright © 2016年 铁拳科技. All rights reserved.
//

#import "ViewController.h"
#import "TggStarEvaluationView.h"

@interface ViewController ()


@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@property (weak ,nonatomic) TggStarEvaluationView *tggStarEvaView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 注意weakSelf
    __weak __typeof(self)weakSelf = self;
    // 初始化
    self.tggStarEvaView = [TggStarEvaluationView evaluationViewWithChooseStarBlock:^(NSUInteger count) {
        NSLog(@"\n\n给了铁哥哥：%ld星好评！！!\n\n",count);
        weakSelf.resultLabel.text = [NSString stringWithFormat:@"给了铁哥哥%ld个星星的好评！！！",count];
    }];
    self.tggStarEvaView.frame = (CGRect){self.view.frame.size.width / 2 - 23 * 5,320,23 * 10,45};
    [self.view addSubview:self.tggStarEvaView];
    
    // 设置展示的星星数量
    // self.tggStarEvaView.starCount = 3;
    
    // 星星之间的间距，默认0.5
    // self.tggStarEvaView.spacing = 0.5;
    
    // 星星的点击事件使能,默认YES
    // self.tggStarEvaView.tapEnabled = NO;
    
    // 下面这个不带回调，就不会打印了
    TggStarEvaluationView *tggStarEvaView1 = [TggStarEvaluationView evaluationViewWithChooseStarBlock:nil];
    tggStarEvaView1.frame = (CGRect){self.view.frame.size.width / 2 - 23 * 5,320 + 50,23 * 10,45};
    [self.view addSubview:tggStarEvaView1];
    
}



- (IBAction)sliderValueChanged:(UISlider *)sender {
    if (sender.value == 0) {
        sender.value = 0.01;
    }
    self.tggStarEvaView.spacing = sender.value;
}


- (IBAction)segControlValueChanged:(UISegmentedControl *)sender {
    NSUInteger index = sender.selectedSegmentIndex;
    self.tggStarEvaView.starCount = ++index;
}


- (IBAction)switchValueChanged:(UISwitch *)sender {
    self.tggStarEvaView.tapEnabled = sender.on;
}


@end
