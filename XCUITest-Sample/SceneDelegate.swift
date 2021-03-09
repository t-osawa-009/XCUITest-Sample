import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        let window = UIWindow(windowScene: windowScene)
        if let type = ProcessInfo.processInfo.environment["uitest_page_type"] {
            #if targetEnvironment(simulator)
            // Disable hardware keyboards.
            let setHardwareLayout = NSSelectorFromString("setHardwareLayout:")
            UITextInputMode.activeInputModes
                // Filter `UIKeyboardInputMode`s.
                .filter({ $0.responds(to: setHardwareLayout) })
                .forEach { $0.perform(setHardwareLayout, with: nil) }
            #endif
            switch type {
            case "loginPage":
                window.rootViewController = LoginViewController.make()
            case "signupPage":
                window.rootViewController = SignupViewController.make()
            default:
                fatalError()
            }
        } else {
            window.rootViewController = LoginViewController.make()
        }
        self.window = window
        window.makeKeyAndVisible()
    }
}

