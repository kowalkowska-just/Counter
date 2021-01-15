//
//  HeaderView.swift
//  Counter
//
//  Created by Justyna Kowalkowska on 15/01/2021.
//

import UIKit

final class HeaderView: UIView {
    
    //MARK: - Properties
    
    private var segmentedController: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["All", "Today"])
        sc.backgroundColor = .white
        sc.tintColor = .black
        sc.selectedSegmentIndex = 0
        sc.addTarget(self, action: #selector(handleChangeTypeViewData(_:)), for: .valueChanged)
        return sc
    }()
    
    private let sortListButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "arrow.up.arrow.down"), for: .normal)
        button.tintColor = .black
        button.backgroundColor = UIColor.lightGray.withAlphaComponent(0.18)
        button.addTarget(self, action: #selector(handleSortList), for: .touchUpInside)
        return button
    }()
    
    private let addItemButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .black
        button.backgroundColor = UIColor.lightGray.withAlphaComponent(0.18)
        button.addTarget(self, action: #selector(handleAddItem), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Initializes
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHeaderView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Helper functions
    
    func setupHeaderView() {
        backgroundColor = UIColor.black.withAlphaComponent(0.02)
        
        addSubview(segmentedController)
        segmentedController.centerX(inView: self)
        segmentedController.anchor(top: self.topAnchor, bottom: self.bottomAnchor, paddingTop: 10, paddingBottom: 10)
        
        addSubview(sortListButton)
        sortListButton.anchor(top: self.topAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingTop: 10, paddingBottom: 10, paddingRight: -15, width: 30, height: 30)
        sortListButton.layer.cornerRadius = 10
        
        addSubview(addItemButton)
        addItemButton.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, paddingTop: 10, paddingLeft: 15, paddingBottom: 10, width: 30, height: 30)
        addItemButton.layer.cornerRadius = 10


    }
    
    //MARK: - Selectors
    
    @objc func handleChangeTypeViewData(_ sender: UISegmentedControl) {
        print("DEBUG: Changed type view data")
//        switch sender.selectedSegmentIndex {
//        case 0:
//        case 1:
//        default:
//            break
//        }
    }
    
    @objc func handleSortList() {
        print("DEBUG: Tapped sort list button")
    }
    
    @objc func handleAddItem() {
        print("DEBUG: Tapped add item button")

    }
}
