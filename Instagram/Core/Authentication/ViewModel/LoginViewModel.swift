//
//  LoginViewModel.swift
//  Instagram
//
//  Created by Martin Wainaina on 16/12/2023.
//

import Foundation

class LoginViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    
    func signIn() async throws {
        try? await AuthService.shared.login(withEmail: email, password: password)
    }
}
