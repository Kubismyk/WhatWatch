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
        testModal()
    }

//
//    private func presentModal() {
//        let ModalViewController = ModalViewController()
//        let nav = UINavigationController(rootViewController: ModalViewController)
//        nav.isModalInPresentation = true
//        nav.modalPresentationStyle = .pageSheet
//        if let sheet = nav.sheetPresentationController {
//
//            // 3
//            sheet.detents = [.medium(), .large()]
//            sheet.prefersGrabberVisible = true
//            sheet.preferredCornerRadius = 35
//
//        }
//        // 4
//        present(nav, animated: true, completion: nil)
//
//    }
    
    private func testModal(){
        let backDropActionSheet = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BackDrop") as! ModalViewController
        
        if let sheet = backDropActionSheet.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.preferredCornerRadius = 35
            sheet.prefersScrollingExpandsWhenScrolledToEdge = true
            sheet.prefersGrabberVisible = true
        } // backdrop styling and stuff
        
        
        self.present(backDropActionSheet,animated: true,completion: nil)
    }

}

