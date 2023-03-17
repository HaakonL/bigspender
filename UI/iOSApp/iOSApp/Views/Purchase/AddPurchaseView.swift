//
//  AddPurchaseView.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 07/03/2023.
//

import SwiftUI
import Combine
import Resolver
import Core

struct AddPurchaseView: View {
	@Environment(\.dismiss) var dismiss
	
	@ObservedObject private var viewModel: AddPurchaseViewModel = Resolver.resolve()
	@State private var titleText: String = ""
	@State private var purchaseDate: Date = Date().noon()
	@State private var amount: String = ""
	@State private var selectedCategory: Tag?
	
	var body: some View {
		ZStack {
			Color.darkBlue.ignoresSafeArea()
			
			VStack(spacing: 20) {
				Text("Add purchase")
					.font(AppFont.title)
					.foregroundColor(.white)
				
				let descriptionPrompt: Text = Text("Description, ie. Foo Bar")
					.font(AppFont.body)
					.foregroundColor(.placeholderWhite)
				
				TextField("", text: $titleText, prompt: descriptionPrompt)
					.textFieldStyle(.plain)
					.padding(15)
					.accentColor(.regularOrange)
					.background(.mediumBlue)
					.foregroundColor(.black)
					.cornerRadius(10)
					.shadow(color: .dropShadow, radius: 4, x: 4, y: 4)
				
				let amountPrompt: Text = Text("Amount spent")
					.font(AppFont.body)
					.foregroundColor(.placeholderWhite)
				
				TextField("", text: $amount, prompt: amountPrompt)
					.keyboardType(.numberPad)
					.textFieldStyle(.plain)
					.padding(15)
					.accentColor(.regularOrange)
					.background(.mediumBlue)
					.foregroundColor(.black)
					.cornerRadius(10)
					.shadow(color: .dropShadow, radius: 4, x: 4, y: 4)
					.onReceive(Just(amount)) { newValue in
						let filtered = newValue.filter { "0123456789".contains($0) }
						if filtered != newValue {
							self.amount = filtered
						}
						self.amount = self.amount.removePrefix("0")
					}
				
				DatePicker(selection: $purchaseDate, displayedComponents: .date) {
					Text("Purchase date")
						.font(AppFont.body)
						.foregroundColor(.placeholderWhite)
				}
				.datePickerStyle(.compact)
				.colorScheme(.dark)
				.font(AppFont.body)
				.padding(.horizontal, 15)
				.padding(.vertical, 10)
				.accentColor(.regularBlue)
				.background(.mediumBlue)
				.foregroundColor(.placeholderWhite)
				.clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
				
				TagsView(tagWasTapped: { tapped in
					selectedCategory = tapped
				}, addTagEnabled: true)
					
				Button {
					Task {
						if await viewModel.savePurchase(amount: amount, title: titleText, when: purchaseDate, tag: selectedCategory) {
							dismiss()
						}
					}
				} label: {
					Text("Save")
				}
				.buttonStyle(.borderedProminent)
				.accentColor(.regularBlue)

				Spacer()
				
				Button {
					dismiss()
				} label: {
					Text("Dismiss")
				}
				.tint(.regularOrange)
			}
			.padding()
		}
	}
}

struct AddPurchaseView_Previews: PreviewProvider {
    static var previews: some View {
        AddPurchaseView()
    }
}
