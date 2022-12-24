//
//  ViewController.swift
//  WhatWatch
//
//  Created by Levan Charuashvili on 23.12.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var test: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,NSAttributedString.Key.font: UIFont(name: "Oswald", size: 20)!]
        presentModal()
    }

    
    private func presentModal() {
        let ModalViewController = ModalViewController()
        let nav = UINavigationController(rootViewController: ModalViewController)
        nav.isModalInPresentation = true
        nav.modalPresentationStyle = .pageSheet
        
        
        // 2
        if let sheet = nav.sheetPresentationController {

            // 3
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 35
            
        }
        // 4
        present(nav, animated: true, completion: nil)

    }

}

