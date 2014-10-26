//
//  AppModel.swift
//  SwiftTableView
//
//  Created by hideji on 2014/09/27.
//  Copyright (c) 2014 hideji. All rights reserved.
//

import Foundation

class AppModel: NSObject {
    
    private var apps:[AppEntity] = []
    var selected:Int = 0
    
    class var sharedInstance :AppModel {
    struct Static {
        static let instance = AppModel()
        }
        return Static.instance
    }
    
    func appendApp(app:AppEntity) {
        apps.append(app)
    }
    
    func count()->Int {
        return apps.count
    }
    
    func getApp(index:Int)->AppEntity {
        return apps[index]
    }
    
    func concatApp(apps:[AppEntity]) {
        
    }

}