//
//  HomeController.swift
//  CombineStarter
//
//  Created by Aung Ko Ko on 26/09/2023.
//

import UIKit
import UIComponent
import Utilities

class HomeController: BaseViewController {
    
    var combineOperator: CombinePractice
    var dijakstraUseCase: DijkstraAlgorithmUseCase
    var dijkstraAlgorithmGraph: DijkstraAlgorithmGraph
    
    
    init(combineOperator: CombinePractice) {
        self.combineOperator = combineOperator
        self.dijkstraAlgorithmGraph = DijkstraAlgorithmGraph()
        self.dijakstraUseCase = DijkstraAlgorithmUseCase()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupUI() {
        super.setupUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        computeTheShortestPath()
    }
    
    func computeTheShortestPath() {
        
        dijkstraAlgorithmGraph.addEdge(from: "Gary", to: "Indianapolis", weight: 5)
        dijkstraAlgorithmGraph.addEdge(from: "Gary", to: "Ft.Wayne", weight: 4)
        dijkstraAlgorithmGraph.addEdge(from: "Gary", to: "Detroit", weight: 6)
        dijkstraAlgorithmGraph.addEdge(from: "Gary", to: "Toledo", weight: 4.5)
        
        dijkstraAlgorithmGraph.addEdge(from: "Ft.Wayne", to: "Columbus", weight: 4)
        dijkstraAlgorithmGraph.addEdge(from: "Ft.Wayne", to: "Toledo", weight: 2.5)
        
        dijkstraAlgorithmGraph.addEdge(from: "Indianapolis", to: "Ft.Wayne", weight: 4)
        dijkstraAlgorithmGraph.addEdge(from: "Indianapolis", to: "Columbus", weight: 4)
        dijkstraAlgorithmGraph.addEdge(from: "Indianapolis", to: "Cincinnati", weight: 3)
        
        dijkstraAlgorithmGraph.addEdge(from: "Cincinnati", to: "Columbus", weight: 4)
        
        dijkstraAlgorithmGraph.addEdge(from: "Detroit", to: "Toledo", weight: 2)
        
        dijkstraAlgorithmGraph.addEdge(from: "Toledo", to: "Columbus", weight: 3)
        dijkstraAlgorithmGraph.addEdge(from: "Toledo", to: "Cleveland", weight: 3)
        
        dijkstraAlgorithmGraph.addEdge(from: "Cleveland", to: "Pittsburgh", weight: 3)
        
        dijkstraAlgorithmGraph.addEdge(from: "Columbus", to: "Cleveland", weight: 4)
        dijkstraAlgorithmGraph.addEdge(from: "Columbus", to: "Pittsburgh", weight: 3.5)
        
        let startNode = "Gary"
        let shortestPaths = dijakstraUseCase.dijkstra(graph: dijkstraAlgorithmGraph, startNode: startNode)
        
        for (node, (distance, path)) in shortestPaths {
            print("Shortest path from \(startNode) to \(node): Distance = \(distance), Path = \(path.joined(separator: " -> "))")
        }
    }
    
}
