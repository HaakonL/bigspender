//
//  FontWithLineHeightModifier.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 04/03/2023.
//

import Foundation
import SwiftUI

struct FontWithLineHeight: ViewModifier {
	let font: UIFont
	let lineHeight: CGFloat
	
	func body(content: Content) -> some View {
		content
			.font(Font(font))
			.lineSpacing(lineHeight - font.lineHeight)
			.padding(.vertical, (lineHeight - font.lineHeight) / 2)
	}
}

extension View {
	func fontWithLineHeight(font: UIFont, lineHeight: CGFloat) -> some View {
		modifier(FontWithLineHeight(font: font, lineHeight: lineHeight))
	}
}
