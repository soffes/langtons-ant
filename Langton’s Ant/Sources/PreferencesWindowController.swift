//
//  PreferencesWindowController.swift
//  Langton’s Ant
//
//  Created by Sam Soffes on 8/25/17.
//  Copyright © 2017 Sam Soffes. All rights reserved.
//

import AppKit

final class PreferencesWindowController: NSWindowController {
	override var windowNibName: String? {
		return "Preferences"
	}

	@IBAction func close(_ sender: Any?) {
		guard let window = window else { return }
		window.sheetParent?.endSheet(window)
	}
}
