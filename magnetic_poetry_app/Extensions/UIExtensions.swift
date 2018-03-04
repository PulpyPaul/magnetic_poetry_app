//
//  UIExtensions.swift
//  magnetic_poetry_app
//
//  Created by Student on 3/4/18.
//  Copyright © 2018 Paul DeSimone Nick Federico. All rights reserved.
//

import UIKit

extension UIView {
    func takeSnapshot() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
