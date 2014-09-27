//
//  AlamofireUtil.swift
//  SwiftTableView
//
//  Created by clavier on 2014/09/27.
//  Copyright (c) 2014年 hideji. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol FireAPIUtilProtocol {
    func didRecieveAPIResults2(results: NSDictionary)
}

class FireAPIUtil: NSObject {
    var delegate:FireAPIUtilProtocol?
    
    
    func searchItunesFor(searchTerm:String) {
        
        
        
        var itunesSearchTerm: NSString = searchTerm.stringByReplacingOccurrencesOfString(" ", withString: "+", options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil)
        
        var escapedSearchTerm: NSString = itunesSearchTerm.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
        var urlPath: NSString = "https://itunes.apple.com/search?term=\(escapedSearchTerm)&media=software"
        
        
        Alamofire.request(.GET, String(urlPath)).response  { (request, response, object, error) in
//            let json = JSON(object: object)
            var responseJSON: SwiftyJSON.JSON
            if let unwrappedData = object as? NSData {
                let json = SwiftyJSON.JSON(unwrappedData, nil, nil)
            }
            println("----------------------------------------")
            //println(json)
            println("----------------------------------------")
            self.delegate?.didRecieveAPIResults2(["key0" : "value0"] as NSDictionary)
        }
        
//        let manager :AFHTTPSessionManager = AFHTTPSessionManager()
//        manager.GET(urlPath, parameters:nil,
//            success: { (task, responseObject) -> Void in
//                self.delegate?.didRecieveAPIResults(responseObject as NSDictionary)
//                println("Success")
//            },
//            failure:{ (task, error) -> Void in
//                println("Connection failed.\(error.localizedDescription)")
//                println("Failure:\(urlPath)")
//        })
        
    }
}