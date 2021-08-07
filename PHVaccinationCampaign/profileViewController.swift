//
//  profileViewController.swift
//  PHVaccinationCampaign
//
//  Created by Antoinette Marie Torres on 8/7/21.
//

import UIKit

class profileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imagePicker = UIImagePickerController()
    
    let checkbox1 = CircularCheckbox(frame: CGRect(x: 204, y: 578, width: 40, height: 40))
    let checkbox2 = CircularCheckbox(frame: CGRect(x: 204, y: 623, width: 40, height: 40))
    

    @IBOutlet weak var nameTextField: UITextField!
    func getName () -> String? {
         return nameTextField.text
    }
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var idNumTextField: UITextField!
    @IBOutlet weak var vaccineTypeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        view.addSubview(checkbox1)
        view.addSubview(checkbox2)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapCheckbox))
        checkbox1.addGestureRecognizer(gesture)
        
        let gesture2 = UITapGestureRecognizer(target: self, action: #selector(didTapCheckbox2))
        checkbox2.addGestureRecognizer(gesture2)
    }
    
    @objc func didTapCheckbox() {
        checkbox1.toggle()
    }
    
    @objc func didTapCheckbox2() {
        checkbox2.toggle()
    }
    
    @IBAction func takeSelfieTapped(_ sender: UIButton) {
        imagePicker.sourceType = .camera
                
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func photoLibraryTapped(_ sender: UIButton) {
        imagePicker.sourceType = .photoLibrary
                
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBOutlet weak var displayImage: UIImageView!
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            displayImage.image = selectedImage
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    

    @IBAction func submitButtonTapped(_ sender: UIButton) {
    }
    
}

class CircularCheckbox: UIView {
    
    private var isChecked = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.label.cgColor
        layer.cornerRadius = frame.size.width / 2.0
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func toggle() {
        self.isChecked = !isChecked
        if isChecked {
            backgroundColor = .systemBlue
        }
        else {
            backgroundColor = .systemBackground
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        layer.borderColor = UIColor.label.cgColor
    }
}
