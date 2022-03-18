//
//  PageViewController.swift
//  LandMarks
//
//  Created by Mikhail Medvedev on 16.03.2022.
//

import SwiftUI
import UIKit

protocol IPageViewController: UIViewControllerRepresentable {
	associatedtype Page : View
	var pages: [Page] { get set }
	var currentPage: Int { get set }
}
struct PageViewController<Page: View>: IPageViewController {
	var pages: [Page]
	
	@Binding var currentPage: Int

	func makeUIViewController(context: Context) -> UIPageViewController {
		let pageViewController = UIPageViewController(transitionStyle: .scroll,
													  navigationOrientation: .horizontal)
		pageViewController.dataSource = context.coordinator
		
		return pageViewController
	}

	func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
		pageViewController.setViewControllers([context.coordinator.viewControllers[self.currentPage]], direction: .forward, animated: true)
	}
	
	func makeCoordinator() ->  PageViewControllerCoordinator<Self> {
		Coordinator(self)
	}
}
