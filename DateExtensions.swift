//
//  DateExtensions.swift
//  Walkthroughs
//
//  Created by OneClickDB on 6/2/2023.
//

import Foundation

extension Date
{
    var startOfYear : Date
    {
        return ("\(Date().dateComponents.year)-01-01 00:00:00").toDateTime
    }
    
    var endOfYear : Date
    {
        return ("\(Date().dateComponents.year)-12-31 00:00:00").toDateTime
    }
    
    var hour : (number: Int, text: String)
    {
        let miltaryHour = Calendar.current.component(.hour, from: self)
        let regularHour = miltaryHour > 12 ? miltaryHour - 12 : miltaryHour
        
        return (number: miltaryHour, text: String(regularHour))
    }
    
    var minute : (number: Int, text: String)
    {
        let minute = Calendar.current.component(.minute, from: self)
        
        return (number: minute, text: minute.leadingZeroNoDP)
    }
    
    var second : (number: Int, text: String)
    {
        let second = Calendar.current.component(.second, from: self)
        
        return (number: second, text: second.leadingZeroNoDP)
    }
    
    var amPM : String
    {
        return hour.number > 12 ? "pm" : "am"
    }
    
    var hourHandAngle : Double
    {
        return (Double(dateComponents.hour) / 12 * 360) + (minuteHandAngle / 12)
    }
    
    var minuteHandAngle : Double
    {
        return Double(dateComponents.minute) / 60 * 360
    }
    
    var secondHandAngle : Double
    {
        return Double(dateComponents.second) / 60 * 360
    }
    
    var simpleDisplay : String
    {
        let date = (self.dateString + " 00:00:00").toDateTime
        
        if date < sevenDaysAgo
        {
            return shortDate
        }
        else if date == yesterday
        {
            return "Yesterday"
        }
        else if date == today
        {
            return "Today"
        }
        else
        {
            return date.dateComponents.day
        }
    }
    
    var yesterday : Date
    {
        return (Date().addingTimeInterval(-86400).dateString + " 00:00:00").toDateTime
    }
    
    var sevenDaysAgo : Date
    {
        return (Date().addingTimeInterval(-86400 * 7).dateString + " 00:00:00").toDateTime
    }
    
    var today : Date
    {
        return (Date().dateString + " 00:00:00").toDate
    }
    
    func isTomorrow(for date: Date) -> Bool
    {
        if self.dateComponents.dayOfYear - date.dateComponents.dayOfYear == 1
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    var isThisYear : Bool
    {
        return self.dateComponents.year == Date().dateComponents.year
    }
    
    var isLastYear : Bool
    {
        return self.dateComponents.year == Date().dateComponents.year - 1
    }
    
    var timeStamp : String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.string(from: self)
    }
    
    var zulu : String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return dateFormatter.string(from: self)
    }
    
    var fileTimeStamp : String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd-HH-mm"
        return dateFormatter.string(from: self)
    }
    
    var timeZoneTimeStamp : String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-ddTHH-mm-ss"
        return dateFormatter.string(from: self)
    }
    
    var dateString : String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self)
    }
    
    var timeString : String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        return dateFormatter.string(from: self)
    }
    
    var shortDateTime : String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: self)
    }
    
    func dateStyle(_ style: DateFormatter.Style) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = style
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: self)
    }
    
    func timeStyle(_ style: DateFormatter.Style) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = style
        return dateFormatter.string(from: self)
    }
    
    var dayOfWeek : String
    {
        let dayNumber = Calendar.current.component(.weekday, from: self)
        let days = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
        return days[dayNumber - 1]
    }
    
    var dayShort : String
    {
        let dayNumber = Calendar.current.component(.weekday, from: self)
        let days = ["Sun","Mon","Tues","Wed","Thurs","Fri","Sat"]
        return days[dayNumber - 1]
    }
    
    var dateComponents : (hour: Int, minute: Int, second: Int, morning: Bool, dayOfWeek: Int, dayNumber: Int, monthNumber: String, dayOfYear: Int, day: String, month: String, year: Int, hourAngle: Double, minuteAngle: Double, secondAngle: Double)
    {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: self)
        let minute = calendar.component(.minute, from: self)
        let second = calendar.component(.second, from: self)
        let day = calendar.component(.day, from: self)
        let month = calendar.component(.month, from: self)
        let year = calendar.component(.year, from: self)
        let morning : Bool = hour < 12
        let hourAngle : Double = Double(Calendar.current.component(.hour, from: self)) / 12.0 * 360.0
        let minuteAngle : Double = Double(Calendar.current.component(.minute, from: self)) / 60.0 * 360.0
        let secondAngle : Double = Double(Calendar.current.component(.second, from: self)) / 60.0 * 360.0
        
        let dayNumber = calendar.component(.weekday, from: self)
        let days = ["Sunday","Monday","Tuesday","Wednesday","Thusday","Friday","Saturday"]
        let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
        
        let dayInYear = calendar.ordinality(of: .day, in: .year, for: self)!

        return (hour: hour, minute: minute, second: second, morning: morning, dayOfWeek: dayNumber, dayNumber: day, monthNumber: "\(month)", dayOfYear: dayInYear, day: days[dayNumber - 1], month: months[month - 1], year: year, hourAngle: hourAngle, minuteAngle: minuteAngle, secondAngle: secondAngle)
    }
    
    var shortDate : String
    {
        return "\(dateComponents.month.prefix(3)) \(dateComponents.dayNumber)"
    }
    
    var dateTitle : String
    {
        return dayOfWeek + ", \(dateComponents.dayNumber) " + dateComponents.month
    }
    
    var timeTitle : String
    {
        return "\(dateComponents.hour):" + dateComponents.minute.leadingZeroNoDP
    }
    
    var timeNatural : String
    {
        if dateComponents.hour > 12
        {
            return "\(dateComponents.hour - 12):" + dateComponents.minute.leadingZeroNoDP
        }
        else
        {
            return "\(dateComponents.hour):" + dateComponents.minute.leadingZeroNoDP
        }
    }
    
    var shortTime : String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: self)
    }
    
    var mondayThisWeek : Date
    {
        let timeToMonday = 2 - self.dateComponents.dayOfWeek
        let timeShift = timeToMonday * 86400
        return self.addingTimeInterval(Double(timeShift))
    }
    
    var fridayThisWeek : Date
    {
        let date = (self.dateString + " 23:59:59").toDateTime
        let timeToFriday = 6 - date.dateComponents.dayOfWeek
        let timeShift = timeToFriday * 86400
        return self.addingTimeInterval(Double(timeShift))
    }
}
