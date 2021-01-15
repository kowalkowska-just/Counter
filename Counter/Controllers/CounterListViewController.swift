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
    var tableView = UITableView()
    
    static func instantiate() -> CounterListViewController {
         let storyboard = UIStoryboard(name: "Main", bundle: .main)
         let controller = storyboard.instantiateViewController(identifier: "CounterListViewController") as! CounterListViewController
         return controller
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        setupNavController()
        setupTabelView()
    }
    
    //MARK: - Helper functions
    
    private func setupNavController() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = .none
        
        let titleLabel = UILabel()
        titleLabel.text = viewModel.title
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        
        guard let targetView = self.navigationController?.navigationBar else { return }
        targetView.addSubview(titleLabel)
        titleLabel.anchor(bottom: targetView.bottomAnchor,
                          paddingBottom: 20,
                          width: 222, height: 40)
        
        titleLabel.centerX(inView: targetView)
    }
    
    private func setupTabelView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                         left: view.leftAnchor,
                         bottom: view.bottomAnchor,
                         right: view.rightAnchor,
                         paddingLeft: 20, paddingRight: 20)
    }
}

//MARK: - Extension: UITableViewDelegate, UITableViewDataSource 

extension CounterListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
