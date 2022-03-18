//
//  PageControlViewCoordinator.swift
//  LandMarks
//
//  Created by Mikhail Medvedev on 17.03.2022.
//

import UIKit
import SwiftUI

final class PageControlViewCoordinator: NSObject {
	var controlView: PageControl
	
	init(_ pageControlView: PageControl) {
		self.controlView = pageControlView
	}
	
	@objc
	func updateCurrentPage(sender: UIPageControl) {
		self.controlView.currentPage = sender.currentPage
	}
}
