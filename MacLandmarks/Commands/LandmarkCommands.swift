//
//  LandmarkCommands.swift
//  LandMarks
//
//  Created by Mikhail Medvedev on 23.03.2022.
//

import SwiftUI

struct LandmarkCommands: Commands {
	@FocusedBinding(\.selectedLandmark) var selectedLandmark
	
	var body: some Commands {
		SidebarCommands()
		CommandMenu("Landmark") {
			Button("\(self.selectedLandmark?.isFavorite == true ? "Remove" : "Mark") as Favorite") {
				self.selectedLandmark?.isFavorite.toggle()
			}
			.keyboardShortcut("f", modifiers: [.shift, .option])
			.disabled(self.selectedLandmark == nil)
		}
	}
}

private struct SelectedLandmarkKey: FocusedValueKey {
	typealias Value = Binding<Landmark>
}

extension FocusedValues {
	var selectedLandmark: Binding<Landmark>? {
		get { self[SelectedLandmarkKey.self] }
		set { self[SelectedLandmarkKey.self] = newValue }
	}
}
