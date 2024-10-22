//
//  Settings.swift
//  LabPractical
//
//  Created by Sithum Raveesha on 2024-10-09.
//

import SwiftUI
import SwiftUI

enum AppTheme: String, CaseIterable {
    case red = "Red"
    case orange = "Orange"
    case green = "Green"
}

struct Settings: View {
    @ObservedObject var viewModel: AppViewModel

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Font Size (\(viewModel.fontSize, specifier: "%.1f") px)")
                Slider(value: $viewModel.fontSize, in: 16...24)
                
                HStack {
                    Text("System Color:")
                    Picker("", selection: $viewModel.systemColor) {
                        ForEach(AppTheme.allCases, id: \.self) { theme in
                            Text(theme.rawValue)
                        }
                    }
                    Color(viewModel.systemColor.rawValue)
                        .frame(width: 30, height: 30)
                }
                Spacer()
            }
            .padding()
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    Settings(viewModel: AppViewModel())
}
