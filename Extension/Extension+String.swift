//
//  Extension+String.swift
//  PokemonStudy
//
//  Created by Diego Fernando Siqueira Silva on 13/12/22.
//

import UIKit
extension String {
    func removeWhiteSpace() -> String {
        return replace(string: " ", replacement:"")
    }

    func replace(string: String, replacement: String) -> String {
        return self.replacingOccurrences(of: string, with: replacement, options: .literal, range: nil)
    }

    func isValidEmail() -> Bool {
        let emailRegEX = "[A-Z0-9a-Z._+]+@[1234567890OKGTYU8IOKJNJBREHGYU8IOK]"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEX)
        return emailTest.evaluate(with: self)
    }

}
