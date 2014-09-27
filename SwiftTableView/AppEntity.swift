//
//  Result.swift
//  SwiftTableView
//
//  Created by hideji on 2014/06/13.
//  Copyright (c) 2014 hideji. All rights reserved.
//

import Foundation

class AppEntity: NSObject {
    
    let titleName:NSString      //title
    let price:NSString          //price
    let imageURL:NSURL
    let artworkUrl512:NSURL
    let appDescription:NSString
    
    // initialize
    init(titleName: String, price: String, url:String, url512:String, desc:String) {
        self.titleName = titleName
        self.price = price
        self.imageURL = NSURL(string: url)
        self.artworkUrl512 = NSURL(string: url512)
        self.appDescription  = desc
    }
}