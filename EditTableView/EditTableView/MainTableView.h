//
//  MainTableView.h
//  EditTableView
//
//  Created by Rheno Budiasa on 4/8/13.
//  Copyright (c) 2013 rheno. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class DetailController;

@interface MainTableView : UITableViewController<UITableViewDataSource, UITableViewDelegate,NSFetchedResultsControllerDelegate>


@property (strong, nonatomic) DetailController *detailController;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
