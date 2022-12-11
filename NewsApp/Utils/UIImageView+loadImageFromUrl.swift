//
//  UIImageView+loadImageFromUrl.swift
//  NewsApp
//
//  Created by Amissan on 04/12/2022.
//

import Foundation
import UIKit

extension UIImageView {
    func loadImageFrom(stringURLAddress: String) {
        guard let url = URL(string: stringURLAddress) else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                        self?.image = loadedImage
                }
            }
        }
    }
}
