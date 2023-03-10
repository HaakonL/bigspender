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
}
