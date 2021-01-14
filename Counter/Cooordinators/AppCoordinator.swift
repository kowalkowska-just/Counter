//
//  AppCoordinator.swift
//  Counter
//
//  Created by Justyna Kowalkowska on 14/01/2021.
//

import UIKit


protocol Coordinator: class {
    var childCoordinators: [Coordinator] { get }
    func start()
}

final class AppCoordinator: Coordinator {
    
    private(set) var childCoordinators: [Coordinator] = []
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        
        let eventsListCoordinator = CounterListCoordinator(navigationController: navigationController)
        
        childCoordinators.append(eventsListCoordinator)
        
        eventsListCoordinator.start()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
