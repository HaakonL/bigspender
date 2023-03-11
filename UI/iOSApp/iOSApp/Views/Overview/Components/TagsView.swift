//
//  Categories.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 05/03/2023.
//

import SwiftUI
import WrappingStack
import Core

struct TagsView: View {
	var tags: [Tag]?
    var body: some View {
		if let tags = tags?.map({ $0.tag }) {
			VStack(alignment: .leading) {
				WrappingHStack (id: \.self, alignment: .leading, horizontalSpacing: 10, verticalSpacing: 10) {
					ForEach(tags, id: \.self) { tag in
						Text("#\(tag)")
							.padding(.horizontal, 8)
							.padding(.vertical, 3)
							.background(.mediumBlue)
							.cornerRadius(5)
							.foregroundColor(.lightBlue)
							.font(AppFont.body)
					}
				}
			}
		}
    }
}

struct TagsView_Previews: PreviewProvider {
    static var previews: some View {
		TagsView()
    }
}
