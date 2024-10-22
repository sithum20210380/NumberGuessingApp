//
//  ContentView.swift
//  LabPractical
//
//  Created by Sithum Raveesha on 2024-10-09.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("systemColor") var systemColor: AppTheme = .green
    @AppStorage("fontSize") var fontSize: Double = 16
    
    @StateObject private var viewModel = AppViewModel()
    
    var body: some View {
        TabView {
            Guess(viewModel: viewModel)
                .tabItem {
                    Label("Game", systemImage: "checkmark.circle.badge.questionmark.fill")
                }
            
            Settings(viewModel: viewModel)
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

#Preview {
    ContentView()
}
