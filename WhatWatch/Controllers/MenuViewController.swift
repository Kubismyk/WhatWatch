//
//  MenuViewController.swift
//  WhatWatch
//
//  Created by Levan Charuashvili on 24.12.22.
//

import UIKit
import Foundation

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        generateBla()
    }
    

    func generateBla(){

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
                let movieSearch = try decoder.decode(MovieSearch.self, from: data)

                // Select a random movie from the search results
                let randomIndex = Int.random(in: 0..<movieSearch.search.count)
                let randomMovie = movieSearch.search[randomIndex]

                print("The random movie is: \(randomMovie.title)")
            } catch {
                print("Error parsing movie search results: \(error)")
            }
        }.resume()
    }

}


struct MovieSearch: Decodable {
    let search: [Movie]
    let totalResults: String
    let response: String

    enum CodingKeys: String, CodingKey {
        case search
        case totalResults = "totalResults"
        case response
    }
}

struct Movie: Decodable {
    let title: String
    let year: String
    let imdbID: String
    let type: String
    let poster: String

    enum CodingKeys: String, CodingKey {
        case title
        case year = "Year"
        case imdbID = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
}
