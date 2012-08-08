//
//  DMMapViewController.h
//  daummap
//
//  Created by Youngju Park on 12. 8. 6..
//  Copyright (c) 2012년 onefm2. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DaumMap/MTMapView.h>
#import <DaumMap/MTMapPOIItem.h>
#import <DaumMap/MTMapReverseGeoCoder.h>

@interface DMMapViewController : UIViewController <MTMapViewDelegate, MTMapReverseGeoCoderDelegate>
{
    MTMapView *mapVIew;
    
}


@property (nonatomic, retain) MTMapView *mapView;
@end
