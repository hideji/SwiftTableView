//
//  AppSearchStore.swift
//  SwiftTableView
//
//  Created by hideji on 2014/06/12.
//  Copyright (c) 2014 hideji. All rights reserved.
//

import Foundation


protocol AppSearchStoreProtocol {
    func didRecieveDataResults()
}

// TODO: FireAPIUtilを試験的に追加
class AppSearchStore:NSObject, UITableViewDataSource, APIUtilProtocol, FireAPIUtilProtocol
{

    var appModel: AppModel = AppModel.sharedInstance
    let kCellIdentifier: String = "SearchResultCell"
    var delegate: AppSearchStoreProtocol?
    var api: APIUtil = APIUtil()
    var fireApi: FireAPIUtil = FireAPIUtil()
    var searchWord: String
    
    override init(){
        self.searchWord = ""
        super.init()
    }
    
    convenience init(searchWord:String) {
        self.init()
        api.delegate = self
        self.searchWord = searchWord
        api.searchItunesFor(self.searchWord)
        
        fireApi.delegate = self
        fireApi.searchItunesFor(self.searchWord)
    }
    
    func searchItunes(word:String) {
        self.searchWord = word
        api.searchItunesFor(self.searchWord)
    }

    // MARK: UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appModel.count()
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: SearchViewCell = tableView.dequeueReusableCellWithIdentifier(kCellIdentifier) as SearchViewCell
        cell.result = appModel.getApp(indexPath.row)
        return cell
    }
    

    // MARK: APIUtilProtocol
    func didRecieveAPIResults(results: NSDictionary) {
        // Store the results in our table data array
        
        if results.count > 0 {
            var tmpApps:[AppEntity] = []
            
            for appData in results["results"] as NSArray {
                let app:AppEntity = AppEntity(titleName: appData["trackName"] as String, price: appData["formattedPrice"] as NSString, url: appData["artworkUrl60"] as NSString, url512: appData["artworkUrl512"] as NSString, desc: appData["description"] as NSString)
                appModel.appendApp(app)
            }
            
            self.delegate?.didRecieveDataResults()
        }
    }
    
    func didRecieveAPIResults2(results: NSDictionary) {
        
    }
    
}