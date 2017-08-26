# Langton’s Ant

Swift macOS screen saver implementation of [Langton’s Ant](https://en.wikipedia.org/wiki/Langton%27s_ant).

> Langton’s Ant is a two-dimensional universal Turing machine with a very simple set of rules but complex emergent behavior. It was invented by Chris Langton in 1986.

It’s fascinating because it only uses the following two rules to generate everything you see:

* At an unfilled square, turn 90° right, flip the color of the square, move forward one unit
* At a filled square, turn 90° left, flip the color of the square, move forward one unit

![Preview](Preview.gif)


## Installation

**[Download the latest release](https://github.com/soffes/langtons-ant/releases).** Unzip and double-click.


## Preferences

Don’t forget to check out “Screen Saver Options…” in System Preferences. You can change the model and style to your liking.


## Building

Xcode 8.3 is required since Langton’s Ant is written in Swift 3.
