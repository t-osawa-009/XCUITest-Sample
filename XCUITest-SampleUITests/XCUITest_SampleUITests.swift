import XCTest

final class XCUITest_SampleUITests: XCTestCase {
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launchEnvironment["uitest_page_type"] = "introduction"
        app.launch()
    }
    
    func test() {
        let page = LoginPage(app: app)
            .typeEmail("test@example.com")
            .typePassword("123456789")
        
        XCTAssert(page.goToSuccessPage().exists, "successページに到達した")
    }
}
