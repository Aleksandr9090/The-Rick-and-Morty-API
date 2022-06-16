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
        
        
        NetworkManager.shared.fetchImage(from: character.image) { imageData in
            self.characterImageView.image = UIImage(data: imageData)
        }
        descriptionLabel.text = character.description
        title = character.name


    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
