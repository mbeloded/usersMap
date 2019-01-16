//
//  DateFormatter+Extensions.swift
//  mapsGeoProject
//
//  Created by Michael Bielodied on 1/15/19.
//  Copyright © 2019 Michael Bielodied. All rights reserved.
//

import Foundation

let defaultDateFormat = "dd.MM.yy"

extension DateFormatter {
    //
    static let iso8601Full: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
    
    static let iso8601Second: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
    
    static let iso8601Third: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SS'Z'"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
    
    static let iso8601Fourth: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
    
    static func date(string: String?) -> Date? {
        guard let _string = string else {
            return nil
        }
        return self.date(string: _string)
    }
    
    static func date(from string: String, with format: String = defaultDateFormat) -> String? {
        if let iso8601Date = iso8601Full.date(from: string) {
            return iso8601Date.asString(withFormat: format)
        } else if let shortDate = iso8601Second.date(from: string) {
            return shortDate.asString(withFormat: format)
        } else if let shortDate = iso8601Third.date(from: string) {
            return shortDate.asString(withFormat: format)
        } else if let shortDate = iso8601Fourth.date(from: string) {
            return shortDate.asString(withFormat: format)
        } else {
            return nil
        }
    }
    
}

extension Date {
    public func asString(withFormat: String) -> String? {
        
        let dcDateFormatter: DateFormatter = DateFormatter.init()
        dcDateFormatter.dateFormat = withFormat// for ex.: "dd.MM.yy"
        return dcDateFormatter.string(from: self)
    }
}
