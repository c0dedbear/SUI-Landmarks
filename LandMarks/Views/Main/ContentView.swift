//
//  ContentView.swift
//  LandMarks
//
//  Created by Михаил Медведев on 22.12.2021.
//

import SwiftUI

struct ContentView: View {
	@State private var selectedTab: Tab = .featured

	enum Tab {
		case featured, list
	}

	var body: some View {
		TabView(selection: $selectedTab) {
			CategoryHome().tag(Tab.featured).tabItem {
				Label("Featured", systemImage: "star")
			}
			LandmarkList().tag(Tab.list).tabItem {
				Label("List", systemImage: "list.bullet")
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
			.environmentObject(DataRepository())
    }
}
