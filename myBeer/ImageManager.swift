//
//  ImageManager.swift
//  myBeer
//
//  Created by Artem Grebenkin on 10/27/19.
//  Copyright © 2019 Artem Grebenkin. All rights reserved.
//

import UIKit

class ImageManager {
    
    static let shared = ImageManager()
    
    func getImageFrom(stringURL: String?, clouser: @escaping(_: UIImage?) -> Void) {
        if let stringURL = stringURL {
            if let url = URL(string: stringURL){
                if let imageData = try? Data(contentsOf: url) {
                    let image = UIImage(data: imageData)
                    clouser(image)
                }
            }
        }
    }
    
    
}
