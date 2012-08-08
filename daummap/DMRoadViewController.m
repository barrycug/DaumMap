//
//  DMRoadViewController.m
//  daummap
//
//  Created by Youngju Park on 12. 8. 7..
//  Copyright (c) 2012년 onefm2. All rights reserved.
//

#import "DMRoadViewController.h"

@interface DMRoadViewController ()

@end

@implementation DMRoadViewController
@synthesize webView;
@synthesize Lat, Lng;

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
    [self loadHTML:@"sss"];
}

- (void)showRoadView
{
    
    NSString *js = [NSString stringWithFormat:@"showRoadview(%lg,%lg)",[Lat doubleValue], [Lng doubleValue]];
    [self writeJavascript:js];
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

- (NSString*) writeJavascript:(NSString*)javascript
{
	return [webView stringByEvaluatingJavaScriptFromString:javascript];
}

- (void)loadHTML:(NSString *)htmlString
{
	NSString* startFilePath = [self pathForResource:@"roadview.html"];
	NSURL* appURL  = nil;
    NSString* loadErr = nil;
    
    if (startFilePath == nil) {
        loadErr = [NSString stringWithFormat:@"ERROR: Start Page at '%@/%@' was not found.", @"www", @"roadview.html"];
        NSLog(@"%@", loadErr);
        appURL = nil;
    } else {
        appURL = [NSURL fileURLWithPath:startFilePath];
    }
    
    if (!loadErr) {
        NSURLRequest *appReq = [NSURLRequest requestWithURL:appURL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        [self.webView loadRequest:appReq];
    } else {
        NSString* html = [NSString stringWithFormat:@"<html><body> %@ </body></html>", loadErr];
        [self.webView loadHTMLString:html baseURL:nil];
    }
}

- (NSString*) pathForResource:(NSString*)resourcepath
{
    NSBundle * mainBundle = [NSBundle mainBundle];
    NSMutableArray *directoryParts = [NSMutableArray arrayWithArray:[resourcepath componentsSeparatedByString:@"/"]];
    NSString       *filename       = [directoryParts lastObject];
    [directoryParts removeLastObject];
    
    NSString* directoryPartsJoined =[directoryParts componentsJoinedByString:@"/"];
    NSString* directoryStr = @"www";
    
    if ([directoryPartsJoined length] > 0) {
        directoryStr = [NSString stringWithFormat:@"%@/%@", @"www", [directoryParts componentsJoinedByString:@"/"]];
    }
    
    return [mainBundle pathForResource:filename ofType:@"" inDirectory:directoryStr];
}


#pragma mark - UIWebView Delegate
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"Error : %@", [error description]);
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"Finished.");
    [self showRoadView];
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"Starting");
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
}





@end