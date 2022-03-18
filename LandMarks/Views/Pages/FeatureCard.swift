//
//  FeatureCard.swift
//  LandMarks
//
//  Created by Mikhail Medvedev on 16.03.2022.
//

import SwiftUI

struct FeatureCard: View {
	var landmark: Landmark

	var body: some View {
		self.landmark.featureImage?
			.resizable()
			.aspectRatio(3 / 2, contentMode: .fit)
			.overlay {
				TextOverlay(landmark: self.landmark)
			}
	}
}

struct FeatureCard_Previews: PreviewProvider {
	static var previews: some View {
		FeatureCard(landmark: DataRepository().features[0])
	}
}

struct TextOverlay: View {
	var landmark: Landmark

	var gradient: LinearGradient {
		.linearGradient(
			Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
			startPoint: .bottom,
			endPoint: .center)
	}

	var body: some View {
		ZStack(alignment: .bottomLeading) {
			gradient
			VStack(alignment: .leading) {
				Text(landmark.name)
					.font(.title)
					.bold()
				Text(landmark.park)
			}
			.padding()
		}
		.foregroundColor(.white)
	}
}
