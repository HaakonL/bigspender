//
//  ViewExtensions.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 24/03/2023.
//

import SwiftUI

extension View {
	func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
		ModifiedContent(content: self, modifier: CornerRadiusModifier(radius: radius, corners: corners))
	}
}
