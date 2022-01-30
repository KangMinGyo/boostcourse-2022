//
//  ViewController.swift
//  SignUP
//
//  Created by Kang on 2022/01/29.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var loginCompleteLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.signInButton.isEnabled = false
        self.idTextField.text = UserInfomation.shered.id
        self.loginCompleteLabel.text = ""
    }

    @IBAction func passwordCheck(_ sender: UITextField) {
        if passwordTextField.text == UserInfomation.shered.password {
            signInButton.isEnabled = true
        }
    }
    
    @IBAction func signIn(_ sender: UIButton) {
        loginCompleteLabel.text = "로그인 완료!"
    }
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
}

