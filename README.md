UItextFieldValidators
=====================

iOS validators for UITExtField controll. Simple to use and simplify your work with registration forms.

#How to use:#


1) Add RSValidators folder into your project.

2) Import RSValidators.h in your controller.

3) Add Validators to your UITextFields:


 	[self.nameField addContentValidator:[[RSEmptyValidator alloc]init]];
  
 	[self.nameField addContentValidator:[[RSCustomValidator alloc]
  
						initWithPattern:@"^(?=.*[a-z])\\w{7,15}\\s*$" 
						
						andFailMessage:@"Only symbols allowed! Length must be 7-15 symbols."]];
						

4) Call [self.view validateAllFields] to initiate validation process.
