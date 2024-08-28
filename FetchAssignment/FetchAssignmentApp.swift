//
//  FetchAssignmentApp.swift
//  FetchAssignment
//
//  Created by Joel Ferriera on 8/28/24.
//

import AppDomain
import SwiftUI

@main
struct FetchAssignmentApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: .init(networkManager: DefaultNetworkManager()))
        }
    }
}
