//
//  PeopleDetailViewController.h
//  Book
//
//  Created by Igor on 28.04.16.
//  Copyright (c) 2016 Igor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PeopleDetailViewController : UIViewController <UITabBarDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableViewGroups;
@property (weak, nonatomic) IBOutlet UILabel *labelAdress;
@property (weak, nonatomic) IBOutlet UILabel *labelPhone;
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UIImageView *photoView;

@property (strong, nonatomic) NSMutableArray *groups;
@property (nonatomic, strong) NSDictionary *data;
@end
