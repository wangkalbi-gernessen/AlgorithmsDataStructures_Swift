//
//  GasStation.swift
//  AlgorithmsDataStructures
//
//  Created by Kazunobu Someya on 2021-04-12.
//

import Foundation

//class Solution {
//    func canCompleteCircuit(_ gas: [Int],  _ cost: [Int]) -> Int {
//        
//        var tank = 0
//        var index = 0
//        var totalGas = 0
//        var totalCost = 0
//        
//        for i in 0..<gas.count {
//            
//            totalGas += gas[i]
//            totalCost += cost[i]
//            
//            tank += gas[i] - cost[i]
//            
//            if tank < 0 {
//                index = i + 1
//                tank = 0
//            }
//        }
//        
//        return totalGas < totalCost ? -1: index
//    }
//}

func canCompleteCircuitIntuitive(_ gas: [Int], _ cost: [Int]) -> Int {
  let numStations = gas.count
  var possibleStarts = [Int]()
  for i in 0..<numStations {
    if gas[i] >= cost[i] {
      possibleStarts.append(i)
    }
  }
  
  while !possibleStarts.isEmpty {
    var start = possibleStarts.remove(at: 0)
    var travelCount = numStations
    var fuel = 0
    while travelCount != 0 {
      let cost = cost[start]
      fuel += gas[start]
      if fuel < cost { break }
      fuel -= cost
      start = (start + 1) % numStations
      travelCount -= 1
    }
    
    if travelCount == 0 {
      return start
    }
  }
  
  return -1
}

func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
  /// [].enumerated() - array of (index, value) tuples
  let gas = gas.enumerated().map { $1 - cost[$0] }
  let numStations = gas.count
  var i = 0
  var fuelSoFar = 0
  var start = 0
  while i < gas.count * 2 - 1 {
    fuelSoFar += gas[i % numStations]
    if fuelSoFar < 0 {
      start = i + 1
      if start >= numStations {
        return -1
      }
      fuelSoFar = 0
    }
    i += 1
  }

  return start
}
