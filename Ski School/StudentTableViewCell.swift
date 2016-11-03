//
//  StudentTableViewCell.swift
//  Ski School
//
//  Created by Andi Setiyadi on 9/3/16.
//  Copyright © 2016 devhubs. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell {

    @IBOutlet weak var studentNameLabel: UILabel!
    @IBOutlet weak var studentAgeLabel: UILabel!
    @IBOutlet weak var levelImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
