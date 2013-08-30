//
//  RSHintViewController.m
//  ValidationTest
//
//  Created by Roman Sidorakin on 29.08.13.
//  Copyright (c) 2013 Roman Sidorakin. All rights reserved.
//

#import "RSHintViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "Validator.h"
#import "RSErrorCell.h"

#define kDefaultCellHeight 35
#define kPadding 10
#define kDefaultTextViewWidth 260

@interface RSHintViewController ()

@end

@implementation RSHintViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
		
	}
	return self;
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	self.messageView.layer.cornerRadius = 10;
	[self.messageView.layer setMasksToBounds:YES];
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
}

-(void)setFailedValidators:(NSMutableSet *)failedValidators{
	_failedValidators = [failedValidators copy];
}

- (IBAction)backAction:(id)sender {
	[self hideAnimated];
}

- (void) showAnimatedFromView: (UIView *) parentView{
	[parentView addSubview:self.view];
	
	CGRect originalFrame = self.messageView.frame;
	self.messageView.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
	self.messageView.frame = CGRectMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2, 0, 0);
	
	[UIView animateWithDuration:0.2 animations:^{
		self.messageView.frame = originalFrame;
	}];
}

- (void) hideAnimated{
	[UIView animateWithDuration:0.2 animations:^{
		self.messageView.frame = CGRectMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2, 0, 0);
	} completion:^(BOOL finished) {
		if (finished) {
			[self.view removeFromSuperview];
		}
	}];
}

#pragma mark tableview deegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return [self.failedValidators count];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
	return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	Validator *validator = [[self.failedValidators allObjects] objectAtIndex:indexPath.row];
	NSString * text = validator.failMessage;
	CGSize textSize = [text sizeWithFont:[UIFont systemFontOfSize:17.0f] constrainedToSize:CGSizeMake(kDefaultTextViewWidth, NSIntegerMax)];
	
	float heightToAdd = MAX(textSize.height + kPadding, kDefaultCellHeight);
	return heightToAdd;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellIdentifier = @"RSErrorCell";
	
	RSErrorCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		NSArray *nib = [[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil];
		cell = (RSErrorCell *)[nib objectAtIndex:0];
	}
	
	Validator *validator = [[self.failedValidators allObjects] objectAtIndex:indexPath.row];
	cell.errorContent.text = validator.failMessage;
	
	return cell;
}
@end
