//
//  ViewController.m
//  StorkTest
//
//  Created by Josh Holtz on 6/7/14.
//  Copyright (c) 2014 Stork. All rights reserved.
//

#import "ViewController.h"

#import <Stork/Stork.h>
#import <Stork/STKLoaderViewController.h>

@interface ViewController ()

@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) STKLoaderViewController *stkLoaderViewController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
    // Adding webview to our view controller for Stork to use
    self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.webView];
    
    // Initialize Stork - configuring bond options
    [[Stork sharedClient] prepareBondWithProjectToken:@"03d413312404f36f6b5e8b4defd69b8c" withVersion:@"0.0.0"];
    [[Stork sharedClient] prepareBondWithWebView:self.webView];
    
    // OPTIONAL - Use this fancy view controller to show loading status
    self.stkLoaderViewController = [STKLoaderViewController addToViewController:self withStork:[Stork sharedClient]];
    [[Stork sharedClient] setDelegate:self.stkLoaderViewController];
    
    // Finalize the Stork bond
    [[Stork sharedClient] bond];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
