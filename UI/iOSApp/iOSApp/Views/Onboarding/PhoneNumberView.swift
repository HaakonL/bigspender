//
//  PhoneNumberView.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 08/02/2023.
//

import SwiftUI
import Resolver

struct PhoneNumberView: View {
	
	@ObservedObject private var viewModel: PhoneNumberViewModel = Resolver.resolve()
	@Binding var currentStep: OnboardingStep
	@State private var phoneNumber = ""
	
    var body: some View {
		VStack {
			
			Text("Phone number")
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
					TextField("e.g. +1 123 123 1234", text: $phoneNumber)
						.font(.body)
					
					Spacer()
					
					Button {
						phoneNumber = ""
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
				AuthViewModel.sendPhoneNumber(phone: phoneNumber) { error in
					if error == nil {
						currentStep = .verification
					}
					else {
						// show an error
						print(error)
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

struct PhoneNumberView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNumberView(currentStep: .constant(.phoneNumber))
    }
}
