//
//  DMRoadViewController.h
//  daummap
//
//  Created by Youngju Park on 12. 8. 7..
//  Copyright (c) 2012년 onefm2. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DMRoadViewController : UIViewController <UIWebViewDelegate>
{
    UIWebView *webView;
    NSNumber *Lat;
    NSNumber *Lng;
}

@property (nonatomic, retain) IBOutlet UIWebView *webView;
@property (nonatomic, retain) NSNumber *Lat;
@property (nonatomic, retain) NSNumber *Lng;

- (NSString*) writeJavascript:(NSString*)javascript;
- (void)loadHTML:(NSString *)htmlString;
- (void)showRoadView;
@end
