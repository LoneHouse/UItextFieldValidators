//
//  UIView+Validation.m
//  ValidationTest
//
//  Created by Roman Sidorakin on 30.08.13.
//  Copyright (c) 2013 Roman Sidorakin. All rights reserved.
//

#import "UIView+Validation.h"
#import "UITextField+Validation.h"

@implementation UIView (Validation)

- (BOOL)validateAllFields {
	BOOL isValid = YES;
	for (UIView *subview in self.subviews) {
		if ([subview class] == [UITextField class]) {
			UITextField *subviewTextField = (UITextField *)subview;
			if (![subviewTextField validateContent]) {
				isValid = NO;
				if (subviewTextField.validationMode == ValidationUntillError) {
					break;
				}
			}
		}
	}
	return isValid;
}

- (void)setValidationMode:(enum ValidationMode)mode {
	for (UIView *subview in self.subviews) {
		if ([subview class] == [UITextField class]) {
			UITextField *subviewTextField = (UITextField *)subview;
			[subviewTextField setValidationMode:mode];
		}
	}
}

@end
