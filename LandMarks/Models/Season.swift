//
//  Season.swift
//  LandMarks
//
//  Created by Михаил Медведев on 21.02.2022.
//

import Foundation

enum Season: String, CaseIterable, Identifiable
{
	case spring = "🌷"
	case summer = "🌞"
	case autumn = "🍂"
	case winter = "☃️"

	var id: String { self.rawValue }
}
