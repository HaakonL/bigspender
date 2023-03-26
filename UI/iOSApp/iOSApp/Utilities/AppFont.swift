//
//  FontExtensions.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 04/03/2023.
//

import Foundation
import SwiftUI

class FontName {
	/*static let regular = "Inter-Regular"
	static let italic = "Inter-Italic"
	static let light = "Inter-LightBETA"
	static let medium = "Inter-Medium"
	static let bold = "Inter-Bold"*/
	
	static let light = "Poppins-ExtraLight"
	static let regular = "Poppins-Regular"
	static let italic = "Poppins-Italic"
	static let medium = "Poppins-Medium"
	static let bold = "Poppins-SemiBold"
}

class AppFont {

	public static var appLogoType: Font {
		return .system(size: 22, weight: .bold, design: .rounded)
	}
	
	public static var largeTitle: Font {
		return Font.custom(FontName.medium, size: 32)
	}
	
	public static var title: Font {
		return Font.custom(FontName.medium, size: 26)
	}
	
	public static var titleBold: Font {
		return Font.custom(FontName.bold, size: 26)
	}
	
	public static var subtitle: Font {
		return Font.custom(FontName.medium, size: 22)
	}
	
	public static var subtitleBold: Font {
		return Font.custom(FontName.bold, size: 22)
	}
	
	public static var mediumTitle: Font {
		return Font.custom(FontName.medium, size: 19)
	}
	
	public static var mediumTitleBold: Font {
		return Font.custom(FontName.bold, size: 19)
	}
	
	public static var smallTitle: Font {
		return Font.custom(FontName.medium, size: 16)
	}
	
	public static var smallTitleBold: Font {
		return Font.custom(FontName.bold, size: 16)
	}
	
	public static var caption: Font {
		return Font.custom(FontName.regular, size: 11)
	}
	
	public static var captionBold: Font {
		return Font.custom(FontName.bold, size: 11)
	}
	
	public static var footnote: Font {
		return Font.custom(FontName.regular, size: 12)
	}
	
	public static var dirteen: Font {
		return Font.custom(FontName.regular, size: 13)
	}
	
	public static var body: Font {
		return Font.custom(FontName.regular, size: 14)
	}
	
	public static var bodyLight: Font {
		return Font.custom(FontName.light, size: 14)
	}
	
	public static var bodyItalic: Font {
		return Font.custom(FontName.italic, size: 14)
	}
	
	public static var bodyBold: Font {
		return Font.custom(FontName.bold, size: 14)
	}
	
	public static var smallText: Font {
		return Font.custom(FontName.medium, size: 10)
	}
	
	public static var miniText: Font {
		return Font.custom(FontName.medium, size: 8)
	}
	
	public static var bodyUIFont: UIFont {
		return UIFont(name: FontName.regular, size: 14)!
	}
}
