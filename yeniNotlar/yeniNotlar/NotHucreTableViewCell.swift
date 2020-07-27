//
//  NotHucreTableViewCell.swift
//  yeniNotlar
//
//  Created by Osman Esad on 4.06.2020.
//  Copyright © 2020 pixeldigitalart. All rights reserved.
//

import UIKit

class NotHucreTableViewCell: UITableViewCell {
// MARK: - Nesneler
    
    @IBOutlet weak var kalanZamanLabel: UILabel!
    @IBOutlet weak var adresLabel: UILabel!
    @IBOutlet weak var yorumLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
