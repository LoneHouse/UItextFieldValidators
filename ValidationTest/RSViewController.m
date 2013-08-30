//
//  RSViewController.m
//  ValidationTest
//
//  Created by Roman Sidorakin on 26.08.13.
//  Copyright (c) 2013 Roman Sidorakin. All rights reserved.
//

#import "RSViewController.h"
#import "RSValidators.h"

@interface RSViewController ()

@end

@implementation RSViewController

- (void)viewDidLoad
{
	[super viewDidLoad];

	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated{
	[self.view setValidationMode:ValidationAll];
	[self.nameField addContentValidator:[[RSEmptyValidator alloc]init]];
	[self.nameField addContentValidator:[[RSCustomValidator alloc]initWithPattern:@"^(?=.*[a-z])\\w{7,15}\\s*$" andFailMessage:@"Only symbols allowed, not numbers! Length must be 7-15 symbols."]];
	
	[self.emailField addContentValidator:[[RSEmptyValidator alloc]init]];
	[self.emailField addContentValidator:[[RSEmailValidator alloc]init]];
	
	[self.passwdField addContentValidator:[[RSEmptyValidator alloc]init]];
	
	[self.retypePasswdField addContentValidator:[[RSEmptyValidator alloc]init]];
	[self.retypePasswdField addContentValidator:[[RSEqualValidator alloc]initWithTextFields:self.passwdField secondTextField:self.retypePasswdField]];
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (IBAction)registerAction:(id)sender {
	BOOL result = [self.view validateAllFields];
	
	if (result) {
		[[[UIAlertView alloc]initWithTitle:@"Success!!!" message:@"Registration completed!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
	}
}

@end
