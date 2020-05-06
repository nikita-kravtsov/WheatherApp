//
//  ViewController.swift
//  WheatherApp
//
//  Created by Никита on 5/6/20.
//  Copyright © 2020 Никита. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var wheatherIconImageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelsLikeTemperatureLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func searchPressed(_ sender: UIButton) {
        presentSearchAlertController(with: "Search you city", message: nil, style: .alert)
    }
}

