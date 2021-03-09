import Foundation
import XCTest

final class LoginPage: PageObjectable {
    let app: XCUIApplication
    init(app: XCUIApplication) {
        self.app = app
    }
    
    var pageTitle: XCUIElement {
        return app.navigationBars[Ally.title].firstMatch
    }
    
    var emailTextField: XCUIElement {
        return app.textFields[Ally.emailTextField].firstMatch
    }
    
    var passwordTextField: XCUIElement {
        return app.secureTextFields[Ally.passwordTextField].firstMatch
    }
    
    enum Ally {
        static let title = "Log in"
        static let nextButton = "nextButton"
        static let emailTextField = "emailTextField"
        static let passwordTextField = "passwordTextField"
    }
    
    @discardableResult
    func typeEmail(_ email: String) -> Self {
        _ = emailTextField.waitForExistence(timeout: 5.0)
        emailTextField.tap()
        emailTextField.typeText(email)
        return self
    }
    
    @discardableResult
    func typePassword(_ password: String) -> Self {
        _ = passwordTextField.waitForExistence(timeout: 5.0)
        passwordTextField.tap()
        passwordTextField.typeText(password)
        return self
    }
    
    func goToSuccessPage() -> SuccessPage {
        let rightNavBarButton = app.navigationBars.children(matching: .button).firstMatch
        _ = rightNavBarButton.waitForExistence(timeout: 5.0)
        rightNavBarButton.tap()
        return SuccessPage(app: app)
    }
}
