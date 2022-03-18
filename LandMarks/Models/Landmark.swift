//
//  Landmark.swift
//  LandMarks
//
//  Created by Михаил Медведев on 24.12.2021.
//

import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable
{
	struct Coordinates: Hashable, Codable
	{
		var latitude: Double
		var longitude: Double
	}

	var id: Int
	var name: String
	var park: String
	var state: String
	var description: String
	var isFavorite: Bool
	var isFeatured: Bool
	var category: Category

	private var imageName: String
	private var coordinates: Coordinates
}

extension Landmark
{
	var locationCoordinate: CLLocationCoordinate2D {
		.init(latitude: self.coordinates.latitude, longitude: self.coordinates.longitude)
	}
	
	var image: Image {
		Image(self.imageName)
	}
	
	var featureImage: Image? {
		self.isFeatured ? Image(self.imageName + "_feature") : nil
	}
}
