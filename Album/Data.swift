//
//  Data.swift
//  Album
//
//  Created by Kang on 2022/02/04.
//

import Foundation
import UIKit

struct Data {

    private var someArray = [UIImage]()
    
    init() {
        createImage()
    }
    
    mutating func createImage() {
        if let image = UIImage(named: "image.jpg") {
            for _ in 0..<40 {
                someArray.append(image)
            }
        }
    }
    
    var imageArray: [UIImage] {
        return someArray
    }

}
