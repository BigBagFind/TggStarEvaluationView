#  TggStarEvaluationView 5星评价视图，你可以随便给出星星评价，指哪打哪。
## 功能：
###  1.用于5星手动点击评价
###  2.用于5星评价展示
## 如何添加到工程
### 1. 直接把TggStarEvaluationView文件夹拖进去
## 使用方法:
### 1.自己看Demo
### 2.0.import "TggStarEvaluationView"
### 2.1.复制下面的代码
    // 注意weakSelf
    __weak __typeof(self)weakSelf = self;
    // 初始化
    self.tggStarEvaView = [TggStarEvaluationView evaluationViewWithChooseStarBlock:^(NSUInteger count) {
        // 做评星后点处理
        [weakSelf something];
    }];
    self.tggStarEvaView.frame = (CGRect){self.view.frame.size.width / 2 - 23 * 5,280,23 * 10,45};
    [self.view addSubview:self.tggStarEvaView];

    // 设置展示的星星数量
    // self.tggStarEvaView.starCount = 3;
    
    // 星星之间的间距，默认0.5
    // self.tggStarEvaView.spacing = 0.5;
    
    // 星星的点击事件使能,默认YES
    // self.tggStarEvaView.tapEnabled = NO;

## 效果gif如下，请等待加载👇👇👇
![image](https://github.com/BigBagFind/TggStarEvaluationViewDemo/raw/master/ScreenShots/starViewAnimation.gif)


    
