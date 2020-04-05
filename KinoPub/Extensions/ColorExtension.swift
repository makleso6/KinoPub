//
//  ColorExtension.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 21/02/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import SwiftUI

extension Color {
    public static var baseText: Color { .init("BaseText") }
    public static var baseBackgroung: Color { .init("BaseBackgroung") }
}

extension UIColor {
    public static var baseText: UIColor? { UIColor(named: "BaseText") }
    public static var baseBackgroung: UIColor? { UIColor(named: "BaseBackgroung") }

}
