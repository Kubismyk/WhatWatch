//
//  ModalViewController.swift
//  WhatWatch
//
//  Created by Levan Charuashvili on 24.12.22.
//

import UIKit

class ModalViewController: UIViewController {
    @IBOutlet weak var moviePosterImage: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var imdbRating: UILabel!
    @IBOutlet weak var movieType: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //self.dismiss(animated: true)
    }
    
    func config(data:Search){
        self.movieName.text = data.title
        self.imdbRating.text = data.year
    }
    
    

}
