//
//  CollegeViewController.h
//  laundr
//
//  Created by Administrator on 1/4/15.
//  Copyright (c) 2015 Rice University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface CollegeViewController : UIViewController

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;


@end

