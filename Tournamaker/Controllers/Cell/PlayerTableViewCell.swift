//
//  PlayerTableViewCell.swift
//  Tournamaker
//
//  Created by Anthony Tong on 4/18/18.
//  Copyright © 2018 Anthony Tong. All rights reserved.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {


    @IBOutlet weak var playerName: UILabel!
    
    @IBOutlet weak var playerRecord: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
