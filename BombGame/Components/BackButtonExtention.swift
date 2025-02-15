//
//  BackButtonExtention.swift
//  BombGame
//
//  Created by Julia Martcenko on 13/02/2025.
//

import SwiftUI

extension UINavigationController {

	open override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		navigationBar.topItem?.backButtonDisplayMode = .minimal
	}

}
