//
//  LandMarkRow.swift
//  LandMarks
//
//  Created by Михаил Медведев on 24.12.2021.
//

import SwiftUI

struct LandMarkRow: View {
	var landmark: Landmark

	var body: some View {
		HStack {
			landmark.image
				.resizable()
				.frame(width: 50, height: 50)
				.cornerRadius(5)
			VStack(alignment: .leading) {
				Text(landmark.name)
					.bold()
			#if !os(watchOS)
				Text(landmark.park)
					.font(.caption)
					.foregroundColor(.secondary)
			#endif
			}
			Spacer()
			if landmark.isFavorite {
				Image(systemName: "star.fill")
					.foregroundColor(.yellow)
			}
		}
		.padding(.vertical, 4)
    }
}

struct LandMarkRow_Previews: PreviewProvider {
	static var previews: some View {
		Group {
			LandMarkRow(landmark: DataRepository().landmarks[0])
				.previewLayout(.sizeThatFits)
			LandMarkRow(landmark: DataRepository().landmarks[1])
				.previewLayout(.sizeThatFits)
		}
	}
}
