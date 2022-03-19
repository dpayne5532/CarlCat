//
//  ContentViewModel.swift
//  FirebaseAuthDemo
//
//  Created by Alex Nagy on 06.03.2022.
//

import SwiftUI
import Combine
import FirebaseService

extension ContentView {
    
    class ViewModel: ObservableObject {
        
        var cancellables: Set<AnyCancellable> = []
        
        func logout() async throws {
            let promise = AuthService.logout()
            try await AsyncPromise.fulfill(promise, storedIn: &cancellables)
            
        }
    }
}
