//
//  Marvel_ComicsApp.swift
//  Marvel Comics
//
//  Created by Marlow Charite on 11/9/22.
//

import SwiftUI

@main
struct Marvel_ComicsApp: App {
   
    // MARK: - Properties
    
    private static let networkClient = NetworkClient(with: Secrets())
    private static let comicsAPI = ComicsAPI(service: Self.networkClient)
    private static let repository = RemoteComicsRepository(store: Self.comicsAPI)
    
    @StateObject private var appCoordinator = AppCoordinator(Self.repository)
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                LibraryView(viewModel: appCoordinator.libraryViewModel)
            }
        }
    }
}
