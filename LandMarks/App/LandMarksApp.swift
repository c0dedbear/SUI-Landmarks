//
//  LandMarksApp.swift
//  LandMarks
//
//  Created by Михаил Медведев on 22.12.2021.
//

import SwiftUI

@main
struct LandMarksApp: App {
	@StateObject private var dataStorage = DataRepository()
	
	var body: some Scene {
		WindowGroup {
			ContentView()
				.environmentObject(self.dataStorage)
		}
		
	#if os(watchOS)
	WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
	#endif
	}
	
}
