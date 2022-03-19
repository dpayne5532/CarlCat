//
//  AuthView.swift
//  FirebaseAuthDemo
//
//  Created by Alex Nagy on 06.03.2022.
//

import SwiftUI
import FirebaseService


struct AuthView: View {
    
    @StateObject private var appleService = FirebaseSignInWithAppleService()
    
    
    
    var body: some View {
        VStack {
            Image("Logo")
                .resizable()
                .frame(width: 200, height: 200)
                .padding(.top, 100)
            Spacer()
            
//            FirebaseSignInWithAppleButton(label: .continue) { result in
//                switch result {
//
//                case .success(let result):
//                    self.handleAppleServiceSuccess(result)
//                case .failure( let err):
//                    handleAppleServiceError(err)
//                }
//
//
//            }
//            .frame(height: 50)
//            .padding()
            
            Button {
                authenticate()
            } label: {
                Label {
                    Text("Authenticate with Apple")
                } icon: {
                    Image(systemName: "applelogo")
                }
                .foregroundColor(.white)
            }
            .buttonStyle(.borderedProminent)
            Spacer()
            
        }
    }
    
    func authenticate() {
        appleService.signIn { result in
            handleAppleServiceSuccess(result)
            
            
        } onFailed: { err in
            handleAppleServiceError(err)
            
        }
        
    }
    
    func handleAppleServiceSuccess(_ result: FirebaseSignInWithAppleResult) {
        let uid = result.uid
        let firstName = result.token.appleIDCredential.fullName?.givenName ?? ""
        let familyName = result.token.appleIDCredential.fullName?.familyName ?? ""

        print(uid)
        print(firstName)
        print(familyName)
        
        
    }

    func handleAppleServiceError(_ error: Error) {
        print(error.localizedDescription)

    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
