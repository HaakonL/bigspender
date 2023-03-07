//
//  AddPurchaseView.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 07/03/2023.
//

import SwiftUI

struct AddPurchaseView: View {
	@Environment(\.dismiss) var dismiss
	
	var body: some View {
		VStack(spacing: 20) {
			Text("Add purchase")
				.font(AppFont.largeTitle)
			
			Text("This is where you add purchases")
				.font(AppFont.title)
				.foregroundColor(.gray)
			
			Text("To be continued...")
				.font(AppFont.body)
			
			Spacer()
			
			Button {
				dismiss()
			} label: {
				Text("Dismiss")
					.font(AppFont.body)
			}
			.tint(.red)
		}
		.padding()
	}
}

struct AddPurchaseView_Previews: PreviewProvider {
    static var previews: some View {
        AddPurchaseView()
    }
}
