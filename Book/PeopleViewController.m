//
//  ViewController.m
//  Book
//
//  Created by Igor on 27.04.16.
//  Copyright (c) 2016 Igor. All rights reserved.
//

#import "PeopleViewController.h"
#import "PeopleTableViewCell.h"
#import "SWRevealViewController.h"
#import "PeopleDetailViewController.h"
#import <Foundation/NSArray.h>
#import <CoreData/NSPersistentStoreRequest.h>
#import <CoreData/NSFetchRequest.h>
#import "AppDelegate.h"

@interface PeopleViewController () <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>
@property (nonatomic) IBOutlet UIBarButtonItem* revealButtonItem;
@end

@implementation PeopleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.data = [NSMutableArray new];
//    NSMutableArray *data =[(AppDelegate *)[[UIApplication sharedApplication]delegate] data] ;
//    for(id tmp in data){
//        if([tmp valueForKey:@"person"]){
//            [self.data addObject:[tmp valueForKey:@"person"]];
//        }
//    }
    
    self.data = [[[(AppDelegate *)[[UIApplication sharedApplication]delegate] data] valueForKey:@"person"] firstObject];
    self.data = [[self.data sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]]] mutableCopy];
    self.tableData = self.data;
    self.searchBar = [UISearchBar new];
    self.searchBar.delegate = self;
    self.navigationItem.titleView = self.searchBar;
    [self.tableView reloadData];
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if(revealViewController){
        [self.revealButtonItem setTarget: self.revealViewController];
        [self.revealButtonItem setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PeopleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"peopleCell"];
    cell.labelName.text = [self.tableData[indexPath.row] valueForKey:@"name"];
    ((UIImageView *)cell.photoView).image = [UIImage imageNamed:[self.tableData[indexPath.row] valueForKey:@"image"]];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.tableData count];
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if([searchText isEqualToString:@""]){
        self.tableData = self.data;
    } else{
        NSMutableArray *searchArray = [NSMutableArray new];
        for(NSDictionary *dict in self.data){
            if([[dict valueForKey:@"name"] rangeOfString:searchText options:NSCaseInsensitiveSearch].location != NSNotFound){
                [searchArray addObject:dict];
            }
        }
        self.tableData = searchArray;
    }
    [self.tableView reloadData];
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark - Navigation

// Open detail of events
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"showDetailPeople"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDictionary *book = [self.tableData objectAtIndex:indexPath.row];
        PeopleDetailViewController *destViewController = segue.destinationViewController;
        destViewController.data = book;
    }
}


@end
