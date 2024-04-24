//
//  Stopwatch.swift
//  SimpleReader-12-15-SD
//
//  Created by Andrei Shpartou on 24/04/2024.
//

import Foundation

class Stopwatch {
    private var timer: Timer?
    private var seconds: Int = 0 {
        didSet {
            NotificationCenter.default.post(
                name: .secondsChanged,
                object: nil,
                userInfo: ["seconds": seconds]
            )
        }
    }

    func start() {
        self.timer = Timer.scheduledTimer(
            withTimeInterval: 1.0,
            repeats: true,
            block: { _ in
                self.seconds += 1
            }
        )
    }

    func pause() {
        invalidateStopWatch()
    }

    func stop() {
        seconds = 0
        invalidateStopWatch()
    }

    private func invalidateStopWatch() {
        timer?.invalidate()
        timer = nil
    }
}

extension Notification.Name {
    static let secondsChanged = Notification.Name("SecondsChanged")
}
