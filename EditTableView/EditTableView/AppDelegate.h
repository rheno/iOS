//
//  AppDelegate.h
//  EditTableView
//
//  Created by Rheno Budiasa on 4/8/13.
//  Copyright (c) 2013 rheno. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainTableView;

@interface AppDelegate : UIResponder <UIApplicationDelegate>



@property (strong, nonatomic) UIWindow *window;



@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@property (strong, nonatomic) UINavigationController *navigationController;

@end
