//
//  LandmarkDetail.swift
//  WatchLandmarks WatchKit Extension
//
//  Created by Mikhail Medvedev on 18.03.2022.
//

import SwiftUI

struct LandmarkDetail: View {
	@EnvironmentObject var storage: DataRepository
	var landmark: Landmark
	
	var landmarkIndex: Int {
		self.storage.landmarks.firstIndex(where: { $0.id == self.landmark.id })!
	}
	
	var body: some View {
		ScrollView {
			VStack {
				CircleImage(image: self.landmark.image.resizable())
					.scaledToFit()
				Text(landmark.name)
					.font(.headline)
					.lineLimit(0)
				
				Toggle(isOn: $storage.landmarks[landmarkIndex].isFavorite) {
					Text("Favorite")
				}
				
				Divider()
				
				Text(landmark.park)
					.font(.caption)
					.bold()
					.lineLimit(0)
				
				Text(landmark.state)
					.font(.caption)
				
				Divider()
				
				MapView(coordinate: self.landmark.locationCoordinate)
					.scaledToFit()
			}
			.padding(16)
		}
		.navigationTitle("Landmarks")
	}
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
		let storage = DataRepository()
		Group {
			LandmarkDetail(landmark: storage.landmarks[0])
				.environmentObject(storage)
				.previewDevice("Apple Watch Series 7 - 45mm")
			LandmarkDetail(landmark: storage.landmarks[1])
				.environmentObject(storage)
				.previewDevice("Apple Watch Series 6 - 40mm")
		}
    }
}
