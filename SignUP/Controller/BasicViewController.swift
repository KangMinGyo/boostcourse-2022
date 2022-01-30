//
//  BasicViewController.swift
//  SignUP
//
//  Created by Kang on 2022/01/30.
//

import UIKit

class BasicViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var ProfileImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapView(_:)))
        ProfileImageView.isUserInteractionEnabled = true
        ProfileImageView.addGestureRecognizer(tapGesture)
    }
    
    // MARK: - ImagePicker
    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        return picker
    } ()

    //이미지 불러오기를 위한 Tap Gesture
    @IBAction func imageTapView(_ sender: UITapGestureRecognizer) {
        self.present(self.imagePicker, animated: true, completion: nil)
    }

    //이미지 선택 후
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let profileImage: UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.ProfileImageView.image = profileImage
        }
        self.dismiss(animated: true, completion: nil)
    }

    //이미지 선택 취소
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
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
