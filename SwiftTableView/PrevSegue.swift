//
//  PrevSegue.swift
//  SwiftTableView
//
//  Created by hideji on 2014/06/15.
//  Copyright (c) 2014 hideji. All rights reserved.
//

import Foundation

class PrevSegue:UIStoryboardSegue {
    
    override func perform() {
        var srcViewController:UIViewController = self.sourceViewController as UIViewController
        var distViewController:UIViewController = self.destinationViewController as UIViewController
        
        UIView.transitionWithView(srcViewController.view,
            duration: 0.5,
            options: .TransitionFlipFromTop,
            animations: { _ in //fromView.removeFromSuperview();
                srcViewController.view.addSubview(distViewController.view) },
            completion: { _ in
                srcViewController.dismissViewControllerAnimated(false, completion:nil)
            })
    }
}