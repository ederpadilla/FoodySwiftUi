//
//  FoodyError.swift
//  FoodySwiftUI
//
//  Created by Eder  Padilla on 25/07/22.
//

import Foundation

enum FoodyError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case noInternet
    case unknown
    case notFoundedUser
}
