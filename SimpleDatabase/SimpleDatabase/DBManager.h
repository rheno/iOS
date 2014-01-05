//
//  DBManager.h
//  SimpleDatabase
//
//  Created by Rheno  Budiasa on 1/5/14.
//  Copyright (c) 2014 Rheno Budiasa. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <sqlite3.h>

@interface DBManager : NSObject
{
    NSString* databasePath;
}
+(DBManager*)getSharedInstance;
-(BOOL)createDB;
-(BOOL)saveData:(NSString*)studentNumbers
           name:(NSString*)name
     department:(NSString*)department
           year:(NSString*)year;
-(BOOL)updateData:(NSString*)studentNumbers
           name:(NSString*)name
     department:(NSString*)department
           year:(NSString*)year;
-(BOOL)deleteData:(NSString*)studentNumbers;

-(NSArray*) findByRegisterNumber:(NSString*)registerNumber;

@end
