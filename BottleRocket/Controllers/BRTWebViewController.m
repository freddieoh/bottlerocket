//
//  BRTWebViewController.m
//  BottleRocket
//
//  Created by Fredrick Ohen on 2/3/18.
//  Copyright © 2018 geeoku. All rights reserved.
//

#import "BRTWebViewController.h"

@interface BRTWebViewController ()

@end

@implementation BRTWebViewController

static NSString * const bottleRocketURL = @"https://www.bottlerocketstudios.com/";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupWebView];

}


- (void)setupWebView {
   
    UIWebView *webView= [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, 1024,768)];
    NSString *url= bottleRocketURL;
    NSURL *nsURL= [NSURL URLWithString:url];
    NSURLRequest *request=[NSURLRequest requestWithURL:nsURL];
    webView.frame = self.view.bounds;
    [webView loadRequest:request];
    [self.view addSubview:webView];
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
