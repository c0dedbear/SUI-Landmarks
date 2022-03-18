//
//  LandMarksApp.swift
//  LandMarks
//
//  Created by Михаил Медведев on 22.12.2021.
//

import SwiftUI

@main
struct LandMarksApp: App {
	@StateObject private var landmarksRepository = DataRepository()

	var body: some Scene {
        WindowGroup {
            ContentView()
				.environmentObject(self.landmarksRepository)
        }
    }
}
