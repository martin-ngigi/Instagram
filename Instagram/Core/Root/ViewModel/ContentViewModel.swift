//
//  ContentViewModel.swift
//  Instagram
//
//  Created by Martin Wainaina on 15/12/2023.
//

import Foundation
import Firebase
import Combine

class ContententViewModel: ObservableObject{
    private let service = AuthService.shared
    private var cancellables = Set<AnyCancellable>()
    
    @Published var userSession: FirebaseAuth.User?
    
    init(){
        setupSubscribers()
    }
    
    func setupSubscribers(){
        service.$userSession.sink{ [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancellables)
    }
}
