//
//  IntExtensions.swift
//  Walkthroughs
//
//  Created by OneClickDB on 6/2/2023.
//

import Foundation

extension Int
{
    var toBool : Bool
    {
        return self == 1
    }
    
    var plural: String
    {
        if self == 0 || self > 1 { return "s" } else { return "" }
    }
    var noDP : String
    {
        return String(format: "%.0f", self)
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
        return String(format: "%02d", self)
    }
    
    var yearLevel : Int
    {
        return Date().dateComponents.year - self + 12
    }
    
    var graduate : Int
    {
        return 12 - self + Date().dateComponents.year
    }
    
    var display : String
    {
        return "Year \(Date().dateComponents.year - self + 12)"
    }
    
    var ordinal : String
    {
        let lastNumber = String(self).suffix(1)
        
        switch true
        {
        case lastNumber == "1" : return "\(self)st"
        case lastNumber == "2" : return "\(self)nd"
        case lastNumber == "3" : return "\(self)rd"
        default: return "\(self)th)"
        }
    }
}

extension [Int]
{
    var isConsecutive : Bool
    {
        let values = self.sorted(by: {$0 < $1})
        
        if values.isEmpty
        {
            return false
        }
        else
        {
            var currentNumber = values.first!
            
            for number in values.dropFirst()
            {
                if number - currentNumber != 1
                {
                    return false
                }
                
                currentNumber = number
            }
            
            return true
        }
    }
}
