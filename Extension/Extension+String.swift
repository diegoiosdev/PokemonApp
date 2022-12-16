import UIKit

extension String {
    func removeWhiteSpace() -> String {
        return replace(string: " ", replacement:"")
    }

    func replace(string: String, replacement: String) -> String {
        return self.replacingOccurrences(of: string, with: replacement, options: .literal, range: nil)
    }

    func isValidEmail() -> Bool {
        let emailRegEX = "teste@gmail.com"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEX)
        return emailTest.evaluate(with: self)
    }
}
