//
//  HoroscopeAgreementViewController.m
//  Constellation-labeling
//
//  Created by NGE on 2018/12/28.
//  Copyright © 2018年 FYD. All rights reserved.
//

#import "HoroscopeAgreementViewController.h"
#import <WebKit/WebKit.h>
@interface HoroscopeAgreementViewController ()
<WKNavigationDelegate,WKUIDelegate>

@property (nonatomic, strong)WKWebView *horoscopeWebView;

@property (nonatomic, strong)UIBarButtonItem *backItem;

@end

@implementation HoroscopeAgreementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addHoroscopeBack];
    [self horoscopeAgreementWebView];
}
- (void)addHoroscopeBack{
    UIButton *backBtn = [[UIButton alloc]init];
    [self.view addSubview:backBtn];
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(40);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(30);
    }];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"horoscopeback"] forState:UIControlStateNormal];
    backBtn.tintColor = [UIColor blackColor];
    [backBtn addTarget:self action:@selector(backItemClick) forControlEvents:UIControlEventTouchUpInside];
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}
- (void)backItemClick{
    [self dismissViewControllerAnimated:YES completion:nil];
//    [self.navigationController popViewControllerAnimated:YES];
}
- (void)horoscopeAgreementWebView{
    self.horoscopeWebView = [[WKWebView alloc] init];
    [self.view addSubview:self.horoscopeWebView];
    [self.horoscopeWebView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(75);
        make.left.right.bottom.mas_equalTo(0);
    }];
  
//    self.horoscopeWebView.backgroundColor = [UIColor redColor];
    [self.horoscopeWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.horoscopeAgreementurlStr]]];
    
    self.horoscopeWebView.navigationDelegate = self;
    self.horoscopeWebView.UIDelegate = self;
    //开了支持滑动返回
    self.horoscopeWebView.allowsBackForwardNavigationGestures = YES;
    
  
   
}

-(void)backNative{
    //判断是否有上一层H5页面
    if ([self.horoscopeWebView canGoBack]) {
        //如果有则返回
        [self.horoscopeWebView goBack];
        //同时设置返回按钮和关闭按钮为导航栏左边的按钮

    }
//    [self.navigationController popViewControllerAnimated:YES];
//    [self dismissViewControllerAnimated:YES completion:nil];
}


// 页面开始加载时调用
-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    
    [self showBusyInView:self.view];
}
// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    
}
// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{//这里修改导航栏的标题，动态改变
    [self hideProgressInView:self.view];
//    self.title = webView.title;
}
// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation{
    
}
// 接收到服务器跳转请求之后再执行
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation{
    
}
// 在收到响应后，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
    
    NSLog(@"%@",webView);
    NSLog(@"%@",navigationResponse);
    
    WKNavigationResponsePolicy actionPolicy = WKNavigationResponsePolicyAllow;
    //这句是必须加上的，不然会异常
    decisionHandler(actionPolicy);
    
}
// 在发送请求之前，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    
//    self.title = webView.title;
    
    WKNavigationActionPolicy actionPolicy = WKNavigationActionPolicyAllow;
    
    
    if (navigationAction.navigationType==WKNavigationTypeBackForward) {
        if (webView.backForwardList.backList.count == 0) { //得到栈里面的list
            
            [self backItemClick];
            
        }
    }
    //这句是必须加上的，不然会异常
    decisionHandler(actionPolicy);
}


@end
