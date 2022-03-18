//
//  ProfileHost.swift
//  LandMarks
//
//  Created by Михаил Медведев on 21.02.2022.
//

import SwiftUI

struct ProfileHost: View {
	@Environment(\.editMode) var editMode
	@EnvironmentObject var dataStorage: DataRepository
	@State private var draftProfile = Profile.default

	var body: some View {
		VStack(alignment: .leading, spacing: 20) {
			HStack {
				if editMode?.wrappedValue == .active {
					Button("Cancel", role: .cancel) {
						self.draftProfile = self.dataStorage.profile
						self.editMode?.animation().wrappedValue = .inactive
					}
				}
				Spacer()
				EditButton()
			}

			if editMode?.wrappedValue == .inactive {
				ProfileSummary(profile: self.dataStorage.profile)
			} else {
				ProfileEditor(profile: $draftProfile)
					.onAppear {
						self.draftProfile = self.dataStorage.profile
					}
					.onDisappear {
						self.dataStorage.profile = self.draftProfile
					}
			}
			
		}
		.padding()
	}
}

struct ProfileHost_Previews: PreviewProvider {
	static var previews: some View {
		ProfileHost()
			.environmentObject(DataRepository())
	}
}
