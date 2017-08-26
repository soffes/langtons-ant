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

	static let boardDidChange = Notification.Name(rawValue: "Preferences.boardDidChange")
	static let speedDidChange = Notification.Name(rawValue: "Preferences.speedDidChange")
	static let themeDidChange = Notification.Name(rawValue: "Preferences.themeDidChange")

	private enum Key: String {
		case speed
		case numberOfAnts
		case darkMode
		case noiseAmount

		var notificationName: Notification.Name {
			switch self {
			case .speed:
				return Preferences.speedDidChange
			case .darkMode:
				return Preferences.themeDidChange
			default:
				return Preferences.boardDidChange
			}
		}
	}


	// MARK: - Properties

	var speed: Speed {
		get {
			return Speed(rawValue: speedInteger) ?? .normal
		}

		set {
			speedInteger = newValue.rawValue
		}
	}

	var speedInteger: Int {
		get {
			let speed = Speed(rawValue: defaults.integer(forKey: Key.speed.rawValue)) ?? .normal
			return speed.rawValue
		}

		set {
			let key = Key.speed
			let speed = Speed(rawValue: newValue) ?? .normal

			defaults.set(speed.rawValue, forKey: key.rawValue)
			defaults.synchronize()

			NotificationCenter.default.post(name: key.notificationName, object: nil)
		}
	}

	var noiseAmount: Int {
		get {
			return defaults.integer(forKey: Key.noiseAmount.rawValue)
		}

		set {
			let key = Key.noiseAmount
			let value = min(35, max(0, newValue))

			defaults.set(value, forKey: key.rawValue)
			defaults.synchronize()

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
			defaults.synchronize()

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
			defaults.synchronize()

			NotificationCenter.default.post(name: key.notificationName, object: nil)
		}
	}

	private static let defaults: UserDefaults = {
		let bundleIdentifier = Bundle(for: Preferences.self).bundleIdentifier!
		let defaults = ScreenSaverDefaults(forModuleWithName: bundleIdentifier) ?? UserDefaults.standard
		defaults.register(defaults: [
			Key.speed.rawValue: Speed.normal.rawValue,
			Key.numberOfAnts.rawValue: 4,
			Key.noiseAmount.rawValue: 10,
			Key.darkMode.rawValue: true
		])
		return defaults
	}()

	private var defaults: UserDefaults {
		return type(of: self).defaults
	}
}
