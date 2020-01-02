//
//  mainTableViewCell.swift
//  WTD_Demo
//
//  Created by Shivam Pandya on 26/09/18.
//  Copyright © 2018 Shivam Pandya. All rights reserved.
//

import UIKit

class mainTableViewCell: UITableViewCell {
    
    //MARK:- Outlet
    @IBOutlet weak var lblDataId: UILabel!
    @IBOutlet weak var lblDataTitle: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
