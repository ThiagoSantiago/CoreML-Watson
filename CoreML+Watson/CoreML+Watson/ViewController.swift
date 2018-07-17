//
//  ViewController.swift
//  CoreML+Watson
//
//  Created by Thiago Santiago on 17/07/18.
//  Copyright © 2018 Thiago Santiago. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageChoosed: UIImageView!
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
    }
    
    @IBAction func takePictureButtonPressed(sender: AnyObject) {
        let optionMenu = UIAlertController(title:"Take a picture", message: "Choose an image from your galery or take a new one.", preferredStyle: .actionSheet)
        
        let chooseAPicture = UIAlertAction(title: "Choose a picture", style: .default, handler: { _ in
            self.imagePicker.sourceType = .photoLibrary
            self.present(self.imagePicker, animated: true, completion: nil)
            print("Choose a picture")
        })
        
        let takeANewPicture = UIAlertAction(title: "Take a picture", style: .default) { _ in
            self.imagePicker.sourceType = .camera
            self.present(self.imagePicker, animated: true, completion: nil)
            print("Take a picture")
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("Cancel")
        }
        
        optionMenu.addAction(chooseAPicture)
        optionMenu.addAction(takeANewPicture)
        optionMenu.addAction(cancel)
        
        self.present(optionMenu, animated: true, completion: nil)
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            print("No image found")
            return
        }
        
        imageChoosed.image = image
    }
}



