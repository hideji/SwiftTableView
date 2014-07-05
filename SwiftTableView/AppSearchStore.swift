//
//  AppSearchStore.swift
//  SwiftTableView
//
//  Created by hideji on 2014/06/12.
//  Copyright (c) 2014 hideji. All rights reserved.
//

import Foundation


protocol AppSearchStoreProtocol {
    func didRecieveDataResults(apps: AppModel[])
}

class AppSearchStore:NSObject, UITableViewDataSource, APIUtilProtocol
{

    var apps:AppModel[] = []
    let kCellIdentifier: String = "SearchResultCell"
    var delegate:AppSearchStoreProtocol?
    var api: APIUtil = APIUtil()
    var searchWord:String
    
    init(){
        self.searchWord = ""
        super.init()
    }
    
    convenience init(searchWord:String) {
        self.init()
        api.delegate = self
        self.searchWord = searchWord
        api.searchItunesFor(self.searchWord)
    }
    
    func searchItunes(word:String) {
        self.searchWord = word
        api.searchItunesFor(self.searchWord)
    }

    // MARK: UITableViewDataSource
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return  apps.count
    }
    
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        var cell: SearchViewCell = tableView.dequeueReusableCellWithIdentifier(kCellIdentifier) as SearchViewCell
        if cell == nil {
            cell = SearchViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: kCellIdentifier)
        }
        cell.configureCell(apps[indexPath.row], atIndexPath : indexPath)
        return cell
    }
    

    // MARK: APIUtilProtocol
    func didRecieveAPIResults(results: NSDictionary) {
        // Store the results in our table data array
        
        if results.count>0 {
            var tmpApps:AppModel[] = []
            //self.tableData = results["results"] as NSArray
            for appData in results["results"] as NSArray {
                let app:AppModel = AppModel(titleName: appData["trackName"] as String, price: appData["formattedPrice"] as NSString, url: appData["artworkUrl60"] as NSString, url512: appData["artworkUrl512"] as NSString, desc: appData["description"] as NSString)
                tmpApps += app
            }
            self.apps = tmpApps.copy()
            self.delegate?.didRecieveDataResults(self.apps)
        }
    }
    
}