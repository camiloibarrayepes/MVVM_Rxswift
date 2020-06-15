//
//  Extensions.swift
//  FilmsApp
//
//  Created by camilo andres ibarra yepes on 15/06/20.
//  Copyright © 2020 camilo andres ibarra yepes. All rights reserved.
//

import UIKit

extension UIImageView {
    func imageFromServerURL(urlString: String, placeHolderImage: UIImage) {
        if self.image == nil {
            self.image = placeHolderImage
        }
        
        URLSession.shared.dataTask(with: URL(string: urlString)!) { (data, response, error) in
            if error != nil {
                return
            }
            DispatchQueue.main.async {
                guard let data = data else { return }
                let image = UIImage(data: data)
                self.image = image
            }
        }.resume()
    }
}
