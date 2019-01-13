//
//  ViewController.swift
//  AppleSauce
//
//  Created by Rahul Chandra on 1/12/19.
//  Copyright © 2019 Rahul Chandra. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    var likelyFoods = [String]()
    var caption = ""
    var calories = [Int]()
    
    
    
    let imagePicker = UIImagePickerController()
    var image1:UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imagePicker.delegate = self
        
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imageView.image = image
            image1 = image
            let imageData = imageView.image?.jpegData(compressionQuality: 1)
            if(imageData != nil){
                print("hey")
            }
            likelyFoods.append("hello")
            calories.append(1)
            caption = "aasdf"
            performSegue(withIdentifier: "foodOptions", sender: Any?.self)
            imagePicker.dismiss(animated: true, completion: nil)
            
        }
        else{
            print("oopsie getting image")
        }
    }
    
    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = false
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "foodOptions" {
            var vc:foodOptions = segue.destination as! foodOptions
            vc.text = "3256"
            vc.newImage = image1
            vc.likelyFoods = self.likelyFoods
            vc.caption = self.caption
            vc.calories = self.calories
        }
    }
}

