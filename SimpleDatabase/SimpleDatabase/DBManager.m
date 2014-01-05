//
//  DBManager.m
//  SimpleDatabase
//
//  Created by Rheno  Budiasa on 1/5/14.
//  Copyright (c) 2014 Rheno Budiasa. All rights reserved.
//

#import "DBManager.h"

static DBManager* sharedInstance = nil;

static sqlite3 *database = nil;

static sqlite3_stmt *statement = nil;

@implementation DBManager

+(DBManager*)getSharedInstance{
    if (!sharedInstance) {
        sharedInstance = [[super allocWithZone:NULL] init];
        [sharedInstance createDB];
    }
    return sharedInstance;
}

-(BOOL)createDB{
    NSString *docsDir;
    NSArray *dirPaths;
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = [dirPaths objectAtIndex:0];
    // Build the path to the database file
    databasePath = [docsDir stringByAppendingPathComponent: @"student.db"];
    BOOL isSuccess = YES;
    NSFileManager *filemgr = [NSFileManager defaultManager];
    if ([filemgr fileExistsAtPath: databasePath ] == NO)
    {
        const char *dbpath = [databasePath UTF8String];
        if (sqlite3_open(dbpath, &database) == SQLITE_OK)
        {
            char *errMsg;
            const char *sql_stmt = "CREATE TABLE studentsDetail (studentnumber INTEGER PRIMARY KEY, name TEXT, department TEXT, year TEXT)";
            if (sqlite3_exec(database, sql_stmt, NULL, NULL, &errMsg)
                != SQLITE_OK)
            {
                isSuccess = NO;
                NSLog(@"Failed to create table");
            }
            sqlite3_close(database);
            return  isSuccess;
        }
        else {
            isSuccess = NO;
            NSLog(@"Failed to open/create database");
        }
    }

    return isSuccess;
}

- (BOOL) saveData:(NSString*)studentNumber name:(NSString*)name
       department:(NSString*)department year:(NSString*)year;
{
    const char *dbpath = [databasePath UTF8String];
    int num = [studentNumber integerValue];
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
    {
        NSString *insertSQL = [NSString stringWithFormat: @"INSERT INTO studentsDetail (studentnumber,name,department,year) VALUES (\"%d\",\"%@\", \"%@\", \"%@\")",
num,name, department, year];
        
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(database, insert_stmt,-1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            sqlite3_close(database);
            return YES;
        }else {
            NSLog(@"%s",sqlite3_errmsg(database));
            return NO;
        }

        sqlite3_reset(statement);
        sqlite3_close(database);
    }
    
    
    
    
    
    return NO;
}


- (BOOL)updateData:(NSString*)studentNumber name:(NSString*)name
       department:(NSString*)department year:(NSString*)year;
{
    const char *dbpath = [databasePath UTF8String];
    int num = [studentNumber integerValue];
    char* error;
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
    {
        NSString *updateSQL = [NSString stringWithFormat: @"UPDATE studentsDetail SET name = '%@', department = '%@', year = '%@' WHERE studentnumber = %d",name, department, year,num];
        
        const char *update_stmt = [updateSQL UTF8String];
        sqlite3_prepare_v2(database, update_stmt,-1, &statement, NULL);

        

        if (sqlite3_exec(database, update_stmt, NULL, NULL,&error) == SQLITE_DONE)
        {
            sqlite3_reset(statement);
            sqlite3_finalize(statement);
            return YES;
        }else{
            return YES;
        }
        
        
        
        sqlite3_close(database);
    }

    NSLog(@"liat %s",sqlite3_errmsg(database));
    
    
    return NO;
}


-(BOOL)deleteData:(NSString *)studentNumbers{
    const char *dbpath = [databasePath UTF8String];
    int num = [studentNumbers integerValue];
    char* error;
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
    {
        NSString *updateSQL = [NSString stringWithFormat: @"DELETE FROM studentsDetail WHERE studentnumber = %d",num];
        
        const char *update_stmt = [updateSQL UTF8String];
        sqlite3_prepare_v2(database, update_stmt,-1, &statement, NULL);
        
        
        
        if (sqlite3_exec(database, update_stmt, NULL, NULL,&error) == SQLITE_DONE)
        {
            sqlite3_reset(statement);
            sqlite3_finalize(statement);
            return YES;
        }else{
            return YES;
        }
        
        
        
        sqlite3_close(database);
    }
    
    NSLog(@"liat %s",sqlite3_errmsg(database));
    
    
    return NO;
}

- (NSArray*) findByRegisterNumber:(NSString*)studentNumber
{
    const char *dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
    {
        int num = [studentNumber integerValue];
        NSString *querySQL = [NSString stringWithFormat:
                              @"select name, department, year from studentsDetail where studentnumber=\"%d\"",num];
        const char *query_stmt = [querySQL UTF8String];
        NSMutableArray *resultArray = [[NSMutableArray alloc]init];
        if (sqlite3_prepare_v2(database,
                               query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            if (sqlite3_step(statement) == SQLITE_ROW)
            {
                NSString *name = [[NSString alloc] initWithUTF8String:
                                  (const char *) sqlite3_column_text(statement, 0)];
                [resultArray addObject:name];
                NSString *department = [[NSString alloc] initWithUTF8String:
                                        (const char *) sqlite3_column_text(statement, 1)];
                [resultArray addObject:department];
                NSString *year = [[NSString alloc]initWithUTF8String:
                                  (const char *) sqlite3_column_text(statement, 2)];
                [resultArray addObject:year];
                
                sqlite3_close(database);
                sqlite3_reset(statement);
                return resultArray;
            }
            else{
                NSLog(@"Not found");
                return nil;
            }
            sqlite3_close(database);
            sqlite3_reset(statement);
       
        }

    }
    
    
    return nil;
}



@end
