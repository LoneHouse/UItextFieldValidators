//
//  RSCustomValidator.m
//  ValidationTest
//
//  Created by Roman Sidorakin on 30.08.13.
//  Copyright (c) 2013 Roman Sidorakin. All rights reserved.
//

#import "RSCustomValidator.h"

@implementation RSCustomValidator

- (id)initWithPattern: (NSString *) pattern andFailMessage: (NSString *) message{
	
	if (self = [super init]) {
		self.failMessage = message;
		[self setValue:pattern forKey:@"validationPattern"];
	}
	return self;
}

@end
