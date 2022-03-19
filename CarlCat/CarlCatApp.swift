//
//  CarlCatApp.swift
//  CarlCat
//
//  Created by Dan Payne on 3/19/22.
//

import SwiftUI
import FirebaseService

@main
struct CarlCatApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject private var authState = AuthState()
    
    
    var body: some Scene {
        WindowGroup {
            switch authState.value {
            case .undefined:
                ProgressView()
            case .authenticated:
                NavigationView {
                    ContentView()
                    
                }
            case .notAuthenticated:
                AuthView()
                
            }
        }
    }
}
