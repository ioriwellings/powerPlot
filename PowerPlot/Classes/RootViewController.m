//
//  RootViewController.m
//  PowerPlot
//
//  Created by Wolfram Schroers on 26.10.10.
//  Copyright 2010 Numerik & Analyse Schroers. All rights reserved.
//

#import "RootViewController.h"
#import "AnimatedGraph.h"
#import "AlertedFailedBanks.h"
#import "BusinessModelGraph.h"
#import "BusinessModelGraphInteractive.h"
#import "CascadedAnimation.h"
#import "ChartInfo.h"
#import "ContourPlot.h"
#import "CreateValue.h"
#import "DataBindings.h"
#import "DataHandling.h"
#import "ElectionBars.h"
#import "ElectionBarsInteractive.h"
#import "FailedBanks.h"
#import "FormFactor.h"
#import "FormFactorInteractive.h"
#import "MixedAnimation.h"
#import "MultiLines.h"
#import "ScientificLines.h"
#import "WebsiteVisitor.h"


@implementation RootViewController

@synthesize chartSamples = _chartSamples;


#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

    // Setup the configuration.
    self.title = @"PowerPlot Presents:";
    self.chartSamples = [NSArray arrayWithObjects:
                         [ChartInfo chartInfoWithController:[[BusinessModelGraph new] autorelease]
                                                   name:@"A business model"
                                            description:@"A graph with nodes and connections."],
                         [ChartInfo chartInfoWithController:[[BusinessModelGraphInteractive new] autorelease]
                                                       name:@"A business model, interactive"
                                                description:@"A graph with selectable nodes."],
                         [ChartInfo chartInfoWithController:[[CreateValue new] autorelease]
                                                   name:@"Value creation model"
                                            description:@"A graph illustrating creation of value."],
                         [ChartInfo chartInfoWithController:[[FailedBanks new] autorelease]
                                                   name:@"Failed banks 2000-2010"
                                            description:@"Bar chart of failed US banks since 2000."],
                         [ChartInfo chartInfoWithController:[[WebsiteVisitor new] autorelease]
                                                   name:@"Website traffic"
                                            description:@"Web traffic on field-theory.org."],
                         [ChartInfo chartInfoWithController:[[ElectionBars new] autorelease]
                                                   name:@"Election results"
                                            description:@"Results of German Federal Elections 2009."],
                         [ChartInfo chartInfoWithController:[[ElectionBarsInteractive new] autorelease]
                                                       name:@"Election results, interactive"
                                                description:@"Election results chart with selectable bars."],
                         [ChartInfo chartInfoWithController:[[ScientificLines new] autorelease]
                                                   name:@"Scientific data plot"
                                            description:@"Fictional data with uncertainties."],
                         [ChartInfo chartInfoWithController:[[ContourPlot new] autorelease]
                                                   name:@"Scientific contour plot"
                                            description:@"Scattered data points with iso-surfaces."],
                         [ChartInfo chartInfoWithController:[[FormFactor new] autorelease]
                                                   name:@"Scientific data fit"
                                            description:@"Nucleon form factor data and best fit."],
                         [ChartInfo chartInfoWithController:[[FormFactorInteractive new] autorelease]
                                                       name:@"Scientific data fit, interactive"
                                                description:@"Nucleon data with zooming and scrolling."],
                         [ChartInfo chartInfoWithController:[[MultiLines new] autorelease]
                                                   name:@"Multiple lines plot"
                                            description:@"Hypothetical stocks data of several assets."],
                         [ChartInfo chartInfoWithController:[[DataBindings new] autorelease]
                                                   name:@"Automatic chart update"
                                            description:@"Chart updates with automatic data bindings."],
                         [ChartInfo chartInfoWithController:[[AnimatedGraph new] autorelease]
                                                   name:@"Animated function plot"
                                            description:@"Animation of a line chart."],
                         [ChartInfo chartInfoWithController:[[CascadedAnimation new] autorelease]
                                                   name:@"Animation cascade"
                                            description:@"Continuous animation loop."],
                         [ChartInfo chartInfoWithController:[[MixedAnimation new] autorelease]
                                                   name:@"Mixed animation"
                                            description:@"Joint animation of two different chart types."],
                         [ChartInfo chartInfoWithController:[[AlertedFailedBanks new] autorelease]
                                                       name:@"Failed banks with alerting"
                                                description:@"Failed banks plot with alerted bars."],
                         [ChartInfo chartInfoWithController:[[DataHandling new] autorelease]
                                                   name:@"Data model class"
                                            description:@"Some operations on model data."],
                         nil];

}

 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark - Table view data source

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return [self.chartSamples count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                       reuseIdentifier:CellIdentifier] autorelease];
    }
    
    ChartInfo *info = [self.chartSamples objectAtIndex:indexPath.row];
    cell.textLabel.text = info.chartName;
    cell.detailTextLabel.text = info.chartDescription;

    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    ChartInfo *item = [self.chartSamples objectAtIndex:indexPath.row];
    UIViewController *detailViewController = [[[item.chartController class] alloc]
                                              initWithNibName:nil bundle:nil];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"PowerPlot", nil)
                                                                   style:UIBarButtonItemStyleBordered
                                                                  target:nil
                                                                  action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    [backButton release];
    [self.navigationController pushViewController:detailViewController
                                         animated:YES];
    [detailViewController release];
}


#pragma mark - Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
    self.chartSamples = nil;
}

- (void)dealloc {
    self.chartSamples = nil;
    
    [super dealloc];
}

@end

