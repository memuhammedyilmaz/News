//
//  ThemeManager.swift
//  News
//
//  Created by Muhammed Yılmaz on 16.07.2025.
//

import UIKit

class ThemeManager {
    static let shared = ThemeManager()

    private let themeKey = "theme"

    func applySavedTheme() {
        let savedThemeIndex = UserDefaults.standard.integer(forKey: themeKey)
        let style: UIUserInterfaceStyle = savedThemeIndex == 0 ? .light : .dark
        UIApplication.shared.windows.forEach { window in
            window.overrideUserInterfaceStyle = style
        }
    }

    func saveTheme(_ index: Int) {
        UserDefaults.standard.set(index, forKey: themeKey)
    }
}
