//
//  AppComponent.swift
//  ChatApp
//
//  Created by 김효성 on 2022/01/14.
//

import ModernRIBs

class AppComponent: Component<EmptyDependency>, RootDependency {
    
    init() {
        super.init(dependency: EmptyComponent())
    }
}
