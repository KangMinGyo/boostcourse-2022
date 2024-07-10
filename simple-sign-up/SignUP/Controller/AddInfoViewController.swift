//
//  AddInfoViewController.swift
//  SignUP
//
//  Created by Kang on 2022/01/30.
//

import UIKit

class AddInfoViewController: UIViewController {

    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var signUpButton: UIButton!
    
    let dateFormatter : DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.dateFormat = "MMMM d, YYYY"
        return formatter
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: UIControl.Event.valueChanged)
        
        signUpButton.isEnabled = false
    }
    
    @IBAction func phoneNumberCheck(_ sender: UITextField) {
        if phoneNumberTextField.text != "" {
            signUpButton.isEnabled = true
        } else {
            signUpButton.isEnabled = false
        }
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        let date: Date = sender.date
        let dateString: String = dateFormatter.string(from: date)
        dateLabel.text = dateString
    }
    
    @IBAction func signUp(_ sender: UIButton) {
        UserInfomation.shered.phoneNumber = phoneNumberTextField.text
    }
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
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
