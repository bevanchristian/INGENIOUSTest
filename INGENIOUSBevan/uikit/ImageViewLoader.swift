//
//  ImageViewLoader.swift
//  INGENIOUSBevan
//
//  Created by bevan on 14/05/23.
//

import UIKit
import SDWebImage

class ImageViewLoader: UIImageView {
    
    // MARK: - Properties
    
    private let imageCache = SDImageCache.shared
    
    // MARK: - Public Methods
    
    func setImage(with url: URL?, placeholderImage: UIImage? = nil) {
        guard let url = url else {
            self.image = placeholderImage
            return
        }
        
        // Check if the image is already cached
        let cacheKey = url.absoluteString
        if let cachedImage = imageCache.imageFromCache(forKey: cacheKey) {
            self.image = cachedImage
            return
        }
        
        // If the image is not cached, download and cache it
        self.image = placeholderImage
        self.sd_setImage(with: url) { [weak self] (image, error, cacheType, url) in
            if let image = image {
                self?.imageCache.store(image, forKey: cacheKey)
            }
        }
    }
}
