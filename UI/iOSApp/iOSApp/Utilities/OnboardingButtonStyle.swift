//
//  OnboardingButtonStyle.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 09/02/2023.
//

import Foundation
import SwiftUI

struct OnboardingButtonStyle: ButtonStyle {
	func makeBody(configuration: Configuration) -> some View {
		ZStack {
			Rectangle()
				.frame(height: 50)
				.cornerRadius(4)
				.foregroundColor(.blue)
			
			configuration.label
				.font(.title3)
				.foregroundColor(.white)
		}
	}
}
