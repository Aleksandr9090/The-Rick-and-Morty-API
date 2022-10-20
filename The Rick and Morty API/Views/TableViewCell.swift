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
        
    private var imageURL: URL? {
        didSet {
            characterImageView.image = nil
            updateImage()
        }
    }
    
    func configure(with character: Character?) {
        characterLabel.text = character?.name
        characterLabel.textColor = UIColor.black
        imageURL = URL(string: character?.image ?? "")
    }
    
    private func updateImage() {
        guard let imageURL = imageURL else { return }
        getImage(from: imageURL) { result in
            switch result {
            case .success(let image):
                if imageURL == self.imageURL {
                    self.characterImageView.image = image
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func getImage(from url: URL, completion: @escaping(Result<UIImage, Error>) -> Void) {
        //Get image from cache
        if let cacheImage = ImageCache.shared.object(forKey: url.lastPathComponent as NSString) {
            completion(.success(cacheImage))
            return
        }
        
        NetworkManager.shared.fetchImageForCache(from: url) { result in
            switch result {
            case .success(let imageData):
                guard let image = UIImage(data: imageData) else { return }
                ImageCache.shared.setObject(image, forKey: url.lastPathComponent as NSString)
                completion(.success(image))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
