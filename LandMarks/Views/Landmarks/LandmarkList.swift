//
//  LandmarkList.swift
//  LandMarks
//
//  Created by Михаил Медведев on 24.12.2021.
//

import SwiftUI

struct LandmarkList: View {
	@EnvironmentObject var landmarksStorage: DataRepository
	@State private var showFavoritesOnly = false

	private var filteredLandmarks: [Landmark] {
		landmarksStorage.landmarks.filter { !showFavoritesOnly || $0.isFavorite }
	}

	var body: some View {
		NavigationView {
			List {
				Toggle(isOn: $showFavoritesOnly) {
					Text("Favorites only")
				}
				ForEach(filteredLandmarks) { landmark in
					NavigationLink {
						LandmarkDetail(landmark: landmark)
					} label: {
						LandMarkRow(landmark: landmark)
					}
				}
			}
			.navigationTitle("Landmarks")
		}
	}
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
		ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
			LandmarkList()
				.previewDevice(PreviewDevice(rawValue: deviceName))
				.previewDisplayName(deviceName)
				.environmentObject(DataRepository())
		}
    }
}
