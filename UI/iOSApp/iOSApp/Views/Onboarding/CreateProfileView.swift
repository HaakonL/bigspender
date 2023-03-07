//
//  ProfileView.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 09/02/2023.
//

import SwiftUI

struct CreateProfileView: View {
	
	@Binding var isOnboarding: Bool
	@State var firstName: String = ""
	@State var lastName: String = ""
	
	var body: some View {
		VStack {
			
			Text("Setup your profile")
				.font(.largeTitle)
				.padding(.top, 52)
			
			Text("Just a few more details to get started")
				.font(.body)
				.padding(.top, 12)
			
			Button {
				
			} label: {
				ZStack {
					Circle()
						.foregroundColor(.white)
					
					Circle()
						.stroke(Color.blue, lineWidth: 2)
					
					Image(systemName: "camera.fill")
						.tint(Color.gray)
				}
			}
			.frame(width: 134, height: 134)
			
			ZStack {
				Rectangle()
					.frame(height: 46)
					.foregroundColor(.green)
					.cornerRadius(8)
				
				TextField("Given Name", text: $firstName)
					.font(.body)
					.padding()
			}
			
			ZStack {
				Rectangle()
					.frame(height: 46)
					.foregroundColor(.green)
					.cornerRadius(8)
				
				TextField("Last Name", text: $lastName)
					.font(.body)
					.padding()
			}
			
			Spacer()
			
			Button {
				isOnboarding = false
			} label: {
				Text("Finish up!")
			}
			.padding(.bottom, 87)
		}
		.padding(.horizontal)
	}
}

struct CreateProfileView_Previews: PreviewProvider {
    static var previews: some View {
		CreateProfileView(isOnboarding: .constant(true))
    }
}
