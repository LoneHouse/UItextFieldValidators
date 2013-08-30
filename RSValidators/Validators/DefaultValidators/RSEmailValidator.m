//
//  RSEmailValidator.m
//  ValidationTest
//
//  Created by Roman Sidorakin on 29.08.13.
//  Copyright (c) 2013 Roman Sidorakin. All rights reserved.
//

#import "RSEmailValidator.h"

@implementation RSEmailValidator

-(id)init{
	if (self = [super init]) {
		self.failMessage = @"Incorrect email.";
		[self setValue:@"^\\w+@[a-zA-Z_]+?\\.[a-zA-Z]{2,3}$" forKey:@"validationPattern"];
	}
	return self;
}

@end
