//
//  ViewController.swift
//  WhatWatch
//
//  Created by Levan Charuashvili on 23.12.22.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var mainPoster: UIImageView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,NSAttributedString.Key.font: UIFont(name: "Oswald", size: 20)!]
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        mainPoster.isUserInteractionEnabled = true
        mainPoster.addGestureRecognizer(tapGestureRecognizer)
        
        
        modalPopUp()
        movieGenerator()
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView

        modalPopUp()
    }

    
    private func modalPopUp(){
        let backDropActionSheet = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BackDrop") as! ModalViewController
        
        if let sheet = backDropActionSheet.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.preferredCornerRadius = 35
            sheet.prefersScrollingExpandsWhenScrolledToEdge = true
            sheet.prefersGrabberVisible = true
        } // backdrop styling and stuff

        self.present(backDropActionSheet,animated: true,completion: nil)
    }

    
    
    
    private func selfConfig(movieName:String,moviePoster:String){
        DispatchQueue.main.async {
            self.movieName.text = movieName
            let mainPosterUrl = URL(string: moviePoster)
            self.mainPoster.kf.setImage(with: mainPosterUrl)
        }
    }
    
    private func movieGenerator(){

        // Replace YOUR_API_KEY with your OMDb API key
        let apiKey = "616eaa01"

        // Define the API endpoint for searching movies
        let movieSearchURL = URL(string: "http://www.omdbapi.com/?apikey=\(apiKey)&s=star+wars&page=1")!

        // Create a URL request for the API endpoint
        var movieSearchRequest = URLRequest(url: movieSearchURL)

        // Set the HTTP method to "GET"
        movieSearchRequest.httpMethod = "GET"

        // Use URLSession to send the request and parse the response
        URLSession.shared.dataTask(with: movieSearchRequest) { (data, response, error) in
            // Check for errors
            if let error = error {
                print("Error searching for movies: \(error)")
                return
            }

            // Check the response status code
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Error: invalid response status code")
                return
            }

            // Parse the response data
            guard let data = data else {
                print("Error: missing response data")
                return
            }

            // Use the JSONDecoder class to parse the response data into a MovieSearch object
            let decoder = JSONDecoder()
            do {
                let movieSearch = try decoder.decode(Welcome.self, from: data)

                // Select a random movie from the search results
                let randomIndex = Int.random(in: 0..<movieSearch.search.count)
                let randomMovie = movieSearch.search[randomIndex]
                // Movie title on ViewController
                self.selfConfig(movieName: randomMovie.title, moviePoster: randomMovie.poster)
            } catch {
                print("Error parsing movie search results: \(error)")
            }
        }.resume()
    }
    
}

