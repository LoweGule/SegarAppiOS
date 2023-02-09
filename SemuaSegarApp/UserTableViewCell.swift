//
//  UserTableViewCell.swift
//  SemuaSegarApp
//
//  Created by prk on 08/02/23.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var nameTxt: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
