//
//  OnboardingContainerView.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 09/02/2023.
//

import SwiftUI

enum OnboardingStep: Int {
	case welcome = 0
	case phoneNumber = 1
	case verification = 2
	case profile = 3
}

struct OnboardingContainerView: View {
	
	@State var currentStep = OnboardingStep.welcome
	@Binding var isOnboarding: Bool
	
    var body: some View {
		ZStack {
			Color("background").ignoresSafeArea()
			
			switch currentStep {
				case .welcome:
					WelcomeView(currentStep: $currentStep)
				case .phoneNumber:
					PhoneNumberView(currentStep: $currentStep)
				case .verification:
					VerificationView(currentStep: $currentStep)
				case .profile:
					CreateProfileView(isOnboarding: $isOnboarding)
			}
		}
    }
}

struct OnboardingContainerView_Previews: PreviewProvider {
    static var previews: some View {
		OnboardingContainerView(isOnboarding: .constant(true))
    }
}
