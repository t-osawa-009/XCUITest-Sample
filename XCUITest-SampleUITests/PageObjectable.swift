import Foundation
import XCTest

protocol PageObjectable: AnyObject {
    associatedtype Ally
    var app: XCUIApplication { get }
    init(app: XCUIApplication)
    var exists: Bool { get }
    var pageTitle: XCUIElement { get }
    func elementsExist(_ elements: [XCUIElement], timeout: Double) -> Bool
}

extension PageObjectable {
    var app: XCUIApplication {
        return XCUIApplication()
    }
    
    var exists: Bool {
        return elementsExist([pageTitle], timeout: 5)
    }
    
    func elementsExist(_ elements: [XCUIElement], timeout: Double) -> Bool {
        for element in elements {
            if !element.waitForExistence(timeout: timeout) {
                return false
            }
        }
        
        return true
    }
}
