//
//  DMViewController.m
//  daummap
//
//  Created by Youngju Park on 12. 8. 6..
//  Copyright (c) 2012년 onefm2. All rights reserved.
//

#import "DMViewController.h"
#import "DMMapViewController.h"

@interface DMViewController ()

@end

@implementation DMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (IBAction)showDaumMap:(id)sender
{
    DMMapViewController *mapViewController = [[DMMapViewController alloc] initWithNibName:@"DMMapViewController" bundle:[NSBundle mainBundle]];
    [self presentModalViewController:mapViewController animated:YES];
    [mapViewController release];
}

@end
