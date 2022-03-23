//
//  MapView.swift
//  LandMarks
//
//  Created by Михаил Медведев on 22.12.2021.
//

import MapKit
import SwiftUI

struct MapView: View {
	var coordinate: CLLocationCoordinate2D
	
	@AppStorage("MapView.zoom")
	private var zoom: Zoom = .medium

	var body: some View {
		Map(coordinateRegion: .constant(self.region))
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
		MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}

extension MapView {
	enum Zoom: String, CaseIterable, Identifiable {
		case near = "Near"
		case medium = "Medium"
		case far = "Far"
		
		var id: Zoom {
			return self
		}
	}
	
	private var delta: CLLocationDegrees {
		switch self.zoom {
		case .near: return 0.02
		case .medium: return 0.2
		case .far: return 2
		}
	}
	
	private var region: MKCoordinateRegion {
		MKCoordinateRegion(
			center: self.coordinate,
			span: MKCoordinateSpan(latitudeDelta: self.delta, longitudeDelta: self.delta)
		)
	}
}
