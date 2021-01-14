//
//  Extension.swift
//  Counter
//
//  Created by Justyna Kowalkowska on 14/01/2021.
//

import UIKit

//MARK: - UIViewController Extension

 extension UIViewController {

      static func instantiate<T>() -> T {
         let storyboard = UIStoryboard(name: "Main", bundle: .main)
         let controller = storyboard.instantiateViewController(identifier: "\(T.self)") as! T
         return controller
     }
 }
