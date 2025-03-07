//
//  FileExtensions.swift
//  SQLiteWrapper
//
//  Created by Paul Dionysius on 7/3/2025.
//

import Foundation

func saveJsonToFile(_ value: Encodable, fileName: String)
{
    do
    {
        let documentsURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            
        try JSONEncoder().encode(value).write(to: documentsURL.appendingPathComponent(fileName))
    }
    catch
    {
        print(error)
    }
}

func loadJsonFromFile(_ type: Decodable.Type, fileName: String) -> Any?
{
    do
    {
        let documentsUrl = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        
        let directoryContents = try FileManager.default.contentsOfDirectory(at: documentsUrl, includingPropertiesForKeys: nil)
        
        let urlOfLocalFile = directoryContents.filter{ $0.lastPathComponent == fileName }
        
        if urlOfLocalFile.count > 0
        {
            let data = try Data(contentsOf: urlOfLocalFile[0], options: .mappedIfSafe)
            
            return try JSONDecoder().decode(type, from: data)
        }
    }
    catch
    {
        print(error)
    }
    
    return nil
}
