//
//  ViewController.swift
//  SwiftTableView
//
//  Created by hideji on 2014/06/11.
//  Copyright (c) 2014 hideji. All rights reserved.
//

import UIKit
import QuartzCore

class SearchViewController: UIViewController, UITableViewDelegate, AppSearchStoreProtocol, UISearchBarDelegate {
    
    @IBOutlet weak var appsTableView : UITableView!
    @IBOutlet weak var titleBar : UINavigationItem!
    
    var appModel:AppModel = AppModel.sharedInstance
    
    var store = AppSearchStore(searchWord:"Angry Bird")
    let searchBar = UISearchBar()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        store.delegate = self
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.titleBar.titleView = searchBar
        self.titleBar.titleView?.frame =  CGRectMake(0, 0, 320, 44)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SVProgressHUD.show()
        self.appsTableView.dataSource = self.store
        self.appsTableView.rowHeight = UITableViewAutomaticDimension
        self.searchBar.tintColor = UIColor.darkGrayColor()
        self.searchBar.placeholder = "eg. Angry Bird"
        //self.searchBar.keyboardType = UIKeyboardTypeDefault()
        self.searchBar.delegate = self;
        self.searchBar.resignFirstResponder()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: UITableViewDelegate
    
    func tableView(tableView: UITableView!, willDisplayCell cell: UITableViewCell!, forRowAtIndexPath indexPath: NSIndexPath!) {
        
        var visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .Light)) as UIVisualEffectView
        visualEffectView.frame = cell.frame
        
        cell.layer.transform = CATransform3DMakeScale(0.1,0.1,1)
        cell.addSubview(visualEffectView)
        
        
        UIView.animateWithDuration(0.5, animations: {
            cell.layer.transform = CATransform3DMakeScale(1,1,1)
            visualEffectView.removeFromSuperview()
        })
        self.searchBar.resignFirstResponder()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // FIXME: When use custom Segue.カスタムセグエを使うと、NextSegueが一度呼ばれた後に呼ばれる
        appModel.selected = indexPath.row
        
        //var seguename:NSString = "tableToDetail"
        //self.performSegueWithIdentifier(seguename, sender: self.appsTableView)

    }
    

    
    // MARK: AppSearchStoreProtocol
    func didRecieveDataResults() {
        // Store the results in our table data array
        self.appsTableView.reloadData()
        SVProgressHUD.dismiss()
    }
    
    
    // MARK: UISearchBarDelegate
    func searchBarSearchButtonClicked(searchBar: UISearchBar!) {
        // called when keyboard search button pressed
        //println(searchBar.text)
        self.searchBar.resignFirstResponder()
        store.searchItunes(searchBar.text)
        SVProgressHUD.show()
    }
    
}


