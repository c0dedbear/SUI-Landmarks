//
//  Animation+Extension.swift
//  LandMarks
//
//  Created by Михаил Медведев on 21.02.2022.
//

import SwiftUI

extension Animation {
	static func ripple(index: Int) -> Animation {
		Animation
			.spring(dampingFraction: 0.5)
			.speed(2)
			.delay(0.03 * Double(index))
	}
}
