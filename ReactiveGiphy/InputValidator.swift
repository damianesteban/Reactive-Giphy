//
//  InputValidator.swift
//  ReactiveGiphy
//
//  Created by Damian Esteban on 8/5/16.
//  Copyright © 2016 Damian Esteban. All rights reserved.
//

import Foundation
import RxSwift

// Validates input (as the name so cleverly implies)
protocol InputValidator {
    associatedtype ValidationResult = Bool
    func validateSearchText(text: String) -> Bool
}