import AppKit

final class PreviewWindowController: NSWindowController {

	// MARK: - Properties

	private let screenSaverView = LangtonsAntView()
    private var timer: Timer? {
        willSet {
            timer?.invalidate()
        }
    }

	// MARK: - NSWindowController

	override func windowDidLoad() {
		super.windowDidLoad()

		window?.contentView = screenSaverView

        NotificationCenter.default.addObserver(self, selector: #selector(updateTimer),
                                               name: Preferences.speedDidChange, object: nil)

        updateTimer()
	}

	// MARK: - Actions

	@IBAction func showPreferences(_ sender: NSObject?) {
        guard let sheet = screenSaverView.configureSheet, let window else {
            return
        }

		window.beginSheet(sheet) { _ in
			sheet.close()
		}
	}

    // MARK: - Private

    @objc
    private func updateTimer() {
        timer = Timer.scheduledTimer(timeInterval: screenSaverView.animationTimeInterval, target: screenSaverView,
                                     selector: #selector(LangtonsAntView.animateOneFrame), userInfo: nil, repeats: true)
    }
}
