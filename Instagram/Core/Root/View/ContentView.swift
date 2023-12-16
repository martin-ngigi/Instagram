//
//  ContentView.swift
//  Instagram
//
//  Created by Martin Wainaina on 11/12/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContententViewModel()
    @StateObject var registrationViewModel = RegistrationViewModel()
    
    var body: some View {
        Group{
            // user not logged in
            if viewModel.userSession == nil {
                LoginView()
                    .environmentObject(registrationViewModel) // initialize registrationViewModel as environmentObject
            }
            // user is logged in
            else if let currentUser = viewModel.currentUser{
                MainTabView(user: currentUser)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
