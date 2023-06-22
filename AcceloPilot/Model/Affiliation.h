//
//  Affiliation.h
//  AcceloPilot
//
//  Created by Kuryliak Maksym on 25.11.2019.
//  Copyright © 2019 Wise-Engineering. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mantle.h"

@interface Affiliation : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSString *affiliationsID;
@property (nonatomic, copy, readonly) NSString *email;
@property (nonatomic, copy, readonly) NSString *mobile;

@end
