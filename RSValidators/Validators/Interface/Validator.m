//
//  Validator.m
//  TextFieldValidation
//
//  Created by Roman Sidorakin on 22.08.13.
//  Copyright (c) 2013 Roman Sidorakin. All rights reserved.
//

#import "Validator.h"
@interface Validator ()
@end

@implementation Validator
- (BOOL)validationResult {
	NSError *error = NULL;
	BOOL validationResult = NO;
	if (self.text != nil) {
		NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:self.validationPattern
		                                                                       options:NSRegularExpressionCaseInsensitive
		                                                                         error:&error];
		NSArray *matches = [regex matchesInString:self.text
		                                  options:0
		                                    range:NSMakeRange(0, [self.text length])];
		if ([matches count] == 1)
			validationResult = YES;
	}
	return validationResult;
}

- (void)showErrorMessage {
	[[[UIAlertView alloc]initWithTitle:@"Error" message:self.failMessage delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
}

@end
