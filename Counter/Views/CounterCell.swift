//
//  CounterCell.swift
//  Counter
//
//  Created by Justyna Kowalkowska on 15/01/2021.
//

import UIKit

class CounterCell: UITableViewCell {

    //MARK: - Properties
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.tintColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 21, weight: .light)
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        
        label.text = "Ciggarets"
        return label
    }()
    
    private let counterValueLabel: UILabel = {
        let label = UILabel()
        label.tintColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        
        label.text = "25"
        return label
    }()
    
    lazy var containerValueView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.addSubview(counterValueLabel)
        counterValueLabel.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: -5)
        return view
    }()
    
    private let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .black
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(handleAddValue), for: .touchUpInside)
        return button
    }()
    
    private let subtractButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.tintColor = .black
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(handleSubtractValue), for: .touchUpInside)
        return button
    }()
    
    private let showMoreCellButtom: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.compact.down"), for: .normal)
        button.tintColor = .black
        button.backgroundColor = UIColor.white.withAlphaComponent(0.1)
        button.addTarget(self, action: #selector(handleShowMoreCell), for: .touchUpInside)

        return button
    }()
    
    private let timeSinceTheLastOneLabel: UILabel = {
        let label = UILabel()
        label.text = "Time since the last one:"
        label.textAlignment = .left
        label.tintColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 14)
        
        return label
    }()
    
    private let showLessCellButtom: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.compact.up"), for: .normal)
        button.tintColor = .black
        button.backgroundColor = UIColor.white.withAlphaComponent(0.1)
        button.addTarget(self, action: #selector(handleShowLessCell), for: .touchUpInside)

        return button
    }()

    
    
    //MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViewCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helper Functions
    
    private func setupViewCell() {
        backgroundColor = .white
        
        let view = UIView()
        view.backgroundColor = UIColor.systemTeal
        
        addSubview(view)
        view.anchor(top: self.topAnchor, left: self.leftAnchor,
                    bottom: self.bottomAnchor, right: self.rightAnchor,
                    paddingTop: 5, paddingLeft: 10,
                    paddingBottom: 5, paddingRight: -10)
        view.layer.cornerRadius = 5
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.topAnchor, left: view.leftAnchor,
                          paddingTop: 15, paddingLeft: 15)
        
        view.addSubview(containerValueView)
        containerValueView.anchor(top: view.topAnchor, right: view.rightAnchor,
                                  paddingTop: 10, paddingRight: -15,
                                  width: 50, height: 50)
        containerValueView.layer.cornerRadius = 25
        
        view.addSubview(subtractButton)
        subtractButton.anchor(top: containerValueView.bottomAnchor, right: view.rightAnchor,
                              paddingTop: 5, paddingRight: -25,
                              width: 15, height: 15)
        subtractButton.layer.cornerRadius = 7.5
        
        view.addSubview(addButton)
        addButton.anchor(top: containerValueView.bottomAnchor, right: subtractButton.leftAnchor,
                         paddingTop: 2.5, paddingRight: -5,
                         width: 25, height: 25)
        addButton.layer.cornerRadius = 12.5
        
        view.addSubview(showMoreCellButtom)
        showMoreCellButtom.anchor(top: addButton.bottomAnchor,
                                  left: view.leftAnchor,
                                  right: view.rightAnchor,
                                  paddingTop: 5, paddingLeft: 5,
                                  paddingRight: -5,
                                  height: 25)
        
        view.addSubview(timeSinceTheLastOneLabel)
        timeSinceTheLastOneLabel.anchor(top: showMoreCellButtom.bottomAnchor, left: view.leftAnchor, paddingTop: 5, paddingLeft: 15)
        
        let graphView = UIView()
        graphView.backgroundColor = .white
        
        view.addSubview(graphView)
        graphView.anchor(top: timeSinceTheLastOneLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 5, paddingLeft: 15, paddingRight: -15, height: 100)
        
        view.addSubview(showLessCellButtom)
        showLessCellButtom.anchor(top: graphView.bottomAnchor, left: view.leftAnchor,
                                  bottom: view.bottomAnchor, right: view.rightAnchor,
                                  paddingTop: 5, paddingLeft: 5,
                                  paddingBottom: 5, paddingRight: -5,
                                  height: 25)
    
    }
    
    func update(with viewModel: CounterCellViewModel) {
        titleLabel.text = viewModel.titleText
    }
    
    //MARK: - Selectors
    
    @objc private func handleAddValue() {
        print("DEBUG: Add to counter value")
    }
    
    @objc private func handleSubtractValue() {
        print("DEBUG: Subtract from counter value")
    }
    
    @objc private func handleShowMoreCell() {
        print("DEBUG: Showing more cell")
    }
    
    @objc private func handleShowLessCell() {
        print("DEBUG: Showing less cell")
    }
    
}
