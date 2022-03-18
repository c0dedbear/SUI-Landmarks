//
//  HikeBadge.swift
//  LandMarks
//
//  Created by Михаил Медведев on 21.02.2022.
//

import SwiftUI

struct ProfileBadge: View {
	var name: String

	var body: some View {
		VStack(alignment: .center) {
			Badge()
				.frame(width: 250, height: 250)
				.scaleEffect(1.0 / 2.5)
				.frame(width: 100, height: 100)
			Text(self.name)
				.font(.caption)
				.accessibilityLabel("Badge for \(self.name).")
		}
	}
}

struct HikeBadge_Previews: PreviewProvider {
	static var previews: some View {
		ProfileBadge(name: "Preview Testing")
	}
}
