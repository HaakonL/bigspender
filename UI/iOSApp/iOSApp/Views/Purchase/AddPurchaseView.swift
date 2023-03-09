//
//  AddPurchaseView.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 07/03/2023.
//

import SwiftUI

struct AddPurchaseView: View {
	@Environment(\.dismiss) var dismiss
	
	@State private var titleText: String = ""
	@State private var purchaseDate: Date = Date().noon()
	@State private var amount: Int = 0
	
	var body: some View {
		ZStack {
			Color.darkBlue.ignoresSafeArea()
			
			VStack(spacing: 20) {
				Text("Add purchase")
					.font(AppFont.largeTitle)
				
				TextField("Description, ie. Foo Bar", text: $titleText)
					.textFieldStyle(.plain)
					.padding(15)
					.accentColor(.regularOrange)
					.background(.lightBlue)
					.foregroundColor(.white)
					.cornerRadius(10)
					.shadow(color: .dropShadow, radius: 4, x: 4, y: 4)
				
				DatePicker("Purchase date", selection: $purchaseDate, displayedComponents: .date)
					.datePickerStyle(.graphical)
					.padding(15)
					.accentColor(.regularOrange)
					.background(.lightBlue)
					.foregroundColor(.white)
					.clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
				
				TextField("Amount", value: $amount, format: .number)
					.textFieldStyle(.plain)
					.padding(15)
					.accentColor(.regularOrange)
					.background(.lightBlue)
					.foregroundColor(.white)
					.cornerRadius(10)
					.shadow(color: .dropShadow, radius: 4, x: 4, y: 4)
				
				Button {
					//
				} label: {
					Text("Save")
				}
				.buttonStyle(.borderedProminent)

				Spacer()
				
				Button {
					dismiss()
				} label: {
					Text("Dismiss")
				}
				.tint(.regularOrange)
			}
			.font(AppFont.body)
			.foregroundColor(.white)
			.padding()
		}
	}
}

struct AddPurchaseView_Previews: PreviewProvider {
    static var previews: some View {
        AddPurchaseView()
    }
}
