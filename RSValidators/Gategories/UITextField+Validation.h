//
//  UITextField+Validation.h
//  TextFieldValidation
//
//  Created by Roman Sidorakin on 22.08.13.
//  Copyright (c) 2013 Roman Sidorakin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Validator.h"
#import "RSHintViewController.h"

enum ValidationMode {
	ValidationUntillError = 0,
	ValidationAll = 1
};

@interface UITextField (Validation)
@property (nonatomic, strong) NSMutableSet * validatorsList;
@property (nonatomic, strong) NSMutableSet * tempFailedValidators;
@property (nonatomic, strong) RSHintViewController *hintVC;


//add content validator to validators list
- (void) addContentValidator:(Validator *) validator;
//clean validators list
- (void) cleanContentValidatorsList;
//initiates checking content
- (BOOL) validateContent;

//getters and setters
- (void) setValidationMode: (enum ValidationMode) validationMode;
- (enum ValidationMode) validationMode;
@end
