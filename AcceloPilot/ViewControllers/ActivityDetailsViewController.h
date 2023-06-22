//
//  ActivityDetailsViewController.h
//  AcceloPilot
//
//  Created by Kuryliak Maksym on 27.11.2019.
//  Copyright © 2019 Wise-Engineering. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Activity.h"
#import "APIManager.h"
#import "ConvertTime.h"
#import "Constants.h"
#import "SavingManager.h"

@interface ActivityDetailsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *subjectLabel;
@property (weak, nonatomic) IBOutlet UITextView *activityBodyTextView;
@property(nonatomic, strong) UIActivityIndicatorView *activityIndicator;

@property(strong, nonatomic) Activity *activity;

@end
