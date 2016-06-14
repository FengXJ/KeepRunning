//
//  ReadyViewController.m
//  KeepRunning
//
//  Created by 冯学杰 on 16/6/8.
//  Copyright © 2016年 冯学杰. All rights reserved.
//

#import "ReadyViewController.h"
#import "RunningViewController.h"
#import <iflyMSC/IFlySpeechSynthesizer.h>
#import <iflyMSC/IFlySpeechSynthesizerDelegate.h>
#import "iflyMSC/IFlyMSC.h"

@interface ReadyViewController ()<IFlySpeechSynthesizerDelegate>{
    IFlySpeechSynthesizer       * _iFlySpeechSynthesizer;
}

@property (assign, nonatomic) NSInteger timeCount;//倒计时

@property (strong , nonatomic) UILabel *numberLabel;//倒计时Label

@end

@implementation ReadyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    [self numberLabel];
     _timeCount = 2;
    [self createRedio];

}

-(void)viewWillAppear:(BOOL)animated{
    
   
}

-(UILabel *)numberLabel{
    if (!_numberLabel) {
        _numberLabel = [[UILabel alloc]init];
        _numberLabel.textColor = [UIColor whiteColor];
        _numberLabel.text = @"3";
        _numberLabel.font = [LCFont systemFontOfSize:100];
        [self.view addSubview:_numberLabel];
        _numberLabel.sd_layout.centerXEqualToView(self.view).centerYEqualToView(self.view).heightIs(100);
        [_numberLabel setSingleLineAutoResizeWithMaxWidth:320];

    }
    return _numberLabel;
}

-(void)createRedio{
    
    
    // 创建合成对象，为单例模式
    _iFlySpeechSynthesizer = [IFlySpeechSynthesizer sharedInstance];
    _iFlySpeechSynthesizer.delegate = self;
    //设置语音合成的参数
    //语速,取值范围 0~100
    [_iFlySpeechSynthesizer setParameter:@"50" forKey:[IFlySpeechConstant SPEED]];
    //音量;取值范围 0~100
    [_iFlySpeechSynthesizer setParameter:@"50" forKey: [IFlySpeechConstant VOLUME]];
    //发音人,默认为”xiaoyan”;可以设置的参数列表可参考个 性化发音人列表
    [_iFlySpeechSynthesizer setParameter:@"vixq" forKey: [IFlySpeechConstant VOICE_NAME]];
    //音频采样率,目前支持的采样率有 16000 和 8000
    [_iFlySpeechSynthesizer setParameter:@"16000" forKey: [IFlySpeechConstant SAMPLE_RATE]];
    
    [_iFlySpeechSynthesizer startSpeaking: @"3"];
   
}

- (void)onCompleted:(IFlySpeechError *) error{
    
    if (_timeCount == 0) {
        [_iFlySpeechSynthesizer startSpeaking: @"开始跑步！"];
        RunningViewController *runningVC = [[RunningViewController alloc]init];
        [self.navigationController pushViewController:runningVC animated:YES];
    }else{
        
        _numberLabel.text = [NSString stringWithFormat:@"%ld",_timeCount];
        [_iFlySpeechSynthesizer startSpeaking: [NSString stringWithFormat:@"%ld",_timeCount]];

    }
    
    _timeCount--;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
