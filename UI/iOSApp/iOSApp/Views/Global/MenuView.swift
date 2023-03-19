//
//  Menuview.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 19/03/2023.
//

import SwiftUI

struct MenuView: View {
	@Environment(\.dismiss) var dismiss
	
    var body: some View {
		VStack {
			Text("Menu")
			Spacer()
			Button {
				dismiss()
			} label: {
				Text("dismiss")
			}
		}
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
