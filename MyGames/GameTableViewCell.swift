//
//  GameTableViewCell.swift
//  MyGames
//
//  Created by Luis Eduardo Silva Oliveira on 03/01/22.
//

import UIKit

class GameTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var ivCiver: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbConsole: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
