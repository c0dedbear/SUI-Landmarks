//
//  NotificationController.swift
//  WatchLandmarks WatchKit Extension
//
//  Created by Mikhail Medvedev on 18.03.2022.
//

import WatchKit
import SwiftUI
import UserNotifications

final class NotificationController: WKUserNotificationHostingController<NotificationView> {
	private var landmark: Landmark?
	private var title: String?
	private var message: String?
	
	private let landmarkIndexKey = "landmarkIndex"

    override var body: NotificationView {
		NotificationView(title: self.title,
						 message: self.message,
						 landmark: self.landmark)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

	override func didReceive(_ notification: UNNotification) {
		let storage = DataRepository()
		
		let notificationData = notification.request.content.userInfo as? [String: Any]
		
		let aps = notificationData?["aps"] as? [String: Any]
		let alert = aps?["alert"] as? [String: Any]
		
		self.title = alert?["title"] as? String
		self.message = alert?["body"] as? String
		
		if let index = notificationData?[self.landmarkIndexKey] as? Int {
			self.landmark = storage.landmarks[index]
		}
	}
}
