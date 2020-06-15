//
//  CustomMovieCell.swift
//  FilmsApp
//
//  Created by camilo andres ibarra yepes on 15/06/20.
//  Copyright © 2020 camilo andres ibarra yepes. All rights reserved.
//

import UIKit

class CustomMovieCell: UITableViewCell {

    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var titleMovie: UILabel!
    @IBOutlet weak var descriptionMovie: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
