//
//  RSEqualValidator.m
//  ValidationTest
//
//  Created by Roman Sidorakin on 29.08.13.
//  Copyright (c) 2013 Roman Sidorakin. All rights reserved.
//

#import "RSEqualValidator.h"

@implementation RSEqualValidator

-(id)init{
	if (self = [super init]) {
		self.failMessage = @"Text not equal";
		[self setValue:@"^\\w+@[a-zA-Z_]+?\\.[a-zA-Z]{2,3}$" forKey:@"validationPattern"];
	}
	return self;
}

-(id)initWithTextFields: (UITextField *) one secondTextField: (UITextField *) two{
	if (self = [self init]) {
		_firstTextfield = one;
		_secondTextfield = two;
	}
	return self;
}

-(BOOL)validationResult{
	return [self.firstTextfield.text isEqualToString:self.secondTextfield.text];
}

@end
