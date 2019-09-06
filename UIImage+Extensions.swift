//
//  UIImage+Extensions.swift
//  Kinderzeit
//
//  Created by Jonathan Burris on 6/17/19.
//  Copyright © 2019 Burris Consulting Group LLC. All rights reserved.
//

import UIKit

public extension UIImage {
    func generateThumbnail(ratio: CGFloat = 64) -> UIImage? {
        let size = self.size
        
        var croppedSize: CGSize
        var offsetX: CGFloat = 0.0
        var offsetY: CGFloat = 0.0
        
        if size.width > size.height {
            offsetX = (size.height - size.width) / 2
            croppedSize = CGSize(width: size.height, height: size.height)
        } else {
            offsetY = (size.width - size.height) / 2
            croppedSize = CGSize(width: size.width, height: size.width)
        }
        
        let clippedRect = CGRect(x: offsetX * -1, y: offsetY * -1, width: croppedSize.width, height: croppedSize.height)
        
        guard let cgImage = self.cgImage else { return nil }
        
        guard let imageRef = cgImage.cropping(to: clippedRect) else { return nil }
        
        let rect = CGRect(x: 0, y: 0, width: ratio, height: ratio)
        UIGraphicsBeginImageContext(rect.size)
        UIImage(cgImage: imageRef).draw(in: rect)
        let thumbnail = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return thumbnail
    }
}
