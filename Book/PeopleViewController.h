//
//  ViewController.h
//  Book
//
//  Created by Igor on 27.04.16.
//  Copyright (c) 2016 Igor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PeopleViewController : UIViewController

@property (nonatomic,strong) NSMutableArray *data;
@property (nonatomic,strong) NSMutableArray *tableData;
@property (nonatomic, strong) UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

