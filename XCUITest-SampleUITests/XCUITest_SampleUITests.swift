import XCTest

final class XCUITest_SampleUITests: XCTestCase {
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
    }
    
    func testLogin() {
        app.launchEnvironment["uitest_page_type"] = "loginPage"
        app.launch()
        let page = LoginPage(app: app)
            .typeEmail("test@example.com")
            .typePassword("123456789")
        
        XCTAssert(page.goToSuccessPage().exists, "successページに到達した")
    }
    
    func testSignup() {
        app.launchEnvironment["uitest_page_type"] = "signupPage"
        app.launch()
        let page = SignupPage(app: app)
            .typeEmail("test@example.com")
            .typePassword("123456789")
            .typeName("Apple")
        
        XCTAssert(page.goToSuccessPage().exists, "successページに到達した")
    }
}
