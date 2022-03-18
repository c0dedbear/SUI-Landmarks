//
//  PageViewControllerCoordinator.swift
//  LandMarks
//
//  Created by Mikhail Medvedev on 17.03.2022.
//

import UIKit
import SwiftUI

final class PageViewControllerCoordinator<Controller: IPageViewController>: NSObject,
																		   UIPageViewControllerDataSource,
																		   UIPageViewControllerDelegate {
	var parent: Controller
	var viewControllers = [UIViewController]()
	
	init(_ pageViewController: Controller) {
		self.parent = pageViewController
		self.viewControllers = pageViewController.pages.map { UIHostingController(rootView: $0) }
	}
	
	// MARK: - UIPageViewControllerDataSource
	func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
		guard let index = self.viewControllers.firstIndex(of: viewController) else { return nil }
		return index == 0 ?
		self.viewControllers.last : self.viewControllers[index - 1]
	}
	
	func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
		guard let index = self.viewControllers.firstIndex(of: viewController) else { return nil }
		return index + 1 == self.viewControllers.count ?
		self.viewControllers.first : self.viewControllers[index + 1]
	}
	
	// MARK: - UIPageViewControllerDelegate
	func pageViewController(_ pageViewController: UIPageViewController,
							didFinishAnimating finished: Bool,
							previousViewControllers: [UIViewController],
							transitionCompleted completed: Bool) {
		if completed,
		   let visibleViewController = pageViewController.viewControllers?.first,
		   let index = self.viewControllers.firstIndex(of: visibleViewController) {
			self.parent.currentPage = index
		}
	}
}
