//
//  LoggedOutInteractor.swift
//  ChatApp
//
//  Created by 김효성 on 2022/01/16.
//

import ModernRIBs

protocol LoggedOutRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol LoggedOutPresentable: Presentable {
    var listener: LoggedOutPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol LoggedOutListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class LoggedOutInteractor: PresentableInteractor<LoggedOutPresentable>, LoggedOutInteractable, LoggedOutPresentableListener {
    
    weak var router: LoggedOutRouting?
    weak var listener: LoggedOutListener?
    
    private let authenticationService: AuthenticationServiceProtocol
    
    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    init(presenter: LoggedOutPresentable,
         authenticationService: AuthenticationServiceProtocol) {
        self.authenticationService = authenticationService
        super.init(presenter: presenter)
        presenter.listener = self
    }
    
    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }
    
    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}

// MARK: - LoggedOutPresentableLister
extension LoggedOutInteractor {
    func didLogin(email: String?, password: String?) {
        Task {
            let auth = try await authenticationService.create(email: email, password: password)
            guard auth.error == nil else { return }
            print("Login Success", auth.result?.user.email)
        }
    }
}
