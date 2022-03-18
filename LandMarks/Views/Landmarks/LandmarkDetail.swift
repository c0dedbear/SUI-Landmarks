//
//  LandmarkDetail.swift
//  LandMarks
//
//  Created by Михаил Медведев on 24.12.2021.
//

import SwiftUI

struct LandmarkDetail: View {
	@EnvironmentObject var storage: DataRepository
	var landmark: Landmark

	var landmarkIndex: Int {
		storage.landmarks.firstIndex(where: { $0.id == landmark.id }) ?? 0
	}

	var body: some View {
		ScrollView {
			MapView(coordinate: landmark.locationCoordinate)
				.frame(height: 300)
				.ignoresSafeArea(edges: .all)
			CircleImage(image: landmark.image)
				.offset(y: -150)
				.padding(.bottom, -150)
			VStack(alignment: .leading) {
				HStack {
				Text(landmark.name)
					.font(.title)
					FavoriteButton(isSet: $storage.landmarks[landmarkIndex].isFavorite)
				}
				HStack {
					Text(landmark.park)
					Spacer()
					Text(landmark.state)
				}
				.font(.subheadline)
				.foregroundColor(.secondary)
				Divider()
				Text("About \(landmark.name)")
					.font(.title2)
				Text(landmark.description)
			}.padding()
			Spacer()
		}
		.navigationTitle(landmark.name)
		.navigationBarTitleDisplayMode(.inline)
	}
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
		LandmarkDetail(landmark: DataRepository().landmarks[0])
			.environmentObject(DataRepository())
    }
}
