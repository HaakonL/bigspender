//
//  DecimalExtensions.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 05/03/2023.
//

import Foundation

extension Decimal {
	
	func rounded(_ roundingMode: NSDecimalNumber.RoundingMode = .plain, scale: Int = 0) -> Self {
		var result = Self()
		var number = self
		NSDecimalRound(&result, &number, scale, roundingMode)
		return result
	}
	
	var whole: Self { rounded( sign == .minus ? .up : .down) }
	
	var fraction: Self { self - whole }
	
	var int: Int {
		NSDecimalNumber(decimal: whole).intValue
	}
}
