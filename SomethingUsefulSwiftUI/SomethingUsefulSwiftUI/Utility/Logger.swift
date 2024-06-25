//
//  Logger.swift
//  SomethingUsefulSwiftUI
//
//  Created by Gordon Choi on 5/14/24.
//

import OSLog

fileprivate extension Logger {
    private static var subsystem = Bundle.main.bundleIdentifier!
    
    static let viewCycle = Logger(subsystem: subsystem, category: "ViewCycle")
    static let api = Logger(subsystem: subsystem, category: "API")
}

public enum VividLogger {
    public enum LogStatus: String {
        case notice
        case info
        case debug
        case trace
        case warning
        case error
        case fault
        case critical
        
        var colorMark: String {
            switch self {
            case .notice:
                return "ⓘ"
            case .trace, .debug:
                return "⚪️"
            case .info:
                return "🔵"
            case .warning, .error:
                return "🟡"
            case .fault, .critical:
                return "🔴"
            }
        }
    }
    
    static func viewCycleLog(fileID: String = #fileID, line: Int = #line, function: String = #function, _ status: LogStatus, _ log: Any?) {
        let str = "\(status.colorMark) View Cycle \(status.rawValue) at \(fileID), \(function), \(line)\n\(String(describing: log ?? "NO LOG CONTENTS"))"
        
        switch status {
        case .notice:
            Logger.viewCycle.notice("\(str)")
        case .info:
            Logger.viewCycle.info("\(str)")
        case .debug:
            Logger.viewCycle.debug("\(str)")
        case .trace:
            Logger.viewCycle.trace("\(str)")
        case .warning:
            Logger.viewCycle.warning("\(str)")
        case .error:
            Logger.viewCycle.error("\(str)")
        case .fault:
            Logger.viewCycle.fault("\(str)")
        case .critical:
            Logger.viewCycle.critical("\(str)")
        }
    }
    
    static func apiLog(fileID: String = #fileID, line: Int = #line, function: String = #function, _ status: LogStatus, _ log: Any?) {
        let str = "\(status.colorMark) API \(status.rawValue) at \(fileID), \(function), \(line)\n\(String(describing: log ?? "NO LOG CONTENTS"))"
        
        switch status {
        case .notice:
            Logger.api.notice("\(str)")
        case .info:
            Logger.api.info("\(str)")
        case .debug:
            Logger.api.debug("\(str)")
        case .trace:
            Logger.api.trace("\(str)")
        case .warning:
            Logger.api.warning("\(str)")
        case .error:
            Logger.api.error("\(str)")
        case .fault:
            Logger.api.fault("\(str)")
        case .critical:
            Logger.api.critical("\(str)")
        }
    }
}
