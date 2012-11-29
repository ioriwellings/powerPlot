//
//  ExampleChartController.m
//  PowerPlot
//
//  Created by Wolfram Schroers on 1/29/12.
//  Copyright (c) 2012 Numerik & Analyse Schroers. All rights reserved.
//

#import "ExampleChartController.h"

@implementation ExampleChartController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = NSStringFromClass([self class]);
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return ((interfaceOrientation == UIInterfaceOrientationLandscapeLeft)  ||
            (interfaceOrientation == UIInterfaceOrientationLandscapeRight) ||
            (interfaceOrientation == UIInterfaceOrientationPortrait));
}

@end
