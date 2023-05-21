//
//  ArrayExtensions.swift
//  SQLiteWrapper
//
//  Created by OneClickDB on 31/12/2022.
//

import Foundation

extension Array where Element: Hashable
{
    func removingDuplicates() -> [Element]
    {
        var addedDict = [Element: Bool]()

        return filter
        {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }

    mutating func removeDuplicates()
    {
        self = self.removingDuplicates()
    }
    
    var searchString : String
    {
        var returnString = ""
        
        for item in self
        {
            returnString += "'"
            returnString += item as! String
            returnString += "', "
        }
        
        if self.isEmpty
        {
            return ""
        }
        else
        {
            return String(returnString.prefix(returnString.count - 2))
        }
    }
    
    var singleString : String
    {
        var returnString = ""
        
        for item in self
        {
            returnString += item as! String
            returnString += ", "
        }
        
        if self.isEmpty
        {
            return ""
        }
        else
        {
            return String(returnString.prefix(returnString.count - 2))
        }
    }
    
    var searchInteger : String
    {
        return singleInteger
    }
    
    var singleInteger : String
    {
        var returnString = ""
        
        for item in self
        {
            returnString += String(item as! Int)
            returnString += ", "
        }
        
        if self.isEmpty
        {
            return ""
        }
        else
        {
            return String(returnString.prefix(returnString.count - 2))
        }
    }
}

extension Array where Element == String
{
    var singleString : String
    {
        var values = ""
        
        for index in self.indices
        {
            if index == 0
            {
                values += self[index]
            }
            else if index == self.count
            {
                values += " and " + self[index]
            }
            else
            {
                values += ", " + self[index]
            }
        }
        
        return values.prefix(1).capitalized + values.dropFirst()
    }
}

extension Array
{
    func unique<T:Hashable>(by: ((Element) -> (T)))  -> [Element] {
        var set = Set<T>() //the unique list kept in a Set for fast retrieval
        var arrayOrdered = [Element]() //keeping the unique list of elements but ordered
        for value in self {
            if !set.contains(by(value)) {
                set.insert(by(value))
                arrayOrdered.append(value)
            }
        }

        return arrayOrdered
    }
}
