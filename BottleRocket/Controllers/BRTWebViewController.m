//
//  BRTWebViewController.m
//  BottleRocket
//
//  Created by Fredrick Ohen on 2/3/18.
//  Copyright © 2018 geeoku. All rights reserved.
//

#import "BRTWebViewController.h"

@interface BRTWebViewController ()

@property (nonatomic, weak) IBOutlet UIBarButtonItem *backButton;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *forwardButton;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *refreshButton;


@end

@implementation BRTWebViewController

static NSString * const BOTTLEROCKET_URL = @"https://www.bottlerocketstudios.com/";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupWebView];
    

}

- (void)setupWebView {
   
    UIWebView *webView= [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, 1024,768)];
    NSString *url= BOTTLEROCKET_URL;
    NSURL *NS_URL= [NSURL URLWithString:url];
    NSURLRequest *request=[NSURLRequest requestWithURL:NS_URL];
    webView.frame = self.view.bounds;
    webView.scalesPageToFit = YES;
    [webView loadRequest:request];
    [self.view addSubview:webView];
    
    
    
}


#pragma UIWebViewDelegates


- (void)webViewDidStartLoad:(UIWebView *)webView {
    
}


- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
}

@end
