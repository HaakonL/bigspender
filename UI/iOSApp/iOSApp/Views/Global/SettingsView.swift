//
//  SettingsView.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 19/03/2023.
//

import SwiftUI

struct SettingsView: View {
	@Environment(\.dismiss) var dismiss
	
    var body: some View {
		VStack {
			Text("Settings")
			Spacer()
			Button {
				dismiss()
			} label: {
				Text("dismiss")
			}
		}
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
