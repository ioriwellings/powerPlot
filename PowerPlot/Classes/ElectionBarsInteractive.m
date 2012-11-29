//
//  ElectionBarsInteractive.m
//  PowerPlot
//
//  Created by Wolfram Schroers on 1/23/12.
//  Copyright (c) 2012 Numerik & Analyse Schroers. All rights reserved.
//

#import "ElectionBarsInteractive.h"
#import "DemoData.h"

@implementation ElectionBarsInteractive

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Replicate the starting chart from the "ElectionBars" example.
    self.barData = [[DemoData electionResults2009] indexedData];
    WSChart *aChart = [WSChart barPlotWithFrame:[self.view bounds]
                                           data:self.barData
                                      barColors:[NSArray
                                                 arrayWithObjects:[UIColor CSSColorBlack],
                                                 [UIColor CSSColorYellow],
                                                 [UIColor CSSColorRed],
                                                 [UIColor CSSColorGreen],
                                                 [UIColor CSSColorTeal],
                                                 [UIColor CSSColorGray], nil]
                                          style:kChartBarPlain
                                    colorScheme:kColorWhite];
    [self.electionChart addPlotsFromChart:aChart];
    [self.electionChart scaleAllAxisYD:NARangeMake(-10, 45)];
    [self.electionChart setAllAxisLocationXD:-0.5];
    [self.electionChart setAllAxisLocationYD:0];
    WSPlotBar *bar = (WSPlotBar *)[[self.electionChart plotAtIndex:0] view];
    [bar setValue:[UIColor blackColor]
       forKeyPath:@"dataDelegate.dataD.values.customDatum.outlineColor"];
    WSPlotAxis *axis = [self.electionChart firstPlotAxis];
    [[axis ticksX] setTicksStyle:kTicksLabels];
    [[axis ticksY] setTicksStyle:kTicksLabels];
    [[axis ticksY] ticksWithNumbers:[NSArray arrayWithObjects:
                                     [NSNumber numberWithFloat:0],
                                     [NSNumber numberWithFloat:10],
                                     [NSNumber numberWithFloat:20],
                                     [NSNumber numberWithFloat:30],
                                     nil]
                             labels:[NSArray arrayWithObjects:@"",
                                     @"10%", @"20%", @"30%", nil]];
    [self.electionChart setChartTitle:NSLocalizedString(@"Bundestagselection 2009", @"")];
    
    // Configure the single tap feature.
    WSPlotController *aCtrl = [self.electionChart plotAtIndex:0];
    aCtrl.tapEnabled = YES;
    aCtrl.delegate = self;
    aCtrl.hitTestMethod = kHitTestX;
    aCtrl.hitResponseMethod = kHitResponseDatum;
}


#pragma mark - WSControllerGestureDelegate

- (void)controller:(WSPlotController *)controller
  singleTapAtDatum:(NSInteger)i {
    WSDatum *target = [self.barData datumAtIndex:i];
    self.resultLabel.text = [NSString stringWithFormat:@"%@: %2.0f%%",
                             target.annotation,
                             target.value];
}


#pragma mark -

@synthesize barData = _barData;
@synthesize electionChart = _electionChart;
@synthesize resultLabel = _resultLabel;

- (void)viewDidUnload {
    [super viewDidUnload];
    self.electionChart = nil;
    self.resultLabel = nil;
}

- (void)dealloc {
    self.barData = nil;
    self.electionChart = nil;
    self.resultLabel = nil;
    [super dealloc];
}

@end
