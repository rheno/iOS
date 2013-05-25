//
//  Users.h
//  EditTableView
//
//  Created by Rheno Budiasa on 5/19/13.
//  Copyright (c) 2013 rheno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Users : NSManagedObject

@property (nonatomic, retain) NSString * id;
@property (nonatomic, retain) NSString * username;
@property (nonatomic, retain) NSString * password;

@end

