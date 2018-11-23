//
//  PersonListCell.swift
//  ios-exam
//
//  Created by Andy Yang on 2018/11/23.
//  Copyright © 2018 Andy Yang. All rights reserved.
//

import UIKit

class PersonListCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
