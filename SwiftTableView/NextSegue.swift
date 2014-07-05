//
//  NextSegue.swift
//  SwiftTableView
//
//  Created by hideji on 2014/06/14.
//  Copyright (c) 2014 clavier. All rights reserved.
//

import Foundation

class NextSegue:UIStoryboardSegue {
    
    override func perform() {
        var srcViewController:UIViewController = self.sourceViewController as UIViewController
        var distViewController:UIViewController = self.destinationViewController as UIViewController
        
        UIView.transitionWithView(srcViewController.view,
            duration: 0.5,
            options: .TransitionFlipFromLeft,
            animations: { _ in //fromView.removeFromSuperview(); 
                srcViewController.view.addSubview(distViewController.view) },
            completion: { _ in
                srcViewController.presentViewController(distViewController, animated:false, completion:nil)
            })
    }
}