//
//  Constants.swift
//  ReactiveGiphy
//
//  Created by Damian Esteban on 8/9/16.
//  Copyright © 2016 Damian Esteban. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    
    static let apiKey = "dc6zaTOxFJmzC"
    static let baseURLString = "https://api.giphy.com/v1/gifs"
    
    struct Colors {
        static let Grey = UIColor(red:0.56, green:0.64, blue:0.68, alpha:1.00)
        static let White = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.00)
        static let Orange = UIColor(red:1.00, green:0.60, blue:0.00, alpha:1.00)
        static let Green = UIColor(red:0.30, green:0.69, blue:0.31, alpha:1.00)
        static let BluePrimary = UIColor(red:0.13, green:0.58, blue:0.95, alpha:1.00)
        static let WhiteAccent = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.00)
        static let Yellow = UIColor(red:1.00, green:0.80, blue:0.56, alpha:1.00)
        static let GreyDivider = UIColor(red:0.74, green:0.74, blue:0.74, alpha:1.00)
        static let DarkGrey = UIColor(red:0.45, green:0.45, blue:0.45, alpha:1.00)
        static let OrangeAccent = UIColor(red:1.00, green:0.34, blue:0.13, alpha:1.00)
        static let OffWhite = UIColor(red:0.96, green:0.97, blue:0.95, alpha:1.00)
    }
    
    struct Fonts {
        static let HelveticaNeueBoldNavbar = UIFont(name: "HelveticaNeue-Bold", size: 18)
    }
}
