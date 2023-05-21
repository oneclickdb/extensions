//
//  URLExtensions.swift
//  Walkthroughs
//
//  Created by OneClickDB on 9/2/2023.
//

import Foundation

extension URLResponse
{
    var http: HTTPURLResponse?
    {
        return self as? HTTPURLResponse
    }
    
    var isSuccessful: Bool
    {
        guard let response = self as? HTTPURLResponse else { return false }
        
        if !(200 ... 299).contains(response.statusCode) { print("Invalid http response: \(response.statusCode)") }
        
        return (200 ... 299).contains(response.statusCode)
    }
    
    var code: String
    {
        guard let response = self as? HTTPURLResponse else { return "No response from the server given" }
        
        return String(response.statusCode)
    }
}
