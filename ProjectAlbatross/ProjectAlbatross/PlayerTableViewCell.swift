//
//  PlayerTableViewCell.swift
//  ProjectAlbatross
//
//  Created by apcsp on 3/17/17.
//  Copyright © 2017 apcsp. All rights reserved.
//

import UIKit

class PlayerTableViewCell: FoldingCell {
    @IBOutlet weak var fairwaysLabel: UILabel!
    @IBOutlet weak var birdsLabel: UILabel!
    @IBOutlet weak var puttsLabel: UILabel!
    @IBOutlet weak var shortsLabel: UILabel!
    @IBOutlet weak var hundredsLabel: UILabel!
    @IBOutlet weak var greensLabel: UILabel!
    @IBOutlet weak var sneaksLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var containerNameLabel: UILabel!
    @IBOutlet weak var foregroundNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func animationDuration(_ itemIndex:NSInteger, type:AnimationType)-> TimeInterval {
        
        // durations count equal it itemCount
        let durations = [0.33, 0.26, 0.26] // timing animation for each view
        return durations[itemIndex]
    }
    
}
