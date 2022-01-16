//
//  RootRouter.swift
//  ChatApp
//
//  Created by 김효성 on 2022/01/14.
//

import ModernRIBs

protocol RootInteractable: Interactable, LoggedOutListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
    func present(viewController: ViewControllable)
    func dismiss(viewController: ViewControllable)
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {
    
    private let loggedOutBuilder: LoggedOutBuildable
    private var loggedOut: LoggedOutRouting?
    
    private let loggedInBuilder: LoggedInBuildable
    
    init(interactor: RootInteractable,
         viewController: RootViewControllable,
         loggedOutBuilder: LoggedOutBuildable,
         loggedInBuilder: LoggedInBuildable) {
        self.loggedOutBuilder = loggedOutBuilder
        self.loggedInBuilder = loggedInBuilder
        super.init(interactor: interactor,
                   viewController: viewController)
        interactor.router = self
    }
    
    override func didLoad() {
        super.didLoad()
        attachLoggedOut()
    }
}

// MARK: - Private Function
extension RootRouter {
    private func attachLoggedOut() {
        guard loggedOut == nil else { return }
        let loggedOut = loggedOutBuilder.build(withListener: interactor)
        self.loggedOut = loggedOut
        attachChild(loggedOut)
        viewController.present(viewController: loggedOut.viewControllable)
    }
}
