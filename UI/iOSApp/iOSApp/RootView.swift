//
//  ContentView.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 29/01/2023.
//

import SwiftUI
import Core
import Resolver

struct RootView: View {
	@State var isOnboarding = !AuthViewModel.isUserLoggedIn()
	@State var showAddPurchaseView = false
	
    var body: some View {
		ZStack {
			Color.darkBlue.ignoresSafeArea()
			
			VStack(spacing: 0) {
				HeaderBar()
				OverviewView()
			}
		}
		.sheet(isPresented: $showAddPurchaseView) {
			AddPurchaseView()
		}		
		/*.fullScreenCover(isPresented: $isOnboarding) {
			OnboardingContainerView(isOnboarding: $isOnboarding)
		}*/
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
