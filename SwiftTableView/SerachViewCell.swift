//
//  SerachViewCell.swift
//  SwiftTableView
//
//  Created by hideji on 2014/06/13.
//  Copyright (c) 2014 hideji. All rights reserved.
//

import UIKit

class SearchViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLable : UILabel! = nil
    @IBOutlet weak var priceLable : UILabel! = nil
    @IBOutlet weak var imView : UIImageView! = nil
    
    var result: AppEntity! {
        didSet {
            //var imageURL:NSURL = result.imageURL!
            self.imView.setImageWithURL(result.imageURL)
            self.titleLable.text = result.titleName
            self.priceLable.text = result.price
        }
    }
    
    // Nib
    override func awakeFromNib() {
        super.awakeFromNib()
        self.titleLable.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 0.8)
        self.priceLable.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 0.8)
        
    }
    
}