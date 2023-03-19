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
	@State private var description: String = ""
	@State private var purchaseDate: Date = Date().noon()
	@State private var amount: String = ""
	@State private var selectedCategory: Tag?
	@State private var descriptionError: Bool = false
	@State private var amountError: Bool = false
	
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
				
				TextField("", text: $description, prompt: descriptionPrompt)
					.textFieldStyle(.plain)
					.padding(15)
					.accentColor(.regularOrange)
					.background(.mediumBlue)
					.foregroundColor(.white)
					.cornerRadius(10)
					.shadow(color: .dropShadow, radius: 4, x: 4, y: 4)
					.onChange(of: description) { newDescription in
						if !newDescription.isEmpty {
							descriptionError = false
						}
					}
					.overlay(
						RoundedRectangle(cornerRadius: 10)
							.stroke(.red, lineWidth: descriptionError ? 2 : 0)
					)
				
				let amountPrompt: Text = Text("Amount spent")
					.font(AppFont.body)
					.foregroundColor(.placeholderWhite)
				
				TextField("", text: $amount, prompt: amountPrompt)
					.keyboardType(.numberPad)
					.textFieldStyle(.plain)
					.padding(15)
					.accentColor(.regularOrange)
					.background(.mediumBlue)
					.foregroundColor(.white)
					.cornerRadius(10)
					.shadow(color: .dropShadow, radius: 4, x: 4, y: 4)
					.onChange(of: amount) { newAmount in
						let filtered = newAmount.filter { "0123456789".contains($0) }
						if filtered != newAmount {
							self.amount = filtered
						}
						self.amount = self.amount.removePrefix("0")
						if !amount.isEmpty {
							amountError = false
						}
					}
					.overlay(
						RoundedRectangle(cornerRadius: 10)
							.stroke(.red, lineWidth: amountError ? 2 : 0)
					)
				
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
					.accentColor(.lightBlue)
					.background(.mediumBlue)
					.foregroundColor(.placeholderWhite)
					.clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
				
				TagsView(tagWasTapped: { tapped in
					selectedCategory = tapped
				})
				
				Spacer()
				
				Button {
					descriptionError = false
					amountError = false
					
					if description.isEmpty {
						descriptionError = true
					}
					if amount.isEmpty || amount == "0" {
						amountError = true
					}
					
					if !descriptionError && !amountError {
						Task {
							if await viewModel.savePurchase(amount: amount, title: description, when: purchaseDate, tag: selectedCategory) {
								dismiss()
							}
						}
					}
				} label: {
					Text("Save")
						.font(AppFont.subtitleBold)
						.padding(.horizontal, 50)
						.padding(.vertical, 10)
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
