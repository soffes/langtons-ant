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
