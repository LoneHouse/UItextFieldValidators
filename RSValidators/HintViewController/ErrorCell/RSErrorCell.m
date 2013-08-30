//
//  RSErrorCell.m
//  ValidationTest
//
//  Created by Roman Sidorakin on 30.08.13.
//  Copyright (c) 2013 Roman Sidorakin. All rights reserved.
//

#import "RSErrorCell.h"

@implementation RSErrorCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
