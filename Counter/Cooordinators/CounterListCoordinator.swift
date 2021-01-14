//
//  CounterListCoordinator.swift
//  Counter
//
//  Created by Justyna Kowalkowska on 14/01/2021.
//

import UIKit

class CounterListCoordinator: Coordinator {
    
    private(set) var childCoordinators: [Coordinator] = []
    
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let counterListViewController: CounterListViewController = .instantiate()
        let counterListViewModel = CounterListViewModel()
        counterListViewModel.coordinator = self
        counterListViewController.viewModel = counterListViewModel
        navigationController.setViewControllers([counterListViewController], animated: false)
    }
}
