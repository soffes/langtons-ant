//
//  Preferences.swift
//  Langton’s Ant
//
//  Created by Sam Soffes on 8/25/17.
//  Copyright © 2017 Sam Soffes. All rights reserved.
//

import Foundation
import ScreenSaver

final class Preferences: NSObject {

	// MARK: - Types

	private enum Key: String {
		case speed
		case numberOfAnts
		case darkMode

		var notificationName: Notification.Name {
			return Notification.Name(rawValue: "Preferences.\(rawValue)DidChange")
		}
	}


	// MARK: - Properties

	var speed: Speed {
		get {
			return Speed(rawValue: defaults.integer(forKey: Key.speed.rawValue)) ?? .normal
		}

		set {
			let key = Key.speed
			defaults.set(newValue.rawValue, forKey: key.rawValue)
			NotificationCenter.default.post(name: key.notificationName, object: nil)
		}
	}

	var numberOfAnts: Int {
		get {
			return defaults.integer(forKey: Key.numberOfAnts.rawValue)
		}

		set {
			let key = Key.numberOfAnts
			defaults.set(min(9, max(1, newValue)), forKey: key.rawValue)
			NotificationCenter.default.post(name: key.notificationName, object: nil)
		}
	}

	var darkMode: Bool {
		get {
			return defaults.bool(forKey: Key.darkMode.rawValue)
		}

		set {
			let key = Key.darkMode
			defaults.set(newValue, forKey: key.rawValue)
			NotificationCenter.default.post(name: key.notificationName, object: nil)
		}
	}

	private let defaults: UserDefaults = {
		let bundleIdentifier = Bundle(for: Preferences.self).bundleIdentifier!
		let defaults = ScreenSaverDefaults(forModuleWithName: bundleIdentifier) ?? UserDefaults.standard
		defaults.register(defaults: [
			Key.speed.rawValue: Speed.normal.rawValue,
			Key.numberOfAnts.rawValue: 4
		])
		return defaults
	}()
}
