//
//  AppDelegate.h
//  SimpleCoreData
//
//  Created by Rheno  Budiasa on 1/5/14.
//  Copyright (c) 2014 Rheno Budiasa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (strong, nonatomic) NSManagedObjectModel *managedObjectModel;

@property (strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;



- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

- (BOOL) createNewStudentWithName:(NSString *)paramName
                    studentNumber:(int)paramStudentNumber
                              age:(int)paramAge;

-(BOOL)updateStudentAtIndex:(int)index
                       Name:(NSString *)paramName
              studentNumber:(int)paramStudentNumber
                        age:(int)paramAge;
-(BOOL)deleteStudent;
-(void)liat;
@end
