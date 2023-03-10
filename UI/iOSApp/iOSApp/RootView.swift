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
	@State var showAddPurchase = false
	
    var body: some View {
		ZStack {
			Color.darkBlue.ignoresSafeArea()
			
			VStack(spacing: 0) {
				HeaderView()
				OverviewView(showAddPurchase: $showAddPurchase)
			}
		}
		.sheet(isPresented: $showAddPurchase) {
			AddPurchaseView()
		}
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
