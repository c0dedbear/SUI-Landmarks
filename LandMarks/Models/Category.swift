//
//  Category.swift
//  LandMarks
//
//  Created by Михаил Медведев on 21.02.2022.
//

import Foundation

enum Category: String, CaseIterable, Codable
{
	case lakes = "Lakes"
	case rivers = "Rivers"
	case mountains = "Mountains"
}

extension Category {
	enum Filter: String, CaseIterable, Identifiable {
		case all = "All"
		case lakes = "Lakes"
		case rivers = "Rivers"
		case mountains = "Mountains"
		
		var id: Filter { self }
	}
}
