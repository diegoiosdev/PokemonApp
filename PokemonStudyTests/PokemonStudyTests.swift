import XCTest
@testable import PokemonStudy

class PokemonStudyTests: XCTestCase {

    func test_IsValid_Email() {
        let email = "teste@gmail.com"
        let valeu = email.isValidEmail()
        
        XCTAssertTrue(valeu, "Não é uma email válido")
    }
    
    func test_Remove_White_Space() {
        let text = "Olá Mundo"
        let newText = text.removeWhiteSpace()
        
        XCTAssert(newText == "OláMundo")
    }
    
    func test_Replace() {
        let text = "Swift"
        let newText = text.replace(string: "S", replacement: "D")
        let newTexTwo = newText.replace(string: "t", replacement: "x")
        
        XCTAssert(newText == "Dwift")
        XCTAssert(newTexTwo == "Dwifx")
    }
}
