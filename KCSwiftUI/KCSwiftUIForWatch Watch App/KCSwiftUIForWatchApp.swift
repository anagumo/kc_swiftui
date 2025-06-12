//
//  KCSwiftUIForWatchApp.swift
//  KCSwiftUIForWatch Watch App
//
//  Created by Ariana Rodríguez on 12/06/25.
//

import SwiftUI

@main
struct KCSwiftUIForWatch_Watch_AppApp: App {
    var body: some Scene {
        WindowGroup {
            CharactersView(
                charactersViewModel: CharactersViewModel(
                    getCharactersUseCase: GetCharactersUseCase()
                )
            )
        }
    }
}
