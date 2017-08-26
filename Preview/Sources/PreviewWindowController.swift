//
//  PreviewWindowController.swift
//  Langton’s Ant
//
//  Created by Sam Soffes on 8/25/17.
//  Copyright © 2017 Sam Soffes. All rights reserved.
//

import AppKit

final class PreviewWindowController: NSWindowController {

	// MARK: - Properties

	private let screenSaverView = LangtonsAntView()


	// MARK: - NSWindowController

	override func windowDidLoad() {
		super.windowDidLoad()

		window?.contentView = screenSaverView

		Timer.scheduledTimer(timeInterval: screenSaverView.animationTimeInterval, target: screenSaverView, selector: #selector(LangtonsAntView.animateOneFrame), userInfo: nil, repeats: true)
	}


	// MARK: - Actions

	@IBAction func showPreferences(_ sender: NSObject?) {
		guard let sheet = screenSaverView.configureSheet(), let window = window else { return }
		
		window.beginSheet(sheet) { _ in
			sheet.close()
		}
	}
}
