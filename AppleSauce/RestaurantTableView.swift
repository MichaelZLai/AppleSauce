//
//  RestaurantTableView.swift
//  AppleSauce
//
//  Created by Rahul Chandra on 1/12/19.
//  Copyright © 2019 Rahul Chandra. All rights reserved.
//

import UIKit

class RestaurantTableView: UITableView {
    
  
    
    var likelyFoods = [String]()
    var caption = ""
    var calories = [Int]()
    
    
    
    override var numberOfSections: Int{
        return 1
    }
    
    override func numberOfRows(inSection: Int) -> Int{
        return 3
    }
    
    override func cellForRow(at indexPath: IndexPath) -> UITableViewCell? {
        let cell = dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as! RestaurantTableViewCell
        cell.foodName.text = "hello"
        return cell
    }
    
    
    

    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
