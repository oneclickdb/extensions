//
//  Extensions.swift
//  SQLiteWrapper
//
//  Created by OneClickDB on 31/12/2022.
//

import Foundation

extension String
{
    //Draw out the table name in a query where the String is in the format CREATE TABLE IF NOT EXISTS tableName(...
    var tableName : String
    {
        if self.count > 27
        {
            let endOfQuery = self.suffix(self.count - 27)
            
            if let endIndex = endOfQuery.map({$0}).firstIndex(of: "(")
            {
                return String(endOfQuery.prefix(endIndex))
            }
            else
            {
                print("No bracket in the query")
            }
        }
        else
        {
            print("Check SQL \(self) before searching for a table name")
        }
        
        return ""
    }
    
    //Split CSV file into an array of rows as single String
    var rows : [String]
    {
        return self.components(separatedBy: "\n")
    }
    
    //Split the singe String row into individual strings
    var columns : [String]
    {
        return self.dropFirst().dropLast().components(separatedBy: "\",\"")
    }
    
    var initials : String
    {
        let components = self.components(separatedBy: " ")
        
        var firstInitial = ""
        var secondInitial = ""
        
        if components.count >= 1
        {
            firstInitial = String(components[0].prefix(1))
        }
           
        if components.count >= 2
        {
            secondInitial = String(components[1].prefix(1))
        }
        
        return "\(firstInitial)\(secondInitial)"
    }
    
    var toTime : Date
    {
        let format = "HH:mm:ss"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        guard let date = dateFormatter.date(from: self) else { return Date() } //print("Wrong format for toTime");
        return date
    }
    
    var toDateTime : Date
    {
        let format = "yyyy-MM-dd HH:mm:ss"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        guard let date = dateFormatter.date(from: self) else { return Date() } // print("Wrong format for toDateTime \(self)");
        return date
    }
    
    var toWeatherDateTime : Date
    {
        let format = "yyyy-MM-dd'T'HH:mm:ssZ"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        guard let date = dateFormatter.date(from: self) else { return Date() } // print("Wrong format for toWeatherDateTime");
        return date
    }
    
    var numericDateTime : Date
    {
        let format = "yyyyMMddHHmmss"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        guard let date = dateFormatter.date(from: self) else { return Date() } // print("Wrong format for toWeatherDateTime");
        return date
    }
    
    var fileToDateTime : Date
    {
        let format = "yyyy-MM-dd-HHmmss"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        guard let date = dateFormatter.date(from: self) else { return Date() } // print("Wrong format for fileToDateTime");
        return date
    }
    
    var toDate : Date
    {
        let format = "yyyy-MM-dd"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        guard let date = dateFormatter.date(from: self) else { return Date() } //print("Wrong format for toDate");
        return date
    }
    
    var sentenceCase : String
    {
        return prefix(1).capitalized + dropFirst()
    }
    
    func plural(_ count : Int) -> String
    {
        if count != 1 { return self + "s" } else { return self }
    }
}
