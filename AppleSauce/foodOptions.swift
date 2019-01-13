//
//  foodOptions.swift
//  AppleSauce
//
//  Created by Rahul Chandra on 1/12/19.
//  Copyright © 2019 Rahul Chandra. All rights reserved.
//

import UIKit

class foodOptions: UIViewController {

    @IBOutlet weak var captionOutlet: UILabel!
    @IBOutlet weak var selectedImage: UIImageView?
    
    var newImage: UIImage?
    var text = ""
    
    var likelyFoods = [String]()
    var caption = ""
    var calories = [Int]()
    
    override func viewDidLoad() {
       super.viewDidLoad()
        captionOutlet.text = caption
        print(text)
        selectedImage?.image = newImage
        var vc = RestaurantTableView()
        vc.likelyFoods = self.likelyFoods
        vc.caption=self.caption
        vc.calories = self.calories
        
        
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
