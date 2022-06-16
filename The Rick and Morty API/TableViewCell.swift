//
//  TableViewCell.swift
//  TheRickAndMortyAPI
//
//  Created by Aleksandr on 16.06.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet var characterLabel: UILabel!
    @IBOutlet var characterImageView: UIImageView!
    
    func configure(with character: Character?) {
        characterLabel.text = character?.name
        NetworkManager.shared.fetchImage(from: character?.image) { imageData in
            self.characterImageView.image = UIImage(data: imageData)
        }
    }
    

}
