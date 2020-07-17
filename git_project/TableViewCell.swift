//
//  TableViewCell.swift
//  git_project
//
//  Created by MacBook Pro on 7/6/20.
//  Copyright © 2020 MacBook Pro. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var valueLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setData(model: ReciepeModel) {
        titleLbl.text = String(model.id)
        valueLbl.text = model.name
    }
}
