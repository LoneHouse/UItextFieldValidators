//
//  UIView+Validation.h
//  ValidationTest
//
//  Created by Roman Sidorakin on 30.08.13.
//  Copyright (c) 2013 Roman Sidorakin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITextField+Validation.h"

@interface UIView (Validation)

- (BOOL) validateAllFields;
- (void) setValidationMode: (enum ValidationMode) mode;
@end
