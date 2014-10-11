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
    func didRecieveAlamoAPIResults(results: JSON)
}

class FireAPIUtil: NSObject {
    var delegate:FireAPIUtilProtocol?
    
    
    func getTypeName(v: Any) -> String {
        let fullName = _stdlib_demangleName(_stdlib_getTypeName(v))
        if let range = fullName.rangeOfString(".") {
            return fullName.substringFromIndex(range.endIndex)
        }
        return fullName
    }
    
    func searchItunesFor(searchTerm:String) {
        
        var itunesSearchTerm: NSString = searchTerm.stringByReplacingOccurrencesOfString(" ", withString: "+", options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil)
        
        var escapedSearchTerm: NSString = itunesSearchTerm.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
        var urlPath: NSString = "https://itunes.apple.com/search?term=\(escapedSearchTerm)&media=software"
        
  
        Alamofire.request(.GET, String(urlPath)).responseJSON  { (request, response, responseData, error) -> Void in
            let json = JSON(object: responseData!)
            //println(self.getTypeName(json))
            //var responseJSON: SwiftyJSON.JSON
            //let dict : NSDictionary = self.translateFromJSON(json)

            self.delegate?.didRecieveAlamoAPIResults(json)
        }
    }
    

}