//
//  UIColor+Ex.swift
//  Concentration
//
//  Created by de.egorov on 15.02.2024.
//

import UIKit

extension UIColor {
    
    /// generate random RGB color with alpha=1
    static func randomColor() -> UIColor {
        UIColor(red:    .random(in:  0...1),
                green:  .random(in:  0...1),
                blue:   .random(in:  0...1),
                alpha:  1)
    }
}
