//
//  RSEmptyValidator.m
//  ValidationTest
//
//  Created by Roman Sidorakin on 29.08.13.
//  Copyright (c) 2013 Roman Sidorakin. All rights reserved.
//

#import "RSEmptyValidator.h"

@implementation RSEmptyValidator

-(id)init{
	if (self = [super init]) {
		self.failMessage = @"Field is empty.";
	}
	return self;
}

-(BOOL)validationResult{
	BOOL isValid = YES;
	if (!self.text || ![self.text length] || [self.text class] == [NSNull class]) {
		isValid = NO;
	}
	return isValid;
}
@end
