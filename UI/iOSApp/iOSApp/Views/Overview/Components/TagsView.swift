//
//  Tags.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 05/03/2023.
//

import SwiftUI
import WrappingStack
import Core

struct TagsView: View {
	var tags: [Tag]
	var tagWasTapped: ((Tag) -> Void)?
	@State var isSelected = false
	@State var selectedTags: [Tag] = []
	
	func updateSelected(_ tag: Tag) {
		if selectedTags.contains(tag) {
			selectedTags = selectedTags.filter { $0 != tag }
		} else {
			selectedTags.append(tag)
		}
	}
	
    var body: some View {
		VStack(alignment: .leading) {
			WrappingHStack (id: \.self, alignment: .leading, horizontalSpacing: 10, verticalSpacing: 10) {
				ForEach(tags, id: \.self) { tag in
					Button {
						withAnimation(nil) {
							updateSelected(tag)
						}
						if tagWasTapped != nil {
							tagWasTapped!(tag)
						}
					} label: {
						Text("#\(tag.tag)")
							.padding(.horizontal, 8)
							.padding(.vertical, 3)
							.background(selectedTags.contains(tag) ? .regularOrange : .mediumBlue)
							.cornerRadius(5)
							.foregroundColor(selectedTags.contains(tag) ? .white : .lightBlue)
							.font(AppFont.body)
					}
				}
			}
		}
    }
}

struct TagsView_Previews: PreviewProvider {
    static var previews: some View {
		let tags: [Tag] = [Tag(id: "abc", tag: "tagger")]
		TagsView(tags: tags, tagWasTapped: nil)
    }
}
