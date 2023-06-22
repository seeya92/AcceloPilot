//
//  APIManager.h
//  AcceloPilot
//
//  Created by Kuryliak Maksym on 20.11.2019.
//  Copyright © 2019 Wise-Engineering. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface APIManager : AFHTTPSessionManager

- (void)setCredentialsToHeader:(NSString *)credentials;
- (void)setAuthorizationToken:(NSString *)token;

+ (APIManager *)sharedManager;

@end
