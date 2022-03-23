//
//  LandmarkDetail.swift
//  MacLandmarks
//
//  Created by Mikhail Medvedev on 19.03.2022.
//

import SwiftUI
import MapKit

struct LandmarkDetail: View {
	@EnvironmentObject var storage: DataRepository
	var landmark: Landmark

	var landmarkIndex: Int {
		storage.landmarks.firstIndex(where: { $0.id == landmark.id }) ?? 0
	}

	var body: some View {
		ScrollView {
			ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
				MapView(coordinate: landmark.locationCoordinate)
					.frame(height: 300)
					.ignoresSafeArea(edges: .all)
				Button("Open in Maps") {
					let destination = MKMapItem(placemark: MKPlacemark(coordinate: landmark.locationCoordinate))
					destination.name = landmark.name
					destination.openInMaps()
				}
				.padding()
			}
			VStack(alignment: .leading, spacing: 20) {
				HStack(spacing: 24) {
					CircleImage(image: landmark.image)
					VStack(alignment: .leading) {
						HStack {
							Text(landmark.name)
								.font(.title)
							FavoriteButton(isSet: $storage.landmarks[landmarkIndex].isFavorite)
								.buttonStyle(.plain)
						}
						VStack {
							Text(landmark.park)
							Text(landmark.state)
						}
						.font(.subheadline)
						.foregroundColor(.secondary)
					}
				}
				Divider()
				Text("About \(landmark.name)")
					.font(.title2)
				Text(landmark.description)
			}
			.padding()
			.frame(minWidth: 450, maxWidth: 700)
			.offset(y: -70)
			Spacer()
		}
		.navigationTitle(landmark.name)
	}
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
		LandmarkDetail(landmark: DataRepository().landmarks[0])
			.environmentObject(DataRepository())
    }
}
