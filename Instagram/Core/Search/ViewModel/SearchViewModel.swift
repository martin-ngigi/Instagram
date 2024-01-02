//
//  SearchViewModel.swift
//  Instagram
//
//  Created by Martin Wainaina on 02/01/2024.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task { try await fetchAllUsers() }
    }
    
    @MainActor // update main thread
    func fetchAllUsers() async throws {
        self.users = try await UserService.fetchAllUsers()
    }
    
}
