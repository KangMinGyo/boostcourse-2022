//
//  MovieCommetTableViewCell.swift
//  BoxOffice
//
//  Created by Kang on 2022/02/10.
//

import UIKit

class MovieCommetTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var dateAndTimeLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
