//
//  RSCustomValidator.h
//  ValidationTest
//
//  Created by Roman Sidorakin on 30.08.13.
//  Copyright (c) 2013 Roman Sidorakin. All rights reserved.
//

#import "Validator.h"

@interface RSCustomValidator : Validator
- (id)initWithPattern: (NSString *) pattern andFailMessage: (NSString *) message;
@end
