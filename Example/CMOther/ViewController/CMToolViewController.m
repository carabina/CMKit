//
//  CMToolViewController.m
//  CMKit
//
//  Created by HC on 16/10/31.
//  Copyright © 2016年 UTOUU. All rights reserved.
//

#import "CMToolViewController.h"
#import "CMAlterViewSampleController.h"
#import "CMQRCodeSampleController.h"
#import "CMAnimationSampleController.h"
#import "CMImagePickerSampleController.h"
#import "CMCyclePictureSampleController.h"
#import "MJExampleViewController.h"
#import "CMThirdPartyLoginSampleController.h"
#import "MasterViewController.h"
#import "GlobalTimelineViewController.h"
#import "CM3DTouchSampleController.h"
#import "CMCommonSuperClassSampleController.h"
#import "CMNewFeaturesController.h"

#define SourceCode @"SourceCode"

@interface CMToolViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray *toolArray;

//新特性数组
@property (nonatomic, strong) NSArray *featuresArray;


@end

@implementation CMToolViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.初始化数据
    [self initData];
    
    
    //2.创建UI
    [self initUI];
}

#pragma mark - 初始化数据
- (void)initData{
    self.toolArray = @[@{@"name":@"NewFeatures(新特性)",@"classType":[CMNewFeaturesController class]},
                       @{@"name":@"CommonSuperClass(共用父类)",@"classType":[CMCommonSuperClassSampleController class]},
                       @{@"name":@"NetWork(网络请求)",@"classType":[GlobalTimelineViewController class]},
                       @{@"name":@"ImageCache(图片缓存)",@"classType":[MasterViewController class]},
                       @{@"name":@"AlterView(警告框)",@"classType":[CMAlterViewSampleController class]},
                       @{@"name":@"QRCode(二维码/条形码)",@"classType":[CMQRCodeSampleController class]},
                       @{@"name":@"AnimationEffect(动画特效)",@"classType":[CMAnimationSampleController class]},
                       @{@"name":@"MBProgressHUD(提示框)",@"classType":[MBProgressHUD class]},
                       
                       @{@"name":@"Share(分享)",@"classType":@""},
                       @{@"name":@"ImagePicker(相机/相册)",@"classType":[CMImagePickerSampleController class]},
                       @{@"name":@"Refresh(上拉/下拉刷新)",@"classType":[MJExampleViewController class]},
                       @{@"name":@"CyclePicture(无限轮播)",@"classType":[CMCyclePictureSampleController class]},
                       @{@"name":@"ThirdPartyLogin(第三方登录)",@"classType":[CMThirdPartyLoginSampleController class]},
                       @{@"name":@"ThirdPartyStatistics(第三方统计)",@"classType":@""},
                       @{@"name":@"ThirdPartyPay(第三方支付)",@"classType":@""},
                       @{@"name":@"MapKit(地图)",@"classType":@""},
                       @{@"name":@"AudioVideo(音频/视频)",@"classType":@""},
                       @{@"name":@"3D Touch",@"classType":[CM3DTouchSampleController class]},
                       @{@"name":@"IM(及时通讯)",@"classType":@""},
                       @{@"name":@"StoreKit(苹果内购)",@"classType":@""},
                       @{@"name":@"Macro(宏定义)",@"classType":SourceCode},
                       @{@"name":@"Cryptor(数据加密/解密)",@"classType":SourceCode}];
    
    self.featuresArray = @[@"welcome_guide_1_new@2x.png",
                           @"welcome_guide_2_new@2x.png",
                           @"welcome_guide_3_new@2x.png"];
    
}

#pragma mark - 初始化UI
//创建UI
- (void)initUI{
    
    //1.创建TableView
    UITableView *tableView = [UITableView initWithFrame:self.view.bounds style:UITableViewStylePlain cellSeparatorStyle:UITableViewCellSeparatorStyleSingleLine separatorInset:UIEdgeInsetsMake(0, 0, 0, 0) dataSource:self delegate:self];
    [self.view addSubview:tableView];
    
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.toolArray.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *ID = @"ToolViewControllerTableView";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    NSDictionary *dict = self.toolArray[indexPath.row];
    cell.textLabel.text = dict[@"name"];
    
    return cell;

}


#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary *dict = self.toolArray[indexPath.row];
    if (dict) {
        
        if ([dict[@"classType"] isEqual:[MBProgressHUD class]]) {
            [MBProgressHUD showSuccess:@"this is a test"];
            
        }else if([dict[@"classType"] isEqual:@""]){
            [MBProgressHUD showError:@"功能暂未完善"];
            
        }else if([dict[@"classType"] isEqual:SourceCode]){
            [MBProgressHUD showSuccess:@"请移步源码对应的类"];
            
        }else if ([dict[@"classType"] isEqual:[CMNewFeaturesController class]]){
            CMNewFeaturesController *Vc = [[CMNewFeaturesController alloc] init];
            Vc.featuresArray = self.featuresArray;
            [self presentViewController:Vc animated:YES completion:nil];
        }else{
            UIViewController *Vc = [[dict[@"classType"] alloc] init];
            Vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:Vc animated:YES];
        }
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}



@end
