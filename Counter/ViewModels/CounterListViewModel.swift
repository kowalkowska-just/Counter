//
//  CounterListViewModel.swift
//  Counter
//
//  Created by Justyna Kowalkowska on 14/01/2021.
//

import Foundation

final class CounterListViewModel {
    
    let title = "Counter"
    
    var coordinator: CounterListCoordinator?
    
    enum Cell {
        case counter(CounterCellViewModel)
    }
    
    private(set) var cells: [Cell] = []
    
    func cell(at indexPath: IndexPath) -> Cell {
        return cells[indexPath.row]
    }
}
