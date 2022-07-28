//
//  LocalDataSource.swift
//  FoodySwiftUI
//
//  Created by Eder  Padilla on 27/07/22.
//

import SwiftUI

final class LocalDataSource {
    
    static let shared = LocalDataSource()
    @AppStorage("user") private var userData: Data?
    
    func storeUser(_ user: User, completion: (Bool) -> ()) {
        do {
            let userDecodable = user.asUserLocal()
            let data = try JSONEncoder().encode(userDecodable)
            userData = data
            completion(true)
        } catch {
            completion(false)
        }
    }
}
