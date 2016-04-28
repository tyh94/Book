//
//  PeoplesTableViewCell.h
//  Book
//
//  Created by Igor on 27.04.16.
//  Copyright (c) 2016 Igor. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PeopleTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *photoView;
@property (weak, nonatomic) IBOutlet UILabel *labelName;

@end
