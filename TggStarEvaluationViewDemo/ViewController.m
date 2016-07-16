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
    self.tggStarEvaView = [TggStarEvaluationView evaluationViewWithEvaluateViewDidChooseStarBlock:^(NSUInteger count) {
        NSLog(@"\n\n给了铁哥哥：%ld星好评！！!\n\n",count);
        weakSelf.resultLabel.text = [NSString stringWithFormat:@"给了铁哥哥%ld个星星的好评！！！",count];
    }];
    self.tggStarEvaView.frame = (CGRect){self.view.frame.size.width / 2 - 23 * 5,280,23 * 10,45};
    [self.view addSubview:self.tggStarEvaView];
    self.tggStarEvaView.spacing = 0.1;
}



- (IBAction)sliderValueChanged:(UISlider *)sender {
    if (sender.value == 0) {
        sender.value = 0.01;
    }
    self.tggStarEvaView.spacing = sender.value;
}




@end
