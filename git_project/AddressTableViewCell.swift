//
//  AddressTableViewCell.swift
//  git_project
//
//  Created by MacBook Pro on 6/29/20.
//  Copyright © 2020 MacBook Pro. All rights reserved.
//

import UIKit

class AddressTableViewCell: UITableViewCell {

    @IBOutlet weak var addressLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setAddress(_ address: AddressModel) {
        addressLabel.text = address.street
    }
}
