//
//  ColorExtensions.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 05/03/2023.
//

import SwiftUI

extension Color {
	static let darkBlue = Color("dark-blue")
	static let dropShadow = Color("drop-shadow")
	static let lightBlue = Color("light-blue")
	static let regularBlue = Color("blue")
	static let lightOrange = Color("light-orange")
	static let regularOrange = Color("orange")
	static let mediumBlue = Color("medium-blue")
	static let dullBlue = Color("dull-blue")
	static let handle = Color("handle")
	static let slayBlue = Color("slay-blue")
	static let placeholderWhite = Color(red: 1, green: 1, blue: 1, opacity: 0.5)
	
	static let appPrimary = Color("app-primary")
	
	static let pinkThemeBg = Color("pink-theme-bg")
	static let pinkThemeBlue = Color("pink-theme-blue")
	static let pinkThemeBrown = Color("pink-theme-brown")
	static let pinkThemeDarkSkin = Color("pink-theme-dark-skin")
	static let pinkThemeLight = Color("pink-theme-light")
	static let pinkThemePink = Color("pink-theme-pink")
	static let pinkThemePurple = Color("pink-theme-purple")
	static let pinkThemeSkin = Color("pink-theme-skin")
	
	static let blueThemeBg = Color("blue-theme-bg")
	static let blueThemeBlue = Color("blue-theme-blue")
	static let blueThemeLight = Color("blue-theme-light")
	static let blueThemeDark = Color("blue-theme-dark")
}

extension ShapeStyle where Self == Color {
	static var darkBlue: Color { .darkBlue }
	static var dropShadow: Color { .dropShadow }
	static var lightBlue: Color { .lightBlue }
	static var regularBlue: Color { .regularBlue }
	static var lightOrange: Color { .lightOrange }
	static var regularOrange: Color { .regularOrange }
	static var mediumBlue: Color { .mediumBlue }
	static var dullBlue: Color { .dullBlue }
	static var handle: Color { .handle }
	static var slayBlue: Color { .slayBlue }
	static var placeholderWhite: Color { .placeholderWhite }
	
	static var appPrimary: Color { .appPrimary }
	
	static var pinkThemeBg: Color { .pinkThemeBg }
	static var pinkThemeBlue: Color { .pinkThemeBlue }
	static var pinkThemeBrown: Color { .pinkThemeBrown }
	static var pinkThemeDarkSkin: Color { .pinkThemeDarkSkin }
	static var pinkThemeLight: Color { .pinkThemeLight }
	static var pinkThemePink: Color { .pinkThemePink }
	static var pinkThemePurple: Color { .pinkThemePurple }
	static var pinkThemeSkin: Color { .pinkThemeSkin }
	
	static var blueThemeBg: Color { .blueThemeBg }
	static var blueThemeBlue: Color { .blueThemeBlue }
	static var blueThemeDark: Color { .blueThemeDark }
	static var blueThemeLight: Color { .blueThemeLight }
}
