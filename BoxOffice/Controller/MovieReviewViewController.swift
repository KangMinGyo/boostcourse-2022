//
//  MovieReviewViewController.swift
//  BoxOffice
//
//  Created by Kang on 2022/02/10.
//

import UIKit

class MovieReviewViewController: UIViewController {

    @IBOutlet weak var nickNameTextField: UITextField!
    @IBOutlet weak var reviewTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "한줄평 작성"
        //textView 테두리
        reviewTextView.layer.borderWidth = 0.5
        reviewTextView.layer.borderColor = UIColor.systemGray4.cgColor
    }
    
    
    @IBAction func touchUpCompleteButton(_ sender: UIBarButtonItem) {
        CommentInfomation.shared.nickName = nickNameTextField.text
        CommentInfomation.shared.comment = reviewTextView.text
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
