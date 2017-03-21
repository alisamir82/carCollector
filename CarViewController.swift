//
//  CarViewController.swift
//  CarCollector
//
//  Created by Work on 21/03/2017.
//  Copyright © 2017 compume. All rights reserved.
//

import UIKit

class CarViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    
    var imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
    }
    
    
    
    @IBAction func cameraTapped(_ sender: Any) {
    }
    
    @IBAction func photosTapped(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        carImageView.image = image
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    @IBAction func addTapped(_ sender: Any) {
    }
}
