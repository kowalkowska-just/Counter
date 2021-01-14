//
//  CounterListViewController.swift
//  Counter
//
//  Created by Justyna Kowalkowska on 14/01/2021.
//

import UIKit

class CounterListViewController: UIViewController {
    
    //MARK: - Properties
    
    var viewModel: CounterListViewModel!

    //MARK: - Lifecycle
    
    static func instantiate() -> CounterListViewController {
         let storyboard = UIStoryboard(name: "Main", bundle: .main)
         let controller = storyboard.instantiateViewController(identifier: "CounterListViewController") as! CounterListViewController
         return controller
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green

        setupNavController()
    }
    
    //MARK: - Helper functions
    
    private func setupNavController() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = viewModel.title
    }
}
