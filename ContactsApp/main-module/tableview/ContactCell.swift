//
//  ContactCell.swift
//  ContactsApp
//
//  Created by Ferdi DEMİRCİ on 13.08.2022.
//

import UIKit

class ContactCell: UITableViewCell {

    @IBOutlet weak var contactLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
