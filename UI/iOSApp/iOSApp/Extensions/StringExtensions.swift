//
//  StringExtensions.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 10/03/2023.
//

import Foundation

extension String {
	func removePrefix(_ prefix: String) -> String {
		guard self.hasPrefix(prefix) else { return self }
		return String(self.dropFirst(prefix.count))
	}
}
