//
//  RSViewController.h
//  ValidationTest
//
//  Created by Roman Sidorakin on 26.08.13.
//  Copyright (c) 2013 Roman Sidorakin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RSViewController : UIViewController

- (IBAction)registerAction:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *nameField;
@property (strong, nonatomic) IBOutlet UITextField *emailField;
@property (strong, nonatomic) IBOutlet UITextField *passwdField;
@property (strong, nonatomic) IBOutlet UITextField *retypePasswdField;
@end
