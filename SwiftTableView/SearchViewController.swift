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
    
    @IBOutlet var appsTableView : UITableView
    @IBOutlet var titleBar : UINavigationItem
    
    var apps:AppModel[] = []
    var store = AppSearchStore(searchWord:"Angry Bird")
    var searchBar = UISearchBar()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        store.delegate = self
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.titleBar.titleView = searchBar
        self.titleBar.titleView.frame = CGRectMake(0, 0, 320, 44)
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
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject) {
        println(segue.description)
        var detailsViewController: DetailsViewController = segue.destinationViewController as DetailsViewController
        var index = appsTableView.indexPathForSelectedRow().row
        var selectedApp = self.apps[index]
        detailsViewController.app = selectedApp
    }
    
    
    
    // MARK: UITableViewDelegate
    
    func tableView(tableView: UITableView!, willDisplayCell cell: UITableViewCell!, forRowAtIndexPath indexPath: NSIndexPath!) {
        
        cell.layer.transform = CATransform3DMakeScale(0.1,0.1,1)
        UIView.animateWithDuration(0.25, animations: {
            cell.layer.transform = CATransform3DMakeScale(1,1,1)
            })
        self.searchBar.resignFirstResponder()
    }
    
    
    // MARK: AppSearchStoreProtocol
    func didRecieveDataResults(apps: AppModel[]) {
        // Store the results in our table data array
        self.apps = apps
        self.appsTableView.reloadData()
        SVProgressHUD.dismiss()
    }
    
    
    // MARK: UISearchBarDelegate
    func searchBarSearchButtonClicked(searchBar: UISearchBar!) {
        // called when keyboard search button pressed
        println(searchBar.text)
        self.searchBar.resignFirstResponder()
        store.searchItunes(searchBar.text)
        SVProgressHUD.show()
    }
    
}


