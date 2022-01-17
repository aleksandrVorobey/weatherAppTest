//
//  ViewController.swift
//  weatherAppTest
//
//  Created by Александр Воробей on 17.01.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(URLFactory.url(lat: 55.75, lon: 37.61))
    }

    
}

