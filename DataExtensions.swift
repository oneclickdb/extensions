//
//  Extensions+Data.swift
//  SQLiteWrapper
//
//  Created by OneClickDB on 31/12/2022.
//

import Foundation

extension Data
{
    var print : String
    {
        return String(decoding: self, as: UTF8.self)
    }
}
