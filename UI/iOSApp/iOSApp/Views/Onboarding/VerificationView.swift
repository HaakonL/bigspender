//
//  PhoneNumberView.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 08/02/2023.
//

import SwiftUI
import Resolver

struct VerificationView: View {
	
	//@ObservedObject private var viewModel: VerificationViewModel = Resolver.resolve()
	@Binding var currentStep: OnboardingStep
	@State private var verificationCode = ""
	
	var body: some View {
		VStack {
			
			Text("Verification")
				.font(.largeTitle)
				.padding(.top, 52)
			
			Text("Enter your mobile number below. We'll send you a verification code after.")
				.font(.body)
				.padding(.top, 12)
			
			ZStack {
				
				Rectangle()
					.frame(height: 56)
					.foregroundColor(.green)
				
				HStack {
					TextField("", text: $verificationCode)
						.font(.body)
						.keyboardType(.numberPad)
					
					Spacer()
					
					Button {
						verificationCode = ""
					} label: {
						Image(systemName: "multiply.circle.fill")
					}
					.frame(width: 19, height: 19)
					.tint(.yellow)
				}
				.padding()
			}
			.padding(.top, 34)
			
			Spacer()
			
			Button {
				AuthViewModel.verifyCode(code: verificationCode) { error in
					if error == nil {
						currentStep = .profile
					}
					else {
						// show an error
						print(error?.localizedDescription)
					}
				}
				
			} label: {
				Text("Next")
			}
			.padding(.bottom, 87)
		}
		.padding(.horizontal)
	}
}

struct VerificationView_Previews: PreviewProvider {
	static var previews: some View {
		VerificationView(currentStep: .constant(.verification))
	}
}
