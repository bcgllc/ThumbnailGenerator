//
//  ViewController.swift
//  ThumbnailGenerator
//
//  Created by bcgllc on 09/06/2019.
//  Copyright (c) 2019 bcgllc. All rights reserved.
//

import UIKit
import ThumbnailGenerator

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let originalPhoto = #imageLiteral(resourceName: "wall-1217083_1920.jpg")
        let thumbnailImage = originalPhoto.generateThumbnail(ratio: 64)
    }
}

