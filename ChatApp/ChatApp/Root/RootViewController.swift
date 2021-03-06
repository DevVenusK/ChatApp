//
//  RootViewController.swift
//  ChatApp
//
//  Created by 김효성 on 2022/01/14.
//

import ModernRIBs
import UIKit

protocol RootPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class RootViewController: UIViewController, RootPresentable, RootViewControllable {

    weak var listener: RootPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func present(viewController: ViewControllable) {
        viewController.uiviewController.modalPresentationStyle = .overFullScreen
        present(viewController.uiviewController, animated: true, completion: nil)
    }
    
    func dismiss(viewController: ViewControllable) {
        if presentedViewController === viewController.uiviewController {
            dismiss(animated: true, completion: nil)
        }
    }
}
