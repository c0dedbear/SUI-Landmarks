//
//  PageControl.swift
//  LandMarks
//
//  Created by Mikhail Medvedev on 17.03.2022.
//

import SwiftUI
import UIKit

struct PageControl: UIViewRepresentable {
	var numberOfPages: Int
	@Binding var currentPage: Int

	func makeCoordinator() -> PageControlViewCoordinator {
		PageControlViewCoordinator(self)
	}
	
	func makeUIView(context: Context) -> UIPageControl {
		let control = UIPageControl()
		control.numberOfPages = self.numberOfPages
		control.addTarget(context.coordinator, action: #selector(PageControlViewCoordinator.updateCurrentPage(sender:)), for: .valueChanged)

		return control
	}

	func updateUIView(_ uiView: UIPageControl, context: Context) {
		uiView.currentPage = currentPage
	}
}
