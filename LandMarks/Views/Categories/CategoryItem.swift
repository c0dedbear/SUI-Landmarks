//
//  CategoryItem.swift
//  LandMarks
//
//  Created by Михаил Медведев on 21.02.2022.
//

import SwiftUI

struct CategoryItem: View {
	var landmark: Landmark

	var body: some View {
		VStack(alignment: .leading) {
			self.landmark.image
				.renderingMode(.original)
				.resizable()
				.frame(width: 155, height: 155)
				.cornerRadius(5)
			Text(self.landmark.name)
				.font(.caption)
				.foregroundColor(.primary)
		}
		.padding(.leading, 15)
	}
}

struct CategoryItem_Previews: PreviewProvider {
	static var previews: some View {
		CategoryItem(landmark: DataRepository().landmarks[0])
	}
}
