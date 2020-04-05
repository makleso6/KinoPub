//
//  UIView+Shadow.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 05/04/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import UIKit

extension UIView {
    public func makeShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offSet
        self.layer.shadowRadius = radius
        
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
