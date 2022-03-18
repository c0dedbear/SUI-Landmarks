//
//  Profile.swift
//  LandMarks
//
//  Created by Михаил Медведев on 21.02.2022.
//

import Foundation

struct Profile
{
	var username: String
	var prefersNotifications = true
	var seasonalPhoto = Season.winter
	var goalDate = Date()
}

extension Profile
{
	static let `default` = Profile(username: "m_medvedev")
}
