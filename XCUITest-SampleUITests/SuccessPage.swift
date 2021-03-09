import Foundation
import XCTest

final class SuccessPage: PageObjectable {
    let app: XCUIApplication
    init(app: XCUIApplication) {
        self.app = app
    }
    
    var pageTitle: XCUIElement {
        return app.navigationBars[Ally.title].firstMatch
    }
    
    enum Ally {
        static let title = "Success"
    }
}
