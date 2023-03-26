//
//  TextFieldView.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 23/03/2023.
//

import SwiftUI

struct TextFieldView: View {
	var label: String
	@Binding var value: String
	@Binding var error: Bool
	
	init(label: String, value: Binding<String>, error: Binding<Bool>) {
		self.label = label
		self._value = value
		self._error = error
	}
	
    var body: some View {
		VStack(alignment: .leading) {
			ZStack(alignment: .leading) {
				Text(label)
					.padding(.horizontal, value.isEmpty ? 20 : 0)
					.font(value.isEmpty ? AppFont.body : AppFont.caption)
					.foregroundColor(value.isEmpty ? .white : .lightBlue)
					.opacity(value.isEmpty ? 0.5 : 1)
					.offset(y: value.isEmpty ? 0 : -32)
				
				TextField("", text: $value)
					.textFieldStyle(.plain)
					.padding(.vertical, 10)
					.padding(.horizontal, 20)
					.accentColor(.lightBlue)
					.foregroundColor(.white)
					.cornerRadius(10)
					.overlay(
						RoundedRectangle(cornerRadius: 10)
							.stroke(error ? .red : .regularBlue, lineWidth: error ? 2 : 1)
					)
			}
		}
		.animation(.default, value: value)
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
		VStack {
			
			TextFieldView(label: "Textfield label", value: .constant(""), error: .constant(false))
				.previewLayout(.sizeThatFits)
			
			TextFieldView(label: "Textfield label", value: .constant("Some value"), error: .constant(true))
				.previewLayout(.sizeThatFits)
		}
		.padding(20)
    }
}
