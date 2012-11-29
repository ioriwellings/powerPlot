//
//  DemoData.m
//  PowerPlot
//
//  Created by Wolfram Schroers on 26.10.10.
//  Copyright 2010 Numerik & Analyse Schroers. All rights reserved.
//

#import "DemoData.h"
#import "PowerPlot.h"
#import <math.h>


@interface DemoData ()

/** Convert a C-array of NSString with len elements to a localized array. */
+ (void)localizeArray:(NSString **)stringArray
                  len:(NSInteger)len;

@end

@implementation DemoData

+ (void)localizeArray:(NSString **)stringArray
                  len:(NSInteger)len {
    for (int i=0; i<len; i++) {
        stringArray[i] = NSLocalizedString(stringArray[i], @"");
    }    
}

+ (WSData *)demoGraphNodes {
    float graphSetX[7] = {0.5,0.2,0.7,0.9,0.8,0.4,0.1};
    float graphSetY[7] = {1.0,0.5,0.5,0.2,0.8,0.25,0.15};
    NSString *graphLabels[7] = { @"Customer", @"Product", @"Marketing",
                                 @"Development", @"Competition",
                                 @"Customize", @"Operation" };
    [self localizeArray:graphLabels len:7];
    
    return [WSData dataWithValues:[WSData arrayWithFloat:graphSetY len:7]
                          valuesX:[WSData arrayWithFloat:graphSetX len:7]
                      annotations:[WSData arrayWithString:graphLabels len:7]];    
}

+ (WSGraphConnections *)demoGraphConnections {
    WSGraphConnections *connections = [[WSGraphConnections alloc] init];
    [connections addConnection:[WSConnection connectionFrom:1 to:0]];
    [connections addConnection:[WSConnection connectionFrom:2 to:0 strength:5]];
    [connections addConnection:[WSConnection connectionFrom:1 to:2]];
    [connections addConnection:[WSConnection connectionFrom:3 to:1 strength:5]];
    [connections addConnection:[WSConnection connectionFrom:4 to:0 strength:3]];
    [connections addConnection:[WSConnection connectionFrom:5 to:1 strength:2]];
    [connections addConnection:[WSConnection connectionFrom:6 to:1]];
    
    return [connections autorelease];
}

+ (WSData *)electionResults2009 {
    float election[6] = {33, 17, 24, 11, 11, 4};
    NSString *parties[6] = { @"CDU", @"FDP", @"SPD", @"Green", @"The Left",
                             @"Others"};
    [self localizeArray:parties len:6];

    return [WSData dataWithValues:[WSData arrayWithFloat:election
                                                     len:6]
                      annotations:[NSArray arrayWithObjects:parties
                                                      count:6]];
}

+ (WSData *)scientificData {
    float dataSet2D[7] = {1.3,-1.0,1.2,1.7,0.9,0.8,1.0};
    float dataSet3D[7] = {2.1,0.9,2.8,4.3,5.1,6.0,7.0};
    float dataSet4D[7] = {0.2,0.1,0.3,0.0,0.5,0.6,0.7};
    float dataSet5D[7] = {0.25,0.1,0.0,0.4,0.51,0.6,0.7};
    
    return [WSData dataWithValues:[WSData arrayWithFloat:dataSet2D len:7]
                          valuesX:[WSData arrayWithFloat:dataSet3D len:7]
                        errorMinY:[WSData arrayWithFloat:dataSet4D len:7]
                        errorMaxY:[NSArray array]
                        errorMinX:[WSData arrayWithFloat:dataSet4D len:7]
                        errorMaxX:[WSData arrayWithFloat:dataSet5D len:7]];
}

+ (WSData *)failedBanks {
    float years[11] = {2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010};
    float failures[11] = {2, 4, 11, 3, 4, 0, 0, 3, 25, 140, 129};
    
    return [WSData dataWithValues:[WSData arrayWithFloat:failures len:11]
                          valuesX:[WSData arrayWithFloat:years len:11]];
}

+ (WSData *)valueGraphNodes {
    float graphSetX[7] = {1, 2, 3,  1, 2, 3,  2};
    float graphSetY[7] = {2, 2, 2,  1, 1, 0.25,  -0.5};
    NSString *graphLabels[7] = { @"Content", @"Broker", @"Customer",
                                 @"Knowledge", @"Transmission", @"Value",
                                 @"Value = Knowledge*Transmission" };
    [self localizeArray:graphLabels len:7];
    
    return [WSData dataWithValues:[WSData arrayWithFloat:graphSetY len:7]
                          valuesX:[WSData arrayWithFloat:graphSetX len:7]
                      annotations:[WSData arrayWithString:graphLabels len:7]];        
}

+ (WSGraphConnections *)valueGraphConnections {
    WSGraphConnections *connections = [[WSGraphConnections alloc] init];
    [connections addConnection:[WSConnection connectionFrom:0 to:1]];
    [connections addConnection:[WSConnection connectionFrom:1 to:2 strength:5]];
    [connections addConnection:[WSConnection connectionFrom:3 to:0 strength:2]];
    [connections addConnection:[WSConnection connectionFrom:4 to:1 strength:3]];
    [connections addConnection:[WSConnection connectionFrom:5 to:2 strength:5]];
    [[connections connectionBetweenNode:5 andNode:2] setDirection:kGDirectionBoth];
    [connections addConnection:[WSConnection connectionFrom:3 to:5]];
    [connections addConnection:[WSConnection connectionFrom:4 to:5 strength:4]];
    
    return [connections autorelease];    
}

+ (NSArray *)sixMonths {
    NSString *months[6] = { @"March", @"April",
                            @"May", @"June", @"July", @"August"};
    [self localizeArray:months len:6];

    return [WSData arrayWithString:months len:6];
}

+ (WSData *)monthlyHits {
    float hits[6] = {68824, 85378, 119482, 77549, 66987, 86501};

    WSData *tmp = [WSData dataWithValues:[WSData arrayWithFloat:hits len:6]
                             annotations:[self sixMonths]];
    
    return [tmp indexedData];
}

+ (WSData *)monthlyPageviews {
    float views[6] = {17245, 22444, 30129, 23405, 19007, 26643};
    
    WSData *tmp = [WSData dataWithValues:[WSData arrayWithFloat:views len:6]
                             annotations:[self sixMonths]];
    
    return [tmp indexedData];
}

+ (WSData *)monthlyVisitors {
    float sessions[6] = {13194, 12097, 14305, 16667, 13664, 14230};
    
    WSData *tmp = [WSData dataWithValues:[WSData arrayWithFloat:sessions len:6]
                             annotations:[self sixMonths]];
    
    return [tmp indexedData];
}

+ (WSData *)scatteredPoints {
    float valX[100] = {-2.043282e+00, 4.503648e-01, -8.836231e-01, -1.028787e+00, 2.743946e-01, -6.348180e-01, 1.877534e-01, 1.239718e+00, 8.397031e-01, -4.026764e-01, 1.039577e+00, -4.168629e-02, 6.069953e-01, -1.459334e+00, -1.504147e+00, -2.102900e-01, 6.480975e-01, -2.222343e-01, -5.171353e-01, 8.112151e-01, 1.138230e+00, -6.352332e-01, -2.287933e+00, -4.692279e-01, -8.983100e-01, 1.577126e-01, 4.928760e-02, -1.043575e+00, 5.411329e-02, 9.398723e-01, -4.529125e-01, -1.775980e-01, 5.638080e-01, 1.317904e+00, 9.850322e-01, 1.201972e+00, 9.081918e-02, -3.698079e-02, -1.113362e+00, -1.567157e-01, -1.625698e+00, -3.692007e-01, -1.111232e+00, -7.973324e-01, -7.873852e-01, -3.585864e-01, 5.831790e-01, -1.189164e+00, -7.831913e-01, -9.720961e-01, -2.598408e-01, 6.052751e-01, -8.256405e-01, 1.411977e+00, 6.595746e-01, -6.022343e-02, -1.181429e+00, 1.068132e+00, -2.288535e-01, -2.357747e+00, 5.599159e-01, 4.867739e-01, -4.933817e-01, -1.225311e+00, -1.451158e-01, -1.051789e+00, 1.944971e-01, 1.474603e-01, 9.910611e-01, 2.322170e-01, -7.530129e-01, 1.116462e-01, -9.606741e-01, 5.149964e-01, 8.981660e-01, -5.742655e-02, 1.215300e+00, 5.906844e-01, 7.536304e-01, -7.596085e-01, -1.739916e+00, -1.841587e+00, -3.724635e-01, -3.709186e-02, 1.020246e+00, 5.027521e-01, 1.576341e-01, 7.698577e-01, 1.110466e+00, 5.231727e-02, 2.890088e-01, 2.269169e-01, -1.294963e+00, -2.284838e+00, 8.466183e-01, -1.582039e+00, 1.818645e-01, -3.425091e-01, -5.572880e-02, -6.767592e-02};
    float valY[100] = {1.416501e+00, -9.049612e-01, 1.419772e-01, 4.562616e-02, -5.336149e-01, 2.060981e-01, 8.446408e-01, -4.835504e-01, 2.174699e-01, 1.117603e+00, -3.343753e-01, -6.671615e-03, 2.043743e-01, 7.329398e-01, 1.180740e+00, 1.816819e-01, -4.308009e-01, 5.630138e-01, 1.405280e+00, -4.032709e-02, -5.146616e-01, 4.697430e-01, 2.300709e-02, 3.469213e-02, 4.136438e-01, 5.513379e-01, 6.112829e-01, 1.479948e-01, 4.770951e-01, -4.378181e-01, 2.344829e-01, -2.524226e-01, 1.079062e-01, -9.235797e-01, -5.553837e-01, -6.899426e-01, 5.683916e-01, -1.775189e-01, -6.068613e-01, -8.507804e-02, 7.266895e-01, -3.897811e-01, 1.266102e+00, 3.825311e-01, 9.258265e-01, 5.896123e-01, -9.844169e-01, 4.264309e-01, 4.103132e-02, 9.091042e-01, -1.824102e-01, -1.703191e-01, 9.912309e-01, -1.184628e+00, -4.158071e-01, -7.239852e-01, -7.553935e-02, -1.376368e+00, -3.686877e-01, 9.892188e-01, -1.093756e+00, -8.019266e-01, -7.451769e-02, 5.843144e-01, -2.440259e-01, 7.314158e-01, -5.027225e-02, -1.252870e+00, 3.998303e-01, -2.541958e-01, 1.415777e-01, -3.381660e-01, -2.365672e-01, 8.582334e-01, 4.641615e-01, -2.314185e-01, -6.439265e-01, 3.353992e-01, -7.584386e-01, 5.253859e-01, 2.460868e-02, -5.797906e-02, 2.954969e-01, 1.958292e-01, -9.547800e-01, -2.704417e-01, -1.029759e+00, 1.200875e-01, -2.042458e-01, -4.336957e-01, 3.157350e-01, 6.296643e-01, -4.353806e-01, 1.246110e+00, 3.213328e-01, 1.244067e+00, -6.825887e-01, 1.542099e-02, 2.674355e-01, 5.613153e-01};

    return [WSData dataWithValues:[WSData arrayWithFloat:valY len:100]
                          valuesX:[WSData arrayWithFloat:valX len:100]];
}

+ (WSData *)centerRegion {
    float valX[50] = {8.660254e-01, 8.905298e-01, 9.009901e-01, 8.972412e-01, 8.793423e-01, 8.475756e-01, 8.024421e-01, 7.446537e-01, 6.751216e-01, 5.949424e-01, 5.053807e-01, 4.078488e-01, 3.038849e-01, 1.951285e-01, 8.329483e-02, -2.985244e-02, -1.425289e-01, -2.529576e-01, -3.593971e-01, -4.601686e-01, -5.536830e-01, -6.384654e-01, -7.131789e-01, -7.766452e-01, -8.278632e-01, -8.660254e-01, -8.905298e-01, -9.009901e-01, -8.972412e-01, -8.793423e-01, -8.475756e-01, -8.024421e-01, -7.446537e-01, -6.751216e-01, -5.949424e-01, -5.053807e-01, -4.078488e-01, -3.038849e-01, -1.951285e-01, -8.329483e-02, 2.985244e-02, 1.425289e-01, 2.529576e-01, 3.593971e-01, 4.601686e-01, 5.536830e-01, 6.384654e-01, 7.131789e-01, 7.766452e-01, 8.278632e-01};
    float valY[50] = {-5.000000e-01, -4.417865e-01, -3.766057e-01, -3.054856e-01, -2.295479e-01, -1.499900e-01, -6.806672e-02, 1.493003e-02, 9.769132e-02, 1.789120e-01, 2.573111e-01, 3.316522e-01, 4.007630e-01, 4.635535e-01, 5.190335e-01, 5.663280e-01, 6.046913e-01, 6.335181e-01, 6.523540e-01, 6.609019e-01, 6.590270e-01, 6.467588e-01, 6.242909e-01, 5.919775e-01, 5.503282e-01, 5.000000e-01, 4.417865e-01, 3.766057e-01, 3.054856e-01, 2.295479e-01, 1.499900e-01, 6.806672e-02, -1.493003e-02, -9.769132e-02, -1.789120e-01, -2.573111e-01, -3.316522e-01, -4.007630e-01, -4.635535e-01, -5.190335e-01, -5.663280e-01, -6.046913e-01, -6.335181e-01, -6.523540e-01, -6.609019e-01, -6.590270e-01, -6.467588e-01, -6.242909e-01, -5.919775e-01, -5.503282e-01};
    
    return [WSData dataWithValues:[WSData arrayWithFloat:valY len:50]
                          valuesX:[WSData arrayWithFloat:valX len:50]];
}

+ (WSData *)centerRegionWide {
    float valX[100] = {2.165064e+00, 2.200035e+00, 2.226325e+00, 2.243828e+00, 2.252475e+00, 2.252233e+00, 2.243103e+00, 2.225120e+00, 2.198356e+00, 2.162915e+00, 2.118939e+00, 2.066600e+00, 2.006105e+00, 1.937693e+00, 1.861634e+00, 1.778228e+00, 1.687804e+00, 1.590719e+00, 1.487356e+00, 1.378123e+00, 1.263452e+00, 1.143794e+00, 1.019622e+00, 8.914261e-01, 7.597122e-01, 6.250000e-01, 4.878212e-01, 3.487173e-01, 2.082371e-01, 6.693508e-02, -7.463110e-02, -2.159027e-01, -3.563223e-01, -4.953356e-01, -6.323941e-01, -7.669568e-01, -8.984926e-01, -1.026483e+00, -1.150421e+00, -1.269820e+00, -1.384207e+00, -1.493132e+00, -1.596164e+00, -1.692896e+00, -1.782947e+00, -1.865962e+00, -1.941613e+00, -2.009601e+00, -2.069658e+00, -2.121547e+00, -2.165064e+00, -2.200035e+00, -2.226325e+00, -2.243828e+00, -2.252475e+00, -2.252233e+00, -2.243103e+00, -2.225120e+00, -2.198356e+00, -2.162915e+00, -2.118939e+00, -2.066600e+00, -2.006105e+00, -1.937693e+00, -1.861634e+00, -1.778228e+00, -1.687804e+00, -1.590719e+00, -1.487356e+00, -1.378123e+00, -1.263452e+00, -1.143794e+00, -1.019622e+00, -8.914261e-01, -7.597122e-01, -6.250000e-01, -4.878212e-01, -3.487173e-01, -2.082371e-01, -6.693508e-02, 7.463110e-02, 2.159027e-01, 3.563223e-01, 4.953356e-01, 6.323941e-01, 7.669568e-01, 8.984926e-01, 1.026483e+00, 1.150421e+00, 1.269820e+00, 1.384207e+00, 1.493132e+00, 1.596164e+00, 1.692896e+00, 1.782947e+00, 1.865962e+00, 1.941613e+00, 2.009601e+00, 2.069658e+00, 2.121547e+00};
    float valY[100] = {-1.250000e+00, -1.179561e+00, -1.104466e+00, -1.025013e+00, -9.415143e-01, -8.542999e-01, -7.637141e-01, -6.701142e-01, -5.738697e-01, -4.753604e-01, -3.749750e-01, -2.731098e-01, -1.701668e-01, -6.655220e-02, 3.732507e-02, 1.410550e-01, 2.442283e-01, 3.464377e-01, 4.472799e-01, 5.463569e-01, 6.432776e-01, 7.376597e-01, 8.291305e-01, 9.173291e-01, 1.001907e+00, 1.082532e+00, 1.158884e+00, 1.230662e+00, 1.297584e+00, 1.359384e+00, 1.415820e+00, 1.466668e+00, 1.511728e+00, 1.550822e+00, 1.583795e+00, 1.610518e+00, 1.630885e+00, 1.644816e+00, 1.652255e+00, 1.653173e+00, 1.647567e+00, 1.635459e+00, 1.616897e+00, 1.591953e+00, 1.560727e+00, 1.523341e+00, 1.479944e+00, 1.430705e+00, 1.375821e+00, 1.315506e+00, 1.250000e+00, 1.179561e+00, 1.104466e+00, 1.025013e+00, 9.415143e-01, 8.542999e-01, 7.637141e-01, 6.701142e-01, 5.738697e-01, 4.753604e-01, 3.749750e-01, 2.731098e-01, 1.701668e-01, 6.655220e-02, -3.732507e-02, -1.410550e-01, -2.442283e-01, -3.464377e-01, -4.472799e-01, -5.463569e-01, -6.432776e-01, -7.376597e-01, -8.291305e-01, -9.173291e-01, -1.001907e+00, -1.082532e+00, -1.158884e+00, -1.230662e+00, -1.297584e+00, -1.359384e+00, -1.415820e+00, -1.466668e+00, -1.511728e+00, -1.550822e+00, -1.583795e+00, -1.610518e+00, -1.630885e+00, -1.644816e+00, -1.652255e+00, -1.653173e+00, -1.647567e+00, -1.635459e+00, -1.616897e+00, -1.591953e+00, -1.560727e+00, -1.523341e+00, -1.479944e+00, -1.430705e+00, -1.375821e+00, -1.315506e+00};
    
    return [WSData dataWithValues:[WSData arrayWithFloat:valY len:100]
                          valuesX:[WSData arrayWithFloat:valX len:100]];    
}

+ (WSData *)formFactorMeasured {
    float valX[18] = {0.0, 0.17306775, 0.23813451, 0.23994599, 0.37101561, 0.45683349,
                      0.46306743, 0.49940341, 0.55920269, 0.66019556, 0.7393494, 0.85105939,
                      0.87041902, 0.99880682, 1.0314793, 1.0586061, 1.1718771, 1.2387528};
    float valY[18] = {1.0000005, 0.75610929, 0.76087086, 0.75287411, 0.72127788, 0.63618437,
                      0.62304761, 0.57580846, 0.61681275, 0.56329839, 0.49413746, 0.44943152,
                      0.4977028, 0.41510993, 0.43655802, 0.45672842, 0.45617684, 0.3413864};
    float valYErr[18] = {0.0075954564, 0.11449882, 0.01476105, 0.029650447, 0.083726862, 0.018594996,
                         0.042297562, 0.022073302, 0.14295989, 0.029555484, 0.028302599, 0.038798588,
                         0.11020131, 0.031766869, 0.030660755, 0.10673311, 0.063659554, 0.024027183};
    
    return [WSData dataWithValues:[WSData arrayWithFloat:valY len:18]
                      valuesX:[WSData arrayWithFloat:valX len:18]
                    errorMinY:[WSData arrayWithFloat:valYErr len:18]
                    errorMaxY:[WSData data]
                    errorMinX:[WSData data]
                    errorMaxX:[WSData data]];
}

+ (WSData *)formFactorFit {
    float valX[10] = {0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9};
    float valY[10] = {1.0, 0.896757, 0.799042, 0.718385, 0.652562,
                      0.599865, 0.558939, 0.528684, 0.508188, 0.496682};
    float valYErr[10] = {0.001, 0.0291416, 0.0176946, 0.0117089, 0.0203548,
                         0.0349765, 0.0513111, 0.0685734, 0.0865171, 0.1050321};
    
    return [WSData dataWithValues:[WSData arrayWithFloat:valY len:10]
                      valuesX:[WSData arrayWithFloat:valX len:10]
                    errorMinY:[WSData arrayWithFloat:valYErr len:10]
                    errorMaxY:[WSData data]
                    errorMinX:[WSData data]
                    errorMaxX:[WSData data]];    
}

+ (WSData *)stocks1 {
    float rates[12] = {22.9, 24.8, 40.3, 36.7, 48.6, 48.3,
                       41.8, 47.4, 44.6, 56.2, 44.4, 66.8};
    WSData *result = [WSData dataWithValues:[WSData arrayWithFloat:rates
                                                               len:12]];
    
    return [result indexedData];
}

+ (WSData *)stocks2 {
    float rates[12] = {51.8, 74.3, 55.0, 68.7, 68.3, 68.1,
                       75.5, 91.2, 101.3, 129.9, 104.5, 113.2};
    WSData *result = [WSData dataWithValues:[WSData arrayWithFloat:rates
                                                               len:12]];
    
    return [result indexedData];
}

+ (WSData *)stocks3 {
    float rates[12] = {16.0, 15.1, 23.5, 12.5, 25.2, 24.4,
                       23.3, 30.1, 34.0, 67.6, 78.0, 62.9};
    WSData *result = [WSData dataWithValues:[WSData arrayWithFloat:rates
                                                               len:12]];
    
    return [result indexedData];    
}

+ (WSData *)stocks4 {
    float rates[12] = {36.1, 32.8, 38.9, 38.7, 37.4, 29.5,
                       25.3, 22.3, 19.0, 18.1, 17.4, 20.1};
    WSData *result = [WSData dataWithValues:[WSData arrayWithFloat:rates
                                                               len:12]];
    
    return [result indexedData];
}

+ (void)sineFunctionWithData:(WSData *)data
                        xmin:(CGFloat)xmin
                        xmax:(CGFloat)xmax
                      factor:(CGFloat)factor
                       phase:(CGFloat)phase
                      offset:(CGFloat)offset
                  resolution:(CGFloat)resolution {
    CGFloat step = (xmax-xmin)/resolution;

    [data removeAllData];
    for (CGFloat x=xmin; x<xmax+step; x+=step) {
        [data addDatum:[WSDatum datumWithValue:(offset+factor*sin(x+phase))
                                    valueX:x]];
    }
}

+ (WSData *)projectCostBad {
    float cashFlow[12] = { 100, 81, 65, 75, 73, 87,
                           92, 118, 129, 114, 135, 139 };
    WSData *result = [WSData dataWithValues:[WSData arrayWithFloat:cashFlow
                                                               len:12]];
    
    return [result indexedData];
}

+ (WSData *)totalProfitBad {
    float cashFlow[12] = { 0, -10, -17, -35, -6, 5,
                           2, 15, 29, 38, 51, 45 };
    WSData *result = [WSData dataWithValues:[WSData arrayWithFloat:cashFlow
                                                               len:12]];
    
    return [result indexedData];    
}

+ (WSData *)projectCostGood {
    float cashFlow[12] = { 100, 73, 51, 34, 23, 15,
                           22, 13, 9, 2, 8, 7 };
    WSData *result = [WSData dataWithValues:[WSData arrayWithFloat:cashFlow
                                                               len:12]];
    
    return [result indexedData];    
}

+ (WSData *)totalProfitGood {
    float cashFlow[12] = { 0, -10, -17, -8, 3, 9,
                           28, 22, 57, 89, 125, 259 };
    WSData *result = [WSData dataWithValues:[WSData arrayWithFloat:cashFlow
                                                               len:12]];
    
    return [result indexedData];    
}

@end
