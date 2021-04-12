//
//  GasStation.swift
//  AlgorithmsDataStructures
//
//  Created by Kazunobu Someya on 2021-04-12.
//

import Foundation

class Solution {
    func canCompleteCircuit(_ gas: [Int],  _ cost: [Int]) -> Int {
        
        var tank = 0
        var index = 0
        var totalGas = 0
        var totalCost = 0
        
        for i in 0..<gas.count {
            
            totalGas += gas[i]
            totalCost += cost[i]
            
            tank += gas[i] - cost[i]
            
            if tank < 0 {
                index = i + 1
                tank = 0
            }
        }
        
        return totalGas < totalCost ? -1: index
    }
}
