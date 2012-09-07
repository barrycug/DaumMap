//
//  DMMapViewController.m
//  daummap
//
//  Created by Youngju Park on 12. 8. 6..
//  Copyright (c) 2012년 onefm2. All rights reserved.
//

#import "DMMapViewController.h"
#import "DMRoadViewController.h"
#define DaumMapAPIKEY @"APIKey"
@interface DMMapViewController ()

@end

@implementation DMMapViewController
@synthesize mapView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    BOOL isIPad = [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad;
	CGRect mapViewFrame = CGRectMake(0, 0, 320, 460);
	if (isIPad) {
		mapViewFrame = CGRectMake(0, 0, 768, 1004);
	}
	mapView = [[MTMapView alloc] initWithFrame:mapViewFrame];
    //    mapView = [[MTMapView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    [mapView setDaumMapApiKey:DaumMapAPIKEY];
    mapView.delegate = self;
    mapView.baseMapType = MTMapTypeStandard;
    [self.view addSubview:mapView];
    
    [mapView setZoomLevel:2 animated:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - DaumMap Delegate
- (void)MTMapView:(MTMapView *)mapView openAPIKeyAuthenticationResultCode:(int)resultCode resultMessage:(NSString *)resultMessage
{
    if (!(resultCode == 200)) {
        UIAlertView *aAlertView = [[UIAlertView alloc] initWithTitle:@"다음지도"
                                                             message:@"실패"
                                                            delegate:self
                                                   cancelButtonTitle:@"확인"
                                                   otherButtonTitles:nil];
        [aAlertView show];
        [aAlertView release];
    }
    
}

- (void)MTMapView:(MTMapView *)mapView longPressOnMapPoint:(MTMapPoint *)mapPoint
{
    DMRoadViewController *roadViewController = [[DMRoadViewController alloc] initWithNibName:@"DMRoadViewController" bundle:[NSBundle mainBundle]];

    NSNumber *lat = [NSNumber numberWithDouble:mapPoint.mapPointGeo.latitude];
    NSNumber *lng = [NSNumber numberWithDouble:mapPoint.mapPointGeo.longitude];
    [roadViewController setLat:lat];
    [roadViewController setLng:lng];
    
    [self presentModalViewController:roadViewController animated:NO];
//    [roadViewController showRoadView];
    
    
}

- (void)MTMapView:(MTMapView *)mapView updateCurrentLocation:(MTMapPoint *)location withAccuracy:(MTMapLocationAccuracy)accuracy
{
    
}

#pragma mark - RoadView (webView)
- (NSString *)roadViewSetMapPoint:(MTMapPoint *)mapPoint
{
    NSString *htmlString;
    
    
    htmlString = [[NSString alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://dna.daum.net/examples/maps/maps3/roadview.html"]] encoding:NSUTF8StringEncoding];
    
    
    
    
    return htmlString;
    
}
@end
