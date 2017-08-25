//
//  PreviewWindowController.swift
//  Motivation
//
//  Created by Sam Soffes on 8/6/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

import AppKit

class PreviewWindowController: NSWindowController {

	// MARK: - Properties

	private let screenSaverView = LangtonsAntView()


	// MARK: - NSWindowController

	override func windowDidLoad() {
		super.windowDidLoad()

		window?.contentView = screenSaverView

		Timer.scheduledTimer(timeInterval: screenSaverView.animationTimeInterval, target: screenSaverView, selector: #selector(LangtonsAntView.animateOneFrame), userInfo: nil, repeats: true)
	}
}
