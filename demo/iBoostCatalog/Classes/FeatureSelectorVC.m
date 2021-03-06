//
//  FeatureSelectorVC.m
//  iBoostCatalog
//
//  Created by John Blanco on 9/3/10.
//  Copyright 2010 Effective UI. All rights reserved.
//

#import "FeatureSelectorVC.h"

#import "IBButtonDemoVC.h"
#import "IBHTMLLabelDemoVC.h"
#import "IBCoreTextLabelDemoVC.h"

// feature labels
static NSArray *gFeatureLabels = nil;

@implementation FeatureSelectorVC

/*
- (id)initWithStyle:(UITableViewStyle)style {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    if ((self = [super initWithStyle:style])) {
    }
    return self;
}
*/

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.title = NSLocalizedString(@"iBoost Catalog", nil);

	// initialize labels
	if (!gFeatureLabels) {
		gFeatureLabels = [[NSArray alloc ] initWithObjects:NSLocalizedString(@"Buttons", nil), NSLocalizedString(@"HTML Styled Text Label", nil), NSLocalizedString(@"Core Text Styled Label", nil), nil];
	}
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return gFeatureLabels.count;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
	cell.textLabel.text = [gFeatureLabels objectAtIndex:indexPath.row];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	UIViewController *demo = nil;
	
	switch (indexPath.row) {
		case 0: {
			demo = [[[IBButtonDemoVC alloc] init] autorelease];
			break;
		}

		case 1: {
			demo = [[[IBHTMLLabelDemoVC alloc] init] autorelease];
			break;
		}

		case 2: {
			demo = [[[IBCoreTextLabelDemoVC alloc] init] autorelease];
			break;
		}
	}
	
	if (demo) {
		demo.title = [gFeatureLabels objectAtIndex:indexPath.row];
		[self.navigationController pushViewController:demo animated:YES];
	}		
}

- (void)dealloc {
    [super dealloc];
}


@end

