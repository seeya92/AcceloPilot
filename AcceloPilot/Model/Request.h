//
//  Request.h
//  AcceloPilot
//
//  Created by Kuryliak Maksym on 25.11.2019.
//  Copyright © 2019 Wise-Engineering. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response.h"
#import "Meta.h"
#import "Mantle.h"

@interface Request : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy, readonly) Meta *meta;
@property (nonatomic, copy, readonly) Response *response;

@end
