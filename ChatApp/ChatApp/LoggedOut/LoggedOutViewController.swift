//
//  LoggedOutViewController.swift
//  ChatApp
//
//  Created by 김효성 on 2022/01/16.
//

import UIKit

import ModernRIBs

protocol LoggedOutPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class LoggedOutViewController: UIViewController, LoggedOutPresentable, LoggedOutViewControllable {
    
    weak var listener: LoggedOutPresentableListener?
    
    private var userNameTextField: UITextField?
    private var passwordTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let stackView: UIStackView = buildStackView()
        buildUserNameTextField(stackView: stackView)
        buildPasswordTextField(stackView: stackView)
        buildLoginButton(stackView: stackView)
    }
}

// MARK: - Build UI
extension LoggedOutViewController {
    private func buildStackView() -> UIStackView {
        let stackView: UIStackView = {
            let stackView: UIStackView = UIStackView()
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.distribution = .equalSpacing
            stackView.axis = .vertical
            stackView.spacing = 20
            return stackView
        }()
        
        view.addSubview(stackView)
        
        [stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
         stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
         stackView.widthAnchor.constraint(equalToConstant: 200)]
            .forEach { $0.isActive = true }
        
        return stackView
    }
    
    private func buildUserNameTextField(stackView: UIStackView) {
        let userNameTextField: UITextField = {
            let textField: UITextField = UITextField()
            textField.borderStyle = .line
            textField.placeholder = "User Name"
            return textField
        }()
        
        self.userNameTextField = userNameTextField
        
        stackView.addArrangedSubview(userNameTextField)

        [userNameTextField.widthAnchor.constraint(equalTo: stackView.widthAnchor),
         userNameTextField.heightAnchor.constraint(equalToConstant: 44)]
            .forEach { $0.isActive = true }
    }
    
    private func buildPasswordTextField(stackView: UIStackView) {
        let passwordTextField: UITextField = {
            let textField: UITextField = UITextField()
            textField.borderStyle = .line
            textField.isSecureTextEntry = true
            textField.placeholder = "Password"
            return textField
        }()
        
        self.passwordTextField = passwordTextField
        
        stackView.addArrangedSubview(passwordTextField)

        [passwordTextField.widthAnchor.constraint(equalTo: stackView.widthAnchor),
         passwordTextField.heightAnchor.constraint(equalToConstant: 44)]
            .forEach { $0.isActive = true }
    }
    
    private func buildLoginButton(stackView: UIStackView) {
        let loginButton: UIButton = {
            let button = UIButton()
            button.setTitle("Login",
                            for: .normal)
            button.setTitleColor(UIColor.white,
                                 for: .normal)
            button.backgroundColor = UIColor.blue
            button.addTarget(self,
                             action: #selector(didTapLoginButton),
                             for: .touchUpInside)
            return button
        }()
        
        stackView.addArrangedSubview(loginButton)
        
        [loginButton.widthAnchor.constraint(equalTo: stackView.widthAnchor),
         loginButton.heightAnchor.constraint(equalToConstant: 44)]
            .forEach { $0.isActive = true }
    }
}

// MARK: - Selector
extension LoggedOutViewController {
    @objc private func didTapLoginButton(_ sender: UIButton) {
        
    }
}
