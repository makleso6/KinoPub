//
//  CollectionViewCellSizeCalculator.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 01/04/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Foundation
import UIKit

public final class CollectionViewCellSizeCalculator: SizeCalculator {
    public func size(for reference: UICollectionView) -> CGSize {
        
//        var constant: CGFloat
        
        let traitCollection = UITraitCollection.current
        let multiplier: CGFloat
        switch (traitCollection.horizontalSizeClass, traitCollection.verticalSizeClass) {
        case (.compact, .compact):
//            print("(.compact, .compact)")
            multiplier = 2
        case (.compact, .regular):
//            print("(.compact, .regular)")
            multiplier = 2
        case (.regular, .compact):
//            print("(.regular, .compact)")
            multiplier = 4
        case (.regular, .regular):
//            print("(.regular, .regular)")
            multiplier = 6
        default:
            multiplier = 1
            print("")
        }
        let width = (reference.bounds.width - (reference.contentInset.left + reference.contentInset.right)) / multiplier
        let height = width * 1.6
        return CGSize(width: width, height: height)
//
//
//        let orientation = UIDevice.current.orientation
//        if (orientation == .landscapeLeft || orientation == .landscapeRight), traitCollection.userInterfaceIdiom == .pad {
//            constant = 6.0
//        } else if (orientation == .portrait || orientation == .portraitUpsideDown), traitCollection.userInterfaceIdiom == .pad {
//            constant = 4.0
//        } else if orientation == .landscapeLeft || orientation == .landscapeRight {
//            constant = 4.0
//        } else {
//            constant = 2.0
//        }
//        let width2 = (reference.bounds.width - (reference.contentInset.left + reference.contentInset.right)) / constant
//        let height2 = width * 1.569
//        return CGSize(width: width, height: height)
    }
}
