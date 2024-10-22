//
//  Untitled.swift
//  LabPractical
//
//  Created by Sithum Raveesha on 2024-10-16.
//
import SwiftUI

class AppViewModel: ObservableObject {
    @Published var systemColor: AppTheme = .green
    @Published var fontSize: Double = 16
    
    func updateSystemColor(_ color: AppTheme) {
        systemColor = color
    }
    
    func updateFontSize(_ size: Double) {
        fontSize = size
    }
}
