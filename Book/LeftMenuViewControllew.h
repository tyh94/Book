//
//  LeftMenuViewControllew.h
//  eventBooklet
//
//  Created by admin on 2/12/16.
//  Copyright © 2016 i20admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftMenuTableViewCell.h"

@interface LeftMenuViewControllew : UIViewController <UITabBarControllerDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *data;

@end
