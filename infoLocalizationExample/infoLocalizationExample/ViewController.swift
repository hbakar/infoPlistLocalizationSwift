//
//  ViewController.swift
//  infoLocalizationExample
//
//  Created by Hüseyin BAKAR on 17.07.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var btnTakePicture: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.backgroundColor = .secondarySystemBackground
        // Do any additional setup after loading the view.
    }

    @IBAction func btnTakePictureClicked(_ sender: Any)
    {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    
}

extension ViewController : UIImagePickerControllerDelegate,UINavigationControllerDelegate
{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true,completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true,completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {return}
        imageView.image = image
    }
}
