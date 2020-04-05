//
//  SizeCalculator.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 01/04/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Foundation
import UIKit

public protocol SizeCalculator: AnyObject {
    associatedtype Reference
    func size(for reference: Reference) -> CGSize
}
