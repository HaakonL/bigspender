//
//  TagDataModel.swift
//  Persistence
//
//  Created by Haakon Langaas Lageng on 04/03/2023.
//

import Foundation
import Core
import FirebaseFirestoreSwift

public class TagDataModel: Codable {
	@DocumentID var id: String?
	public var tag: String
	
	public init() {
		tag = ""
	}
	
	public init(_ model: Tag) {
		self.tag = model.tag
	}
	
	public func toDomainModel() -> Tag {
		return Tag(
			id: id ?? UUID().uuidString,
			tag: tag
		)
	}
}
