//
//  WelcomeView.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 09/02/2023.
//

import SwiftUI

struct WelcomeView: View {
	
	@Binding var currentStep: OnboardingStep
	
    var body: some View {
		VStack {
			Spacer()
			
			Text("Welcome to Big Spender")
				.font(.title)
			
			Text("Track your spendings and project your near future economy")
				.font(.body)
			
			Spacer()
			
			Button {
				currentStep = .phoneNumber
			} label: {
				Text("Get Started")
			}
			.buttonStyle(OnboardingButtonStyle())
			
			Text("Accept shit...")
				.font(.caption)
				.padding(.top, 15)
				.padding(.bottom, 40)
		}
		.padding(.horizontal)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
		WelcomeView(currentStep: .constant(.welcome))
    }
}
