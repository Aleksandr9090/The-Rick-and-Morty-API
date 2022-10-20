//
//  CharacterViewController.swift
//  TheRickAndMortyAPI
//
//  Created by Aleksandr on 14.06.2022.
//

import UIKit

class CharacterViewController: UIViewController {
    
    @IBOutlet var characterImageView: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    
    var character: Character!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Back"

        NetworkManager.shared.fetchImage(from: character.image) { imageData in
            self.characterImageView.image = UIImage(data: imageData)
        }
        
        descriptionLabel.text = character.description
        title = character.name
    }
}
