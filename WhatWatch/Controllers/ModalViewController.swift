//
//  ModalViewController.swift
//  WhatWatch
//
//  Created by Levan Charuashvili on 24.12.22.
//

import UIKit

class ModalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        //self.dismiss(animated: true)
    }
    

    @IBAction func generateNewMovieButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    

}
