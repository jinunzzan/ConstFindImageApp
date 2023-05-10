//
//  ImageListTableViewCell.swift
//  ConstFindImageApp
//
//  Created by Eunchan Kim on 2023/05/10.
//

import UIKit

class ImageListTableViewCell:
    UITableViewCell {

    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
