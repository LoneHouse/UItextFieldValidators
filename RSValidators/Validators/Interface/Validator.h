//
//  Validator.h
//  TextFieldValidation
//
//  Created by Roman Sidorakin on 22.08.13.
//  Copyright (c) 2013 Roman Sidorakin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Validator : NSObject
- (BOOL) validationResult;
- (void) showErrorMessage;

@property (nonatomic, strong) NSString *failMessage;
@property (nonatomic, strong, readonly) NSString *validationPattern;
@property (nonatomic, strong) NSString *text;
@end
