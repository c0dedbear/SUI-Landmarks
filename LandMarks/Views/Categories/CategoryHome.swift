//
//  CategoryHome.swift
//  LandMarks
//
//  Created by Михаил Медведев on 21.02.2022.
//

import SwiftUI

struct CategoryHome: View {
	@EnvironmentObject var dataStorage: DataRepository
	@State private var showingProfile = false

	var body: some View {
		NavigationView {
			List {
				PageView(pages: self.dataStorage.features.map { FeatureCard(landmark: $0) })
					.aspectRatio(3 / 2, contentMode: .fit)
					.listRowInsets(EdgeInsets())
				ForEach(dataStorage.categories.keys.sorted(), id: \.self) { key in
					CategoryRow(categoryName: key, items: dataStorage.categories[key] ?? [])
				}
				.listRowInsets(EdgeInsets())
			}
			.listStyle(.inset)
			.navigationTitle("Featured")
			.toolbar {
				Button {
					self.showingProfile.toggle()
				} label: {
					Label("User Profile", systemImage: "person.crop.circle")
				}
			}
			.sheet(isPresented: $showingProfile) {
				ProfileHost()
					.environmentObject(self.dataStorage)
			}
		}
	}
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
			.environmentObject(DataRepository())
    }
}
