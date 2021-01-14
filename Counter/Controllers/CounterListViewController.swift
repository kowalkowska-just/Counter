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
        navigationItem.title = .none
        
        let titleLabel = UILabel()
        titleLabel.text = viewModel.title
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        guard let targetView = self.navigationController?.navigationBar else { return }
        targetView.addSubview(titleLabel)
        titleLabel.anchor(bottom: targetView.bottomAnchor, width: 222, height: 40)
        
        titleLabel.centerX(inView: targetView)
    }
}
