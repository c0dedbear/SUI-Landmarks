//
//  LandmarkList.swift
//  WatchLandmarks WatchKit Extension
//
//  Created by Mikhail Medvedev on 19.03.2022.
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
        LandmarkList()
			.environmentObject(DataRepository())
    }
}
