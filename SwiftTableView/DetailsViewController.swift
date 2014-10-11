//
//  DetailsViewController.swift
//  SwiftTableView
//
//  Created by hideji on 2014/06/13.
//  Copyright (c) 2014 hideji. All rights reserved.
//

import Foundation

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var image : UIImageView!
    @IBOutlet weak var textView : UITextView!
    @IBOutlet weak var titleBar : UINavigationItem!
    
    var app:AppEntity?
    let appModel:AppModel = AppModel.sharedInstance
    

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let settingsImage = UIImage(named: "settingsButton")
        let leftBarButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.Plain, target: self, action: "moveToDetailView")
        self.titleBar.leftBarButtonItem = leftBarButton
        self.app = appModel.getApp(appModel.selected)
        self.titleBar.title = app!.titleName
        self.image.setImageWithURL(app!.artworkUrl512)
        self.textView.text = app!.appDescription
        
    }
    
    func moveToDetailView() {
        self.performSegueWithIdentifier("detailToTable", sender:self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        println(segue.description)
    
    }
}