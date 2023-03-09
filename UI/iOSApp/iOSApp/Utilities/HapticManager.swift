//
//  HapticManager.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 09/03/2023.
//

import UIKit

class HapticManager {
	static let shared = HapticManager()
	
	private var lightImpactGenerator: UIImpactFeedbackGenerator?
	
	private init() {
		lightImpactGenerator = UIImpactFeedbackGenerator(style: .light)
		lightImpactGenerator?.prepare()
	}
	
	func generateFeedback() {
		lightImpactGenerator?.impactOccurred()
	}
}
