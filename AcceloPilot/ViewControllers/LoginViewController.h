//
//  ViewController.h
//  AcceloPilot
//
//  Created by Kuryliak Maksym on 20.11.2019.
//  Copyright © 2019 Wise-Engineering. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import "ActivityViewController.h"
#import "APIManager.h"
#import "Constants.h"

@interface LoginViewController : UIViewController <WKNavigationDelegate>

@property(strong,nonatomic) WKWebView *webView;
@property(strong, nonatomic) NSString *authURL;

@end

