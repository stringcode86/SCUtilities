//
//  NSDate+Extensions.swift
//  SCUtilities
//
//  Created by Michal Inger on 18/11/2015.
//  Copyright © 2015 stringCode ltd. All rights reserved.
//

import Foundation

/// Date extension
public extension NSDate {
    
    /**
     Determins whether difference beween a date is less given time interval
     
     - Note: return false if `date` in `nil`
     
     - Parameter date: A date to comapere to

     - Parameter lessThen: time differnce to compare by
     
     - Returns: `true` if date time interval differnce is less then time interval
     */
    public func isTimeDeltaBetween(date: NSDate?, lessThen timeInteval: NSTimeInterval) -> Bool {
        guard let date = date else { return false }
        return fabs(timeIntervalSince1970 - date.timeIntervalSince1970) < timeInteval
    }
    
    public convenience init?(timeIntervalSince1970 timeInterval: NSTimeInterval?) {
        if let timeInterval = timeInterval {
            self.init(timeIntervalSince1970: timeInterval)
        } else {
            return nil
        }
    }
    
    /// Time interval with number if seconds in a day. 24 * 60 * 60
    public class var secondsInDay: NSTimeInterval { get { return 86400 } }
    
    /// Time interval with number if seconds in a month. 30 * 24 * 60 * 60
    public class var secondsInMonth: NSTimeInterval { get { return NSDate.secondsInDay * 30 } }
    
    /// Returns current year
    public class var currentYear: Int {
        get { return NSDate.yearComponentFromDate(NSDate()) }
    }
    
    /// Returns year component using `NSCalendar.currentCalendar()`
    public var yearComponent: Int {
        get { return NSDate.yearComponentFromDate(self) }
    }
    
    /// Returns year component from date using `NSCalendar.currentCalendar()`
    private class func yearComponentFromDate(date: NSDate) -> Int {
        return NSCalendar.currentCalendar().component(.Year, fromDate: date)
    }
}