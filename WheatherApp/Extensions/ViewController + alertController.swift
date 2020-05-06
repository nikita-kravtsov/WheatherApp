//
//  ViewController + alertController.swift
//  WheatherApp
//
//  Created by Никита on 5/6/20.
//  Copyright © 2020 Никита. All rights reserved.
//

import UIKit

extension ViewController {
    
    func presentSearchAlertController(with title: String?, message: String?, style: UIAlertController.Style) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        alertController.addTextField { textField in
            textField.placeholder = "Enter you city"
        }
        
        let search = UIAlertAction(title: "Search", style: .default) { action in
            
            let textField = alertController.textFields?.first
            guard let cityName = textField?.text else { return }
            if cityName != "" {
                print("Search info for the city")
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(search)
        alertController.addAction(cancel)
        
        present(alertController, animated: true)
    }
}
