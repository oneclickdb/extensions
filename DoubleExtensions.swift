//
//  DoubleExtensions.swift
//  Walkthroughs
//
//  Created by OneClickDB on 6/2/2023.
//

import Foundation

extension Double
{
    var minutes: String
    {
        return self == 1 ? "1 minute" : "\(Int(self)) minutes"
    }
    
    var timerTimeConversion : String
    {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = self > 3600 ? [.hour, .minute, .second] : [.minute, .second]
        formatter.unitsStyle = .positional
        let formattedString = formatter.string(from: TimeInterval(self))!
        return formattedString
    }
    
    var timeConversion : String
    {
        let formatter = DateComponentsFormatter()
        
        if self > 2592000
        {
            formatter.allowedUnits = [.month, .day]
        }
        else if self > 86400
        {
            formatter.allowedUnits = [.day, .hour]
        }
        else
        {
            formatter.allowedUnits = [.hour, .minute, .second]
        }
        
        formatter.unitsStyle = .abbreviated
        let formattedString = formatter.string(from: TimeInterval(self))!
        
        return formattedString
    }
    
    var weekConversion : String
    {
        if self > 604800
        {
            let weeks = Int(self / 604800)
            
            return "\(weeks) week\(weeks.plural)"
        }
        else
        {
            return self.dayConversion
        }
    }
    
    var dayConversion : String
    {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.day]
        formatter.unitsStyle = .full
        
        return formatter.string(from: TimeInterval(self))!
    }
    
    func convertToTime(withFormat units: NSCalendar.Unit, style: DateComponentsFormatter.UnitsStyle) -> String
    {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = units
        formatter.unitsStyle = style
        
        return formatter.string(from: TimeInterval(self))!
    }
    
    var percentage : String
    {
        return (self * 100).noDP + "%"
    }
    
    var noDP : String
    {
        return String(format: "%.0f", self)
    }
    
    var oneDP : String
    {
        return String(format: "%.1f", self)
    }
    
    var twoDP : String
    {
        return String(format: "%.2f", self)
    }
    
    var leadingZeroTwoDP : String
    {
        return String(format: "%05.2f", self)
    }
    
    var leadingZeroNoDP : String
    {
        return String(format: "%02.0f", self)
    }
    
    var plural: String
    {
        if self == 0 || self > 1 { return "s" } else { return "" }
    }
}
