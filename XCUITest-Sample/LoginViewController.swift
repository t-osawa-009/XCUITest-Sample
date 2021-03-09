import UIKit

final class LoginViewController: UIViewController {
    class func make() -> UIViewController {
        return UIStoryboard(name: String(describing: LoginViewController.self), bundle: nil).instantiateInitialViewController()!
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.accessibilityIdentifier = "emailTextField"
        passwordTextField.accessibilityIdentifier = "passwordTextField"
    }
    
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
}

