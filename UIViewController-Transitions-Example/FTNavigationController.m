//
//  FTNavigationController.m
//
//  Created by Ortwin Gentz on 24.01.14.
//  Copyright (c) 2014 FutureTap. All rights reserved.
//

#import "FTNavigationController.h"
#import "TLMenuInteractor.h"

@interface FTNavigationController ()

@end

@implementation FTNavigationController

- (UIStatusBarStyle)preferredStatusBarStyle {
	// ugly: responsibilities aren't separated well (proof of concept, only!)
	TLMenuInteractor *interactor = (id)self.presentedViewController.transitioningDelegate;
	if (![interactor isKindOfClass:TLMenuInteractor.class]) {
		interactor = nil;
	}
	if (self.presentedViewController && (!self.presentedViewController.isBeingDismissed || interactor.canceled)) {
		return self.presentedViewController.preferredStatusBarStyle;
	}
	
	
    return [super preferredStatusBarStyle];
}

- (UIViewController*)childViewControllerForStatusBarStyle {
	if (self.presentedViewController) {
		return self.presentedViewController.childViewControllerForStatusBarStyle;
	}

	return [super childViewControllerForStatusBarStyle];
}


@end
