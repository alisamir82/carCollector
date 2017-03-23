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
    
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var addUpdateButton: UIButton!
    
    var imagePicker = UIImagePickerController()
    
    var car : Car? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
        if car != nil {
            carImageView.image = UIImage(data: car?.image as! Data)
            titleTextField.text = car?.title
            addUpdateButton.setTitle("Update", for: .normal)
        }else
        {
            deleteButton.isHidden = true
            
        }
        
    }
    
    
    
    @IBAction func cameraTapped(_ sender: Any) {
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
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
        
        
        if car != nil {
            
            car!.title = titleTextField.text!
            car!.image = UIImagePNGRepresentation(carImageView.image!) as NSData?
            
            
        }else {
            
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let car = Car(context: context)
            
            car.title = titleTextField.text!
            car.image = UIImagePNGRepresentation(carImageView.image!) as NSData?
            
        }
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
    }
    
    
    @IBAction func deleteButton(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(car!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
         navigationController!.popViewController(animated: true)
    }
}
