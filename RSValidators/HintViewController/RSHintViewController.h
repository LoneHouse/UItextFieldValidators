//
//  RSHintViewController.h
//  ValidationTest
//
//  Created by Roman Sidorakin on 29.08.13.
//  Copyright (c) 2013 Roman Sidorakin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RSHintViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSMutableSet *failedValidators;
@property (strong, nonatomic) IBOutlet UIView *messageView;
@property (strong, nonatomic) IBOutlet UITableView *errorsTableView;


- (IBAction)backAction:(id)sender;
- (void) showAnimatedFromView: (UIView *) parentView;
@end
