//
//  ImageCache.swift
//  TheRickAndMortyAPI
//
//  Created by Aleksandr on 20.10.2022.
//

import Foundation
import UIKit

class ImageCache {
    static let shared = NSCache<NSString, UIImage>()
    private init() {}
}

