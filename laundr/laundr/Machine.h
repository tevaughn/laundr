//
//  Machine.h
//  laundr
//
//  Created by Administrator on 1/4/15.
//  Copyright (c) 2015 Rice University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class College;

@interface Machine : NSManagedObject

@property (nonatomic, retain) NSString * washerOrDryer;
@property (nonatomic, retain) NSNumber * availible;
@property (nonatomic, retain) NSNumber * machineNumber;
@property (nonatomic, retain) NSNumber * timeRemainingInS;
@property (nonatomic, retain) College *college;

@end
