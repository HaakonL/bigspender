//
//  iOSAppApp.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 29/01/2023.
//

import SwiftUI
import Bootstrap

@main
struct Main: App {
	var body: some Scene {
		WindowGroup {
			RootView()
				.preferredColorScheme(.dark)
				.onAppear { _ = HapticManager.shared }
		}
	}
}
