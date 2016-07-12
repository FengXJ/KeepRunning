//
//  RunningViewController.m
//  KeepRunning
//
//  Created by 冯学杰 on 16/6/7.
//  Copyright © 2016年 冯学杰. All rights reserved.
//


#import "RunningViewController.h"
#import <iflyMSC/IFlySpeechSynthesizer.h>
#import <iflyMSC/IFlySpeechSynthesizerDelegate.h>
#import <BaiduTraceSDK/BaiduTraceSDK-Swift.h>
#import <BaiduMapAPI_Base/BMKBaseComponent.h>//引入base相关所有的头文件
#import <BaiduMapAPI_Map/BMKMapComponent.h>//引入地图功能所有的头文件
#import <BaiduMapAPI_Location/BMKLocationComponent.h>//引入定位功能所有的头文件
#import <BaiduMapAPI_Utils/BMKUtilsComponent.h>//引入计算工具所有的头文件
#import "iflyMSC/IFlyMSC.h"

//全局变量
int const serviceId = 118482; //此处填写在鹰眼管理后台创建的服务的ID
NSString *const AK = @"AGgGd8hyH8IGcbmX53ZHGLUlY3K6F7kE";//此处填写您在API控制台申请得到的ak，该ak必须为iOS类型的ak
NSString *const MCODE = @"https---github.com-FengXJ.KeepRunning";//此处填写您申请iOS类型ak时填写的安全码
double const EPSILON = 0.0001;

@interface RunningViewController ()<ApplicationServiceDelegate,BMKMapViewDelegate,IFlySpeechSynthesizerDelegate,BMKLocationServiceDelegate,ApplicationEntityDelegate>{
    BOOL isOpenRedio;
    IFlySpeechSynthesizer       * _iFlySpeechSynthesizer;
    BMKLocationService* _locService;
}

@property (nonatomic , strong) BMKMapView *mapView;

@property (nonatomic , strong) BTRACE * traceInstance;

@property (nonatomic , strong) RunningHeadView* headView;

@property (nonatomic , strong) UIButton *locBtn;

@end

@implementation RunningViewController

dispatch_queue_t global_queue;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    isOpenRedio = YES;
    _locService = [[BMKLocationService alloc]init];
    _locService.delegate = self;
    [self mapView];
    [self traceInstance];
    [self headView];
    [self createRedio];
//    [self openLocService];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createRedio{

    
    // 创建合成对象，为单例模式
    _iFlySpeechSynthesizer = [IFlySpeechSynthesizer sharedInstance];
    _iFlySpeechSynthesizer.delegate = self;
//    //设置语音合成的参数
//    //语速,取值范围 0~100
//    [_iFlySpeechSynthesizer setParameter:@"0.1" forKey:[IFlySpeechConstant SPEED]];
//    //音量;取值范围 0~100
//    [_iFlySpeechSynthesizer setParameter:@"50" forKey: [IFlySpeechConstant VOLUME]];
//    //发音人,默认为”xiaoyan”;可以设置的参数列表可参考个 性化发音人列表
//    [_iFlySpeechSynthesizer setParameter:@"vixq" forKey: [IFlySpeechConstant VOICE_NAME]];
//    //音频采样率,目前支持的采样率有 16000 和 8000
//    [_iFlySpeechSynthesizer setParameter:@"16000" forKey: [IFlySpeechConstant SAMPLE_RATE]];
//    //启动合成会话
////    [_iFlySpeechSynthesizer startSpeaking: @"3 2 1"];
    
    
}

- (void)onCompleted:(IFlySpeechError *) error{
    
}

-(RunningHeadView *)headView{
    if (!_headView) {
        _headView = [[RunningHeadView alloc]init];
        [self.view addSubview:_headView];
        _headView.sd_layout.topEqualToView(self.view).leftEqualToView(self.view).rightEqualToView(self.view).heightIs(200);
        
        [_headView.backBtn addTarget:self action:@selector(backBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_headView.redioBtn addTarget:self action:@selector(openRedio:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _headView;
}


-(BTRACE *)traceInstance{
    if (!_traceInstance) {
        //使用鹰眼SDK第一步必须先实例化BTRACE对象
        self.traceInstance =[[BTRACE alloc] initWithAk: AK mcode:MCODE serviceId: serviceId entityName: @"1" operationMode: 2];
        _mapView.mapType = BMKMapTypeStandard;
        //开始追踪，异步执行
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            BOOL intervalSetRet = [_traceInstance setInterval:2 packInterval:10];
            [[BTRACEAction shared] startTrace:self trace:_traceInstance];
            
        });
        //视图加载之后就请求实时位置
        [self queryEntityList];
    }
    return _traceInstance;
}

- (void)queryEntityList {
    dispatch_async(global_queue, ^{
        [[BTRACEAction shared] queryEntityList:self serviceId:serviceId entityNames:@"1" columnKey:nil activeTime:0 returnType:0 pageSize:0 pageIndex:0];
    });
}

-(void)onStartTrace:(NSInteger)errNo errMsg:(NSString *)errMsg{
    NSLog(@"startTrace: %@", errMsg);
    NSString* no = [NSString stringWithFormat:@"%ld",(long)errNo];

}
-(BMKMapView *)mapView{
    if (!_mapView) {
        _mapView = [[BMKMapView alloc]init];
        _mapView.delegate = self;
        [_mapView setZoomLevel:17];
        
        [self.view addSubview:_mapView];
        _mapView.sd_layout.topSpaceToView(_headView,0).bottomEqualToView(self.view).leftEqualToView(self.view).rightEqualToView(self.view);
 
        _locBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_locBtn settitle:@"开始定位" titleColor:[UIColor blackColor] font:15 image:nil];
        [_locBtn addTarget:self action:@selector(openLocService) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_locBtn];
        _locBtn.sd_layout.leftSpaceToView(self.view,15).bottomSpaceToView(self.view,15).widthIs(100).heightIs(40);
    }
    return _mapView;
}

-(void)openLocService{
    
    NSLog(@"进入跟随态");
    [_locService startUserLocationService];
    _mapView.userTrackingMode = BMKUserTrackingModeFollow;
    _mapView.showsUserLocation = YES;

}

-(void)viewWillAppear:(BOOL)animated
{
    [_mapView viewWillAppear];
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
    _locService.delegate = self;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
    _locService.delegate = nil;
}

#pragma mark - btn事件

-(void)openRedio:(id)sender{
    if (isOpenRedio) {
        isOpenRedio = NO;
        [_headView.redioBtn settitle:nil titleColor:nil font:0 image:[UIImage imageNamed:@"redio_close"]];
    }else{
        isOpenRedio = YES;
        [_headView.redioBtn settitle:nil titleColor:nil font:0 image:[UIImage imageNamed:@"redio_open"]];
    }
}

-(void)backBtn:(id)sender{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


/**
 *在地图View将要启动定位时，会调用此函数
 *@param mapView 地图View
 */
- (void)willStartLocatingUser
{
    NSLog(@"start locate");
}

/**
 *用户方向更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
    [_mapView updateLocationData:userLocation];
    NSLog(@"heading is %@",userLocation.heading);
}

/**
 *用户位置更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    //    NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
    [_mapView updateLocationData:userLocation];
}

/**
 *在地图View停止定位后，会调用此函数
 *@param mapView 地图View
 */
- (void)didStopLocatingUser
{
    NSLog(@"stop locate");
}

/**
 *定位失败后，会调用此函数
 *@param mapView 地图View
 *@param error 错误号，参考CLError.h中定义的错误号
 */
- (void)didFailToLocateUserWithError:(NSError *)error
{
    NSLog(@"location error");
}

@end

@implementation RunningHeadView

-(id)init{
    if (self = [super init]) {
        self.backgroundColor = LCHexColor(0x393940);
        
        self.backBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.backBtn settitle:nil titleColor:nil font:0 image:[UIImage imageNamed:@"back"]];
        [self addSubview:_backBtn];
        self.backBtn.sd_layout.leftSpaceToView(self,5).heightIs(44).topSpaceToView(self,20).widthIs(44);
        
        self.redioBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.redioBtn settitle:nil titleColor:nil font:9 image:[UIImage imageNamed:@"redio_open"]];
        [self addSubview:self.redioBtn];
        self.redioBtn.sd_layout.rightSpaceToView(self,5).heightIs(44).topSpaceToView(self,20).widthIs(44);
    }
    return self;
}

@end
