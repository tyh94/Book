//
//  PeopleDetailViewController.m
//  Book
//
//  Created by Igor on 28.04.16.
//  Copyright (c) 2016 Igor. All rights reserved.
//

#import "PeopleDetailViewController.h"
#import "AppDelegate.h"
#import "PeopleDetailViewControllerCell.h"

@implementation PeopleDetailViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.photoView.image = [UIImage imageNamed:[self.data valueForKey:@"image"]];
    self.labelName.text = [self.data valueForKey:@"name"];
    self.labelAdress.text = [self.data valueForKey:@"adress"];
    self.labelPhone.text = [self.data valueForKey:@"phone"];
    self.groups = [NSMutableArray new];
    NSMutableArray *data =[(AppDelegate *)[[UIApplication sharedApplication]delegate] data] ;
    for(id tmp in data){
        if([tmp valueForKey:@"group"]){
            self.groups = [tmp valueForKey:@"group"];
        }
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.groups count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PeopleDetailViewControllerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"peopleDetailCell"];
    cell.labelName.text = [self.groups[indexPath.row] valueForKey:@"name"];
    return cell;
}
@end
