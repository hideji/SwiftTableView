//
//  APIUtil.swift
//  SwiftTableView
//
//  Created by hideji on 2014/06/11.
//  Copyright (c) 2014 hideji. All rights reserved.
//

import Foundation

protocol APIUtilProtocol {
    func didRecieveAPIResults(results: NSDictionary)
}

class APIUtil: NSObject {
    var delegate:APIUtilProtocol?
    
    func searchItunesFor(searchTerm:String) {
        
        var itunesSearchTerm: NSString = searchTerm.stringByReplacingOccurrencesOfString(" ", withString: "+", options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil)
        
        var escapedSearchTerm: NSString = itunesSearchTerm.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
        var urlPath: NSString = "https://itunes.apple.com/search?term=\(escapedSearchTerm)&media=software"

        
        let manager :AFHTTPSessionManager = AFHTTPSessionManager()
        manager.GET(urlPath, parameters:nil,
            success: { (task, responseObject) -> Void in
                self.delegate?.didRecieveAPIResults(responseObject as NSDictionary)
                println("Success")
            },
            failure:{ (task, error) -> Void in
                println("Connection failed.\(error.localizedDescription)")
                println("Failure:\(urlPath)")
            })
        
    }
    
}