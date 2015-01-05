//
//  StateOrMachineViewController.h
//  laundr
//
//  Created by Administrator on 1/4/15.
//  Copyright (c) 2015 Rice University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "College.h"

@interface StatOrMachineViewController : UIViewController


@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) College *college;

@end
