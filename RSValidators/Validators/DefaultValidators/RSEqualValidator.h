//
//  RSEqualValidator.h
//  ValidationTest
//
//  Created by Roman Sidorakin on 29.08.13.
//  Copyright (c) 2013 Roman Sidorakin. All rights reserved.
//

#import "Validator.h"

@interface RSEqualValidator : Validator
@property (nonatomic, strong) UITextField *firstTextfield;
@property (nonatomic, strong) UITextField *secondTextfield;

-(id)initWithTextFields: (UITextField *) one secondTextField: (UITextField *) two;
@end
