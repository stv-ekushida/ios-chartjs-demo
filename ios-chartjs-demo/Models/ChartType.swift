//
//  ChartType.swift
//  ios-chartjs-demo
//
//  Created by Kushida　Eiji on 2017/02/25.
//  Copyright © 2017年 Kushida　Eiji. All rights reserved.
//

import UIKit

enum ChartType {
    case bar
    case line
    
    func fileName() -> String {
        
        switch self {
        case .bar:
            return "barchart"
        case .line:
            return "linechart"
        }
    }
    
    func query(labels: [String], data: [Int]) -> String {
     
        switch self {
        case .bar:
            return "drawBarChart(\(labels),\(data));"
        case .line:
            return "drawLineChart(\(labels),\(data));"
        }
    }
}
