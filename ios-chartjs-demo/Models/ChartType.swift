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
    
    /// ファイル名
    func fileName() -> String {
        
        switch self {
        case .bar:
            return "barchart"
        case .line:
            return "linechart"
        }
    }
    
    /// JSのメソッドを呼ぶ
    func query(xaxis: [String], data: [[Int]], precedent: [String]) -> String {
     
        switch self {
        case .bar:
            return "drawBarChart(\(xaxis),\(data));"
        case .line:
            return "drawLineChart(\(xaxis),\(data),\(precedent));"
        }
    }
    
    /// X軸のタイトル
    func xaxis() -> [String] {
        return ["1月","2月","3月","4月","5月","6月"]
    }
    
    /// データ
    func data() -> [[Int]] {
        return [
            [165, 159, 180, 181, 156, 155],
            [65, 59, 80, 81, 56, 55]
        ]
    }
    
    /// 判例
    func precedent() -> [String] {
        return ["血圧(上）","血圧(下）"]
    }
}
