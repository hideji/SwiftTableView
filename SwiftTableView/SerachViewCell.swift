//
//  SerachViewCell.swift
//  SwiftTableView
//
//  Created by hideji on 2014/06/13.
//  Copyright (c) 2014 hideji. All rights reserved.
//

import Foundation

class SearchViewCell: UITableViewCell {
    @IBOutlet var titleLable : UILabel
    @IBOutlet var priceLable : UILabel
    @IBOutlet var imView : UIImageView
    
    // Nib
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLable.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 0.8)
        priceLable.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 0.8)
        
    }
    
    // Cell
    func configureCell(result:AppModel, atIndexPath indexPath: NSIndexPath){
        imView.setImageWithURL(result.imageURL)
        titleLable.text = result.titleName
        priceLable.text = result.price
        
    }
}