//
//  LeftMenuViewControllew.m
//  eventBooklet
//
//  Created by admin on 2/12/16.
//  Copyright © 2016 i20admin. All rights reserved.
//
#import "LeftMenuViewControllew.h"
#import "SWRevealViewController.h"
#import "AppDelegate.h"

@interface LeftMenuViewControllew () <UINavigationControllerDelegate>

@end

@implementation LeftMenuViewControllew

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.delegate = self;
    NSMutableArray *data =[(AppDelegate *)[[UIApplication sharedApplication]delegate] data] ;
    for(id tmp in data){
        if([tmp valueForKey:@"group"]){
            self.data = [tmp valueForKey:@"group"];
        }
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.data count] + 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LeftMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"leftMenuCell"];
    if(indexPath.row == 0){
        cell.labelHome.text = @"Все";
    } else if(indexPath.row == [self.data count]+1){
        cell.labelHome.text = @"О программе";
    }else{
        cell.labelHome.text = [self.data[indexPath.row - 1] valueForKey:@"name"];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main"
                                                             bundle: nil];
    
    UIViewController *vc ;
    
    if(indexPath.row == 0){
        vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"PeopleViewController"];
    } else if(indexPath.row == [self.data count]+1){
        vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"AboutViewController"];
    } else {
        vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"PeopleViewController"];
    }
    [self presentViewController:vc animated:YES completion:nil];
}



@end
