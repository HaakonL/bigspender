//
//  RepositoryObject.swift
//  Core
//
//  Created by Haakon Langaas Lageng on 12/03/2023.
//

import Foundation

public protocol RepositoryObject {
	func toDomainObject() -> DomainObject
}
