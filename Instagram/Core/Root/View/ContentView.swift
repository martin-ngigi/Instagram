//
//  ContentView.swift
//  Instagram
//
//  Created by Martin Wainaina on 11/12/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContententViewModel()
    var body: some View {
        Group{
            // user not logged in
            if viewModel.userSession == nil {
                LoginView()
            }
            // user is logged in
            else{
                MainTabView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
