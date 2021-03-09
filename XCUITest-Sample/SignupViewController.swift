import Foundation
import UIKit

final class SignupViewController: UIViewController {
    class func make() -> UIViewController {
        return UIStoryboard(name: String(describing: SignupViewController.self), bundle: nil).instantiateInitialViewController()!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.accessibilityIdentifier = "signupEmailTextField"
        passwordTextField.accessibilityIdentifier = "signupPasswordTextField"
        nameTextField.accessibilityIdentifier = "signupNameTextField"
    }
    
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var nameTextField: UITextField!
}
