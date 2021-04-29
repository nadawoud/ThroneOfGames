//
//  NYTimesError.swift
//  NYTimes News
//
//  Created by Nada Yehia Dawoud on 13/12/2020.
//

import Foundation

enum TOGError: Error {
    case incorrectURL
    case noInternetConnection
    case invalidServerResponse
    case noData
    case invalidData
    
    var error: String {
        switch self {
        
        case .incorrectURL:
            return "Unable to complete your request. Please try again."
        case .noInternetConnection:
            return "Couldn't complete your request. Please check your internet connection."
        case .invalidServerResponse:
            return "Uh oh 😅! Something went wrong. Please try again."
        case .noData:
            return "We're very sorry 😅! Something went wrong. Please try again."
        case .invalidData:
            return "This is embarrassing 😅! Would you try again, please."
        }
    }
}

