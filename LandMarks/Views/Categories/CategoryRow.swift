//
//  CategoryRow.swift
//  LandMarks
//
//  Created by Михаил Медведев on 21.02.2022.
//

import SwiftUI

struct CategoryRow: View {
	var categoryName: String
	var items: [Landmark]

	var body: some View {
		VStack(alignment: .leading) {
			Text(categoryName)
				.font(.headline)
				.padding(.leading, 15)
				.padding(.top, 5)

			ScrollView(.horizontal, showsIndicators: false) {
				HStack(alignment: .top, spacing: 0) {
					ForEach(self.items) { item in
						NavigationLink {
							LandmarkDetail(landmark: item)
						} label: {
							CategoryItem(landmark: item)
						}
					}
				}
			}
			.frame(height: 185)
		}
	}
}

struct CategoryRow_Previews: PreviewProvider {
	static var landmarks = DataRepository().landmarks

	static var previews: some View {
		CategoryRow(
			categoryName: landmarks[0].category.rawValue,
			items: Array(landmarks.prefix(3))
		)
	}
}
