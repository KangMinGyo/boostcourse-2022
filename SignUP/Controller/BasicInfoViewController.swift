//
//  BasicViewController.swift
//  SignUP
//
//  Created by Kang on 2022/01/30.
//

import UIKit

class BasicInfoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var ProfileImageView: UIImageView!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordCheckTextField: UITextField!
    @IBOutlet weak var selfIntroduceTextView: UITextView!
    @IBOutlet weak var nextUIButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapView(_:)))
        ProfileImageView.isUserInteractionEnabled = true
        ProfileImageView.addGestureRecognizer(tapGesture)
        
        nextUIButton.isEnabled = false
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

    // MARK: - Cancel Button
    @IBAction func cancelButton(_ sender: UIButton) {
        //취소버튼 누르면 정보 전체 삭제
        idTextField.text = ""
        passwordTextField.text = ""
        passwordCheckTextField.text = ""
    }
    
    // MARK: - Next Button
    
    @IBAction func textFieldValueChanged(_ sender: UITextField) {
        if idTextField.text != "" && passwordTextField.text != "" && passwordCheckTextField.text != "" {
            if passwordTextField.text == passwordCheckTextField.text {
                nextUIButton.isEnabled = true
            } else {
                nextUIButton.isEnabled = false
            }
        }
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        print("다음")
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
