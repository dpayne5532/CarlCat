//
//  ContentView.swift
//  FirebaseAuthDemo
//
//  Created by Alex Nagy on 06.03.2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            Image("Home")
                .resizable()
                .scaledToFill()
        }
        .padding(.top)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button {
                Task {
                    do {
                        try await viewModel.logout()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            } label: {
                Text("Logout")
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
