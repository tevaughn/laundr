//
//  CollegeViewController.m
//  laundr
//
//  Created by Administrator on 1/4/15.
//  Copyright (c) 2015 Rice University. All rights reserved.
//

#import "CollegeViewController.h"
#import "AppDelegate.h"
#import "College.h"
#import "StatOrMachineViewController.h"


@interface CollegeViewController ()

@property (strong, nonatomic) College *college;

@end


@implementation CollegeViewController

- (void)setManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    _managedObjectContext = managedObjectContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"College"];
    request.predicate = nil;//
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]];
    
    
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                        managedObjectContext:managedObjectContext
                                                                          sectionNameKeyPath:nil
                                                                                   cacheName:nil];
    
    [self.fetchedResultsController performFetch:nil];
}

- (void)contextChanges:(NSNotification *)notification
{
    self.college = ((College*)[self.fetchedResultsController.fetchedObjects firstObject]);
    if (self.college.name != nil ) {
            NSString *segueName = [[NSString alloc]  initWithFormat:@"segueToMachinesForCollege%@", self.college.name];
            [self performSegueWithIdentifier:segueName sender:self];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.managedObjectContext = ((AppDelegate*)[[UIApplication sharedApplication] delegate]).managedObjectContext;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(contextChanges:)
                                                 name:NSManagedObjectContextDidSaveNotification
                                               object:self.managedObjectContext];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
    if ( [sender class] == [UIButton class]) {
        
        [self.managedObjectContext performBlockAndWait:^(void) {
     
            NSLog(@"Sender:%@",((UIButton*)sender).titleLabel.text);
            self.college.name = ((UIButton*)sender).titleLabel.text;
            
        }];
        
        [self.managedObjectContext save:nil];
        
    }
    
    NSLog(@"UserCollege:%@",self.college.name);
    
    [((UITabBarController*)(segue.destinationViewController)) setTitle:self.college.name];
    
    for( UIViewController* controller in ((UITabBarController*)(segue.destinationViewController)).childViewControllers )
    {
        ((StatOrMachineViewController*)controller).college = self.college;
        [controller setTitle:self.college.name];
    }

}


@end
