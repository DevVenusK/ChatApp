//
//  RootBuilder.swift
//  ChatApp
//
//  Created by 김효성 on 2022/01/14.
//

import ModernRIBs

protocol RootDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class RootComponent: Component<RootDependency>, LoggedOutDependency, LoggedInDependency {
    fileprivate let rootViewController: RootViewController
    
    var loggedInViewController: LoggedInViewControllable {
        return rootViewController
    }
    
    init(dependency: RootDependency,
         rootViewController: RootViewController) {
        self.rootViewController = rootViewController
        super.init(dependency: dependency)
    }
}

// MARK: - Builder

protocol RootBuildable: Buildable {
    func build() -> LaunchRouting
}

final class RootBuilder: Builder<RootDependency>, RootBuildable {
    
    override init(dependency: RootDependency) {
        super.init(dependency: dependency)
    }
    
    func build() -> LaunchRouting {
        let rootViewController = RootViewController()
        let component = RootComponent(dependency: dependency,
                                      rootViewController: rootViewController)
        let viewController = RootViewController()
        let interactor = RootInteractor(presenter: viewController)
        let loggedOutBuilder = LoggedOutBuilder(dependency: component)
        let loggedInBuilder = LoggedInBuilder(dependency: component)
        return RootRouter(interactor: interactor,
                          viewController: viewController,
                          loggedOutBuilder: loggedOutBuilder,
                          loggedInBuilder: loggedInBuilder)
    }
}
