//
//  College.h
//  laundr
//
//  Created by Administrator on 1/4/15.
//  Copyright (c) 2015 Rice University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Machine;

@interface College : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * defaultCollege;
@property (nonatomic, retain) NSSet *machines;
@end

@interface College (CoreDataGeneratedAccessors)

- (void)addMachinesObject:(Machine *)value;
- (void)removeMachinesObject:(Machine *)value;
- (void)addMachines:(NSSet *)values;
- (void)removeMachines:(NSSet *)values;

@end
