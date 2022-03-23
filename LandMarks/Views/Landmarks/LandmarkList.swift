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
	@State private var filter = Category.Filter.all
	@State private var selectedLandmark: Landmark?

	private var filteredLandmarks: [Landmark] {
		self.landmarksStorage.landmarks.filter {
			(!self.showFavoritesOnly || $0.isFavorite)
			&& (self.filter == .all || self.filter.rawValue == $0.category.rawValue)
		}
	}
	
	private var selectedLandmarkIndex: Int? {
		self.landmarksStorage.landmarks.firstIndex(where: { $0.id == self.selectedLandmark?.id })
	}
	
	private var title: String {
		let title = self.filter == .all ? "Landmarks" : self.filter.rawValue
		return self.showFavoritesOnly ? "Favorite \(title)" : title
	}

	var body: some View {
		NavigationView {
			List(selection: $selectedLandmark) {
				ForEach(filteredLandmarks) { landmark in
					NavigationLink {
						LandmarkDetail(landmark: landmark)
					} label: {
						LandMarkRow(landmark: landmark)
					}
					.tag(landmark)
				}
				
			}
			.navigationTitle(self.title)
			.frame(minWidth: 400)
			.toolbar {
				ToolbarItem {
					Menu {
						Picker("Category", selection: $filter) {
							ForEach(Category.Filter.allCases) {
								Text($0.rawValue).tag($0)
							}
						}
						.pickerStyle(.inline)
						Toggle(isOn: $showFavoritesOnly) {
							Text("Favorites only")
						}
					} label: {
						Label("Filter", systemImage: "slider.horizontal.3")
					}
				}
			}
			Text("Select a Landmark")
		}
		.focusedValue(\.selectedLandmark, $landmarksStorage.landmarks[self.selectedLandmarkIndex ?? 0])
	}
}

struct LandmarkList_Previews: PreviewProvider {
	static var previews: some View {
		LandmarkList()
			.environmentObject(DataRepository())
		
	}
}
