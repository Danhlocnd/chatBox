//
//  SongTableViewCell.swift
//  MyAppMP3
//
//  Created by Danhloc on 8/6/18.
//  Copyright © 2018 Danhloc. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {
    @IBOutlet weak var songTitleLabel: UILabel!
    
    @IBOutlet weak var lblIDnumber: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    
    @IBOutlet weak var lblTimer: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
    @IBOutlet weak var genreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
