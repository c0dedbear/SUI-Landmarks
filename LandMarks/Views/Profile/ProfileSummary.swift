//
//  ProfileSummary.swift
//  LandMarks
//
//  Created by Михаил Медведев on 21.02.2022.
//

import SwiftUI

struct ProfileSummary: View {
	@EnvironmentObject var dataStorage: DataRepository
	var profile: Profile

	var body: some View {
		ScrollView {
			VStack(alignment: .leading, spacing: 10) {
				Text(profile.username)
					.bold()
					.font(.title)

				Text("Notifications: \(profile.prefersNotifications ? "On": "Off" )")
				Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
				Text("Goal Date: ") + Text(profile.goalDate, style: .date)

				Divider()
				VStack(alignment: .leading) {
					Text("Completed Badges")
						.font(.headline)

					ScrollView(.horizontal) {
						HStack {
							ProfileBadge(name: "First Hike")
							ProfileBadge(name: "Earth Day")
								.hueRotation(Angle(degrees: 90))
							ProfileBadge(name: "Tenth Hike")
								.grayscale(0.5)
								.hueRotation(Angle(degrees: 45))
						}
						.padding(.bottom)
					}
				}

				Divider()
				VStack(alignment: .leading) {
					Text("Recent Hikes")
						.font(.headline)

					HikeView(hike: self.dataStorage.hikes[0])
				}
			}
		}
	}
}

struct ProfileSummary_Previews: PreviewProvider {
	static var previews: some View {
		ProfileSummary(profile: Profile.default)
			.environmentObject(DataRepository())
	}
}
