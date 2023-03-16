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

	@State var selectedTag: Tag?
		
    var body: some View {
		VStack(alignment: .leading) {
			HStack {
				Text("Tags")
					.foregroundColor(.white)
					.font(AppFont.smallTitle)
				
				Button {
					//
				} label: {
					Image(systemName: "plus")
				}
			}
			
			WrappingHStack (id: \.self, alignment: .leading, horizontalSpacing: 10, verticalSpacing: 10) {
				ForEach(tags, id: \.self) { tag in
					Button {
						if tagWasTapped != nil {
							withAnimation(nil) {
								selectedTag = tag
							}
							tagWasTapped!(tag)
						}
					} label: {
						Text("#\(tag.title)")
							.padding(.horizontal, 8)
							.padding(.vertical, 3)
							.background(selectedTag == tag ? .regularOrange : .mediumBlue)
							.cornerRadius(5)
							.foregroundColor(selectedTag == tag ? .white : .lightBlue)
							.font(AppFont.body)
					}
				}
			}
		}
		.onAppear {
			if tagWasTapped != nil {
				selectedTag = tags.first { $0.isDefault == true }
			}
		}
    }
}

struct TagsView_Previews: PreviewProvider {
    static var previews: some View {
		let tags: [Tag] = [Tag(id: UUID(), title: "tagger", isDefault: false)]
		TagsView(tags: tags, tagWasTapped: nil)
    }
}
