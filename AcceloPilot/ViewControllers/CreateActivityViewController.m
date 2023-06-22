//
//  CreateActivityViewController.m
//  AcceloPilot
//
//  Created by Kuryliak Maksym on 02.12.2019.
//  Copyright © 2019 Wise-Engineering. All rights reserved.
//

#import "CreateActivityViewController.h"

@interface CreateActivityViewController ()

@property (weak, nonatomic) IBOutlet UIButton *sendButton;
@property (weak, nonatomic) IBOutlet UITextField *subjectTextField;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextView;

@end

@implementation CreateActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTextView];
    [self sendButtonTapped];
}

- (void)setupTextView {
    [self.bodyTextView.layer setBorderColor:[[[UIColor lightGrayColor] colorWithAlphaComponent:0.2] CGColor]];
    [self.bodyTextView.layer setBorderWidth:1.0];
    self.bodyTextView.layer.cornerRadius = 5;
    self.bodyTextView.clipsToBounds = YES;
}

- (void)sendButtonTapped {
    self.sendButton.rac_command = [[RACCommand alloc] initWithSignalBlock:^(id _) {
        [self createActivity];
        return [RACSignal empty];
    }];
}

- (void)createActivity {
    BOOL network = [self currentNetworkStatus];
    if ([self.subjectTextField hasText]) {
        ActivityToSave *activity = [[ActivityToSave alloc] initWithSubject:self.subjectTextField.text
        andBody:self.bodyTextView.text];
        if (network) {
            NSDictionary *params = [activity toDictionary];
            
            [[APIManager sharedManager] POST:kCreateActivity parameters:params progress:nil
            success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSLog(@"%@", responseObject);
                Request *request = [MTLJSONAdapter modelOfClass:Request.class fromJSONDictionary:responseObject error:nil];
                if ([request.meta.status isEqualToString:@"ok"]) {
                    [self presentAlertController:@"Activity added successfully" andMessage:@"" andSuccess:YES];
                }
                /// if API request to accelo is successful - try to upload activities if any
                SavingManager *savingManager = [[SavingManager alloc] init];
                [savingManager uploadActivity];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [self presentAlertController:error.localizedDescription andMessage:@"" andSuccess:NO];
            }];
        } else {
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"No internet connection, unable to submit the activity."
                                       message:@"Do you want to retry now?"
                                       preferredStyle:UIAlertControllerStyleAlert];

            UIAlertAction* retryAction = [UIAlertAction actionWithTitle:@"Retry Now" style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction * action) {
                [self createActivity];
            }];
            UIAlertAction *submitLaterAction = [UIAlertAction actionWithTitle:@"Submit Later" style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction *action) {
                [self saveActivity:activity];
                [self.navigationController popViewControllerAnimated:YES];
            }];
            [alert addAction:retryAction];
            [alert addAction:submitLaterAction];
            [self presentViewController:alert animated:YES completion:nil];
        }
    } else {
        [self presentAlertController:@"Please enter acitvity subject" andMessage:@"" andSuccess:NO];
    }
}

- (void)saveActivity:(ActivityToSave *)activity {
    //Save activity object with activities number +1 for every activity present in the disk to keep delivery order.
    
    RLMResults<ActivityToSave *> *activities = [ActivityToSave allObjects];
    activity.activityNumber = @([activities count] + 1).stringValue;
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addObject:activity];
    }];
}


-(void)presentAlertController:(NSString *)title andMessage:(NSString *)message andSuccess:(BOOL)success {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title
                               message:message
                               preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action) {
        if (success) {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }];
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (BOOL)currentNetworkStatus {
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [reachability currentReachabilityStatus];
    return networkStatus != NotReachable;
}

@end
