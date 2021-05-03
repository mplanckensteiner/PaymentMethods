//
//  PayoneerError.swift
//  PayoneerCodingChallenge
//
//  Created by Miguel Planckensteiner on 5/3/21.
//

import Foundation

enum ErrorMessage: String, Error {
    case unableToComplete = "Unable to complete your request.\nCheck your internet connection."
    case invalidResponse = "Invalid response from the server.\nPlease try again."
    case invalidData = "The data recived from the server was invalid.\nPlease try again."
}


