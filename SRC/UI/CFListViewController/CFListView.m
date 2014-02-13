//
//  CFListView.m
//  CamFind
//
//  Created by Alexandr Chernov on 1/27/14.
//  Copyright (c) 2014 Alexandr Chernov. All rights reserved.
//

#import "CFListView.h"

@implementation CFListView

//-(id)initWithFrame:(CGRect)frame {
//    if (self = [super initWithFrame:frame]) {
//        [self baseInit];
//    }
//    return self;
//}

//- (void)baseInit {
//    UITextField *textField = [self.searchBar valueForKey:@"_searchField"];
//}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.searchBar = nil;
    self.tableView = nil;
    self.tableViewBackView = nil;
    self.statusBackView = nil;
    self.statusIndicatorView = nil;
    self.statusLabel = nil;

    [super dealloc];
}

#pragma mark -
#pragma mark Public methods

- (void)tableViewHaveRows:(BOOL)haveRows {
    self.tableView.alpha = haveRows;
//    self.tableViewStatusLabel.alpha = !haveRows;
//    self.tableViewStatusLabel.text = @"no data for show";
}

-(void)updateStatusWithProcessor:(CFMainProcessor *)processor {
    CGRect frame = self.statusIndicatorView.frame;
    if (processor) {
        self.statusLabel.text = [CFMainProcessor statusStrings][processor.status];
        frame.size.width = self.statusBackView.frame.size.width * [processor indicatorWidth];
    } else {
        self.statusLabel.text = [CFMainProcessor statusStrings][processorStatusReady];
        frame.size.width = 0;
    }
    self.statusIndicatorView.frame = frame;
    if (processor.status == processorStatusDescriptionGettingComplete) {
        self.searchBar.text = processor.imageDescription;
    }
}

@end
