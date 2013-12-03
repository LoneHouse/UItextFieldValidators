//
//  UITextField+Validation.m
//  TextFieldValidation
//
//  Created by Roman Sidorakin on 22.08.13.
//  Copyright (c) 2013 Roman Sidorakin. All rights reserved.
//

#import "UITextField+Validation.h"
#import "objc/runtime.h"

#define attentionViewWidth 26
#define validatorsListTag "validatorsList"
#define tempFailedValidatorsTag "tempFailedValidators"
#define hintVCTag "hintVC"

@implementation UITextField (Validation)
@dynamic validatorsList, tempFailedValidators, hintVC;

enum ValidationMode _validationMode;

#pragma mark - Properties
- (NSMutableSet *)validatorsList {
	return objc_getAssociatedObject(self, validatorsListTag);
}

- (void)setValidatorsList:(NSMutableSet *)list {
	objc_setAssociatedObject(self, validatorsListTag, list, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableSet *)tempFailedValidators {
	return objc_getAssociatedObject(self, tempFailedValidatorsTag);
}

- (void)setTempFailedValidators:(NSMutableSet *)tempList {
	objc_setAssociatedObject(self, tempFailedValidatorsTag, tempList, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (enum ValidationMode)validationMode {
	return _validationMode;
}

- (void)setValidationMode:(enum ValidationMode)mode {
	_validationMode = mode;
}

- (RSHintViewController *)hintVC {
	return objc_getAssociatedObject(self, hintVCTag);
}

- (void)setHintVC:(RSHintViewController *)controller {
	objc_setAssociatedObject(self, hintVCTag, controller, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma init methods
//swizzing
+ (void)initialize {
	[self swizzingUp];
}

+ (void)swizzingUp {
	method_exchangeImplementations(class_getInstanceMethod(self, @selector(initWithFrame:)), class_getInstanceMethod(self, @selector(initValuesByDefaultsWithFrame:)));
	method_exchangeImplementations(class_getInstanceMethod(self, @selector(initWithCoder:)), class_getInstanceMethod(self, @selector(initValuesByDefaultsWithCoder:)));
}

+ (void)swizzingDown {
	method_exchangeImplementations(class_getInstanceMethod(self, @selector(initValuesByDefaultsWithFrame)), class_getInstanceMethod(self, @selector(initWithFrame:)));
	method_exchangeImplementations(class_getInstanceMethod(self, @selector(initValuesByDefaultsWithCoder:)), class_getInstanceMethod(self, @selector(initWithCoder:)));
}

//init properties and variables
- (id)initValuesByDefaultsWithCoder:(NSCoder *)aDecoder {
	[UITextField swizzingDown];
	if (self = [self initWithCoder:aDecoder]) {
		[self initValuesByDefaults];
	}
	return self;
}

- (id)initValuesByDefaultsWithFrame:(CGRect)frame {
	[UITextField swizzingDown];
	if (self = [self initWithFrame:frame]) {
		[self initValuesByDefaults];
	}
	return self;
}

- (void)initValuesByDefaults {
	self.validationMode = ValidationUntillError;
	self.validatorsList = [[NSMutableSet alloc]init];
	self.tempFailedValidators = [[NSMutableSet alloc]init];
	[UITextField swizzingUp];
}

#pragma mark - Functionality
- (BOOL)validateContent {
	[self showErrorIndicator:NO];
	[self.tempFailedValidators removeAllObjects];
	
	BOOL isContentValid = YES;
	if ([self.validatorsList count]) {
		for (Validator *validator in self.validatorsList) {
			validator.text = self.text;
			if (![validator validationResult]) {
				isContentValid = NO;
				[self.tempFailedValidators addObject:validator];
				
				if (self.validationMode == ValidationUntillError) {
					[self showHintFithFailedValidator:validator];
					break;
				}
			}
		}
		if (!isContentValid) {
			[self showErrorIndicator:YES];
		}
	}
	return isContentValid;
}

- (void)addContentValidator:(Validator *)validator {
	if (validator) {
		[self.validatorsList addObject:validator];
	}
}

- (void)cleanContentValidatorsList {
	[self.validatorsList removeAllObjects];
}

#pragma mark show hints
//for ValidationUntillError mode
- (void)showHintFithFailedValidator:(Validator *)validator {
	[validator showErrorMessage];
}

//for ValidationAll mode only
- (void)showHintFithFailedValidators:(NSSet *)validators {
	self.hintVC = [[RSHintViewController alloc]initWithNibName:@"RSHintViewController" bundle:[NSBundle mainBundle]];
	self.hintVC.failedValidators = self.tempFailedValidators;
	[self.hintVC showAnimatedFromView:self.superview];
}

- (void)showErrorIndicator:(BOOL)state {
	if (state) {
		self.rightViewMode = UITextFieldViewModeAlways;
		UIButton *errorButton = [UIButton buttonWithType:UIButtonTypeCustom];
		[errorButton addTarget:self action:@selector(touchUpInsideErrorIndicator) forControlEvents:UIControlEventTouchUpInside];
		[errorButton setImage:[UIImage imageNamed:@"ValidationError.png"] forState:UIControlStateNormal];
		[errorButton setFrame:CGRectMake(0, 0, attentionViewWidth, attentionViewWidth)];
		self.rightView = errorButton;
	}
	else {
		self.rightViewMode = UITextFieldViewModeNever;
		self.rightView = nil;
	}
}

//touch on indicator
- (void)touchUpInsideErrorIndicator {
	self.validationMode == ValidationAll ? [self showHintFithFailedValidators:self.tempFailedValidators] : [self showHintFithFailedValidator:[self.tempFailedValidators anyObject]];
}

@end
