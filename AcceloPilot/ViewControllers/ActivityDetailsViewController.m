//
//  ActivityDetailsViewController.m
//  AcceloPilot
//
//  Created by Kuryliak Maksym on 27.11.2019.
//  Copyright © 2019 Wise-Engineering. All rights reserved.
//

#import "ActivityDetailsViewController.h"

@interface ActivityDetailsViewController ()

@end

@implementation ActivityDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge];
    _activityIndicator.frame = CGRectMake(self.view.center.x, self.view.center.y, 0, 0);
    [self getActivityDetails:self.activity.activityID];
}

- (void)getActivityDetails:(NSString *)activityID {
    [_activityIndicator startAnimating];
    [self.view addSubview:_activityIndicator];
    self.authorLabel.hidden = YES;
    self.subjectLabel.hidden = YES;
    self.dateLabel.hidden = YES;
    [[APIManager sharedManager] GET:[NSString stringWithFormat:@"%@%@?_fields=id,html_body,interacts", kActivityDetails, activityID]
                         parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                            [self->_activityIndicator stopAnimating];
                            [self->_activityIndicator removeFromSuperview];
                            NSString *htmlBody = [[responseObject objectForKey:@"response"] objectForKey:@"html_body"];
                            self.authorLabel.hidden = NO;
                            self.subjectLabel.hidden = NO;
                            self.dateLabel.hidden = NO;
                            [self setupData:htmlBody];
                            /// if API request to accelo is successful - try to upload activities if any
                            SavingManager *savingManager = [[SavingManager alloc] init];
                            [savingManager uploadActivity];
                        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                            NSLog(@"%@", error);
                            [self->_activityIndicator stopAnimating];
                            [self->_activityIndicator removeFromSuperview];
                        }];
}

- (void)setupData:(NSString *)htmlBody {
    Interact *fromInteract;
    for (int i = 0; i < self.activity.interacts.count; i++) {
        Interact *interact = self.activity.interacts[i];
        if ([interact.type isEqualToString:@"from"]) {
            fromInteract = interact;
        }
    }
    self.authorLabel.text = fromInteract.ownerName;
    self.subjectLabel.text = self.activity.subject;
    ConvertTime *convertTime = [[ConvertTime alloc] init];
    self.dateLabel.text = [convertTime convertTimestampToString:[self.activity.dateLogged doubleValue]];
    NSString *htmlString = htmlBody;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]
                                                   initWithData:[htmlString dataUsingEncoding:NSUnicodeStringEncoding]
                                                   options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType }
                                                   documentAttributes:nil error:nil];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16]
                             range:NSMakeRange(0, attributedString.length)];
    self.activityBodyTextView.text = @"";
    self.activityBodyTextView.attributedText = attributedString;
    self.activityBodyTextView.textAlignment = NSTextAlignmentJustified;
}

@end
