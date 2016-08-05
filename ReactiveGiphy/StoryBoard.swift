//
//  StoryBoard.swift
//  ReactiveGiphy
//
//  Created by Damian Esteban on 8/5/16.
//  Copyright © 2016 Damian Esteban. All rights reserved.
//

import UIKit

struct StoryBoard {
    static let main = UIStoryboard(name: "Main", bundle: nil)
}

extension UIViewController {
    class var storyboardID: String {
        return String(self)
    }
}

extension UIStoryboard {
    func instantiateViewController<T: UIViewController>() -> T {
        guard let viewController = instantiateViewControllerWithIdentifier(T.storyboardID) as? T else {
            fatalError("Error when casting to \(T.self)")
        }
        return viewController
    }
}