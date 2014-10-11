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
//        if (self.identifier == "tableToDetail")
//        {
        
        var srcViewController:SearchViewController = self.sourceViewController as SearchViewController
        var distViewController:DetailsViewController = self.destinationViewController as DetailsViewController
        //println(srcViewControl)
        //var index = srcViewController.selectIndex
        // TODO:
        //distViewController.app = srcViewController.apps[index]
        //distViewController.app?.titleName
        
        UIView.transitionWithView(srcViewController.view,
            duration: 0.5,
            options: .TransitionFlipFromLeft,
            animations: { _ in //fromView.removeFromSuperview(); 
                srcViewController.view.addSubview(distViewController.view) },
            completion: { _ in
                srcViewController.presentViewController(distViewController, animated:false, completion:nil)
            })
//        }
    }
}