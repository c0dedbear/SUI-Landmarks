//
//  DataRepository.swift
//  LandMarks
//
//  Created by Михаил Медведев on 24.12.2021.
//

import Foundation
import Combine

final class DataRepository: ObservableObject
{
	@Published var profile = Profile.default
	@Published var landmarks = [Landmark]()
	var hikes = [Hike]()

	private func load<T: Decodable>(filename: String) -> [T] {
		guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else { fatalError("File \(filename) doesn't exists")}
		let decoder = JSONDecoder()

		if let data = try? Data(contentsOf: file),
		   let items = try? decoder.decode([T].self, from: data)  {
			return items
		}

		fatalError("Reading or parsing error")
	}

	init() {
		self.landmarks = self.load(filename: "landmarkData.json")
		self.hikes = self.load(filename: "hikeData.json")
	}
}

extension DataRepository
{
	var features: [Landmark] {
		landmarks.filter { $0.isFeatured }
	}

	var categories: [String: [Landmark]] {
		Dictionary(grouping: self.landmarks, by: { $0.category.rawValue })
	}
}
