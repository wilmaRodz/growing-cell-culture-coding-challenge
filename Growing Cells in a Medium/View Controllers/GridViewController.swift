//
//  GridViewController.swift
//  Growing Cells in a Medium
//
//  Created by macbook on 2/7/21.
//

import UIKit

class GridViewController: UIViewController {
    
    // MARK: - Properties
    
    var rows: [String]?
    var cellSize: CGFloat?
    
    // MARK: - Outlates
    
    @IBOutlet weak var gridView: GridView!
    
    // MARK: - DidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        setUpGrid()
    }
    
    // MARK: - Methods
    
    // Extracting grid data
    private func fetchData() {
        
        // Get file path to txt file
        if let filePath = Bundle.main.path(forResource: "cell-cultures", ofType: "txt") {
            
            // Try extracting data
            if let dataString = try? String(contentsOfFile: filePath) {
                rows = dataString.components(separatedBy: "\n")
            }
        }
    }
    
    // Set up the Grid View
    private func setUpGrid() {
        guard let rows = rows else { return }
        
        // Size of the Screen
        let viewWidth = view.frame.maxX - 20
        let viewHeight = view.frame.maxY / 2
        
        // Divide the screen size by the amount of rows and columns needed
        let cellWidth = viewWidth / CGFloat(rows[0].count)
        let cellHeight = viewHeight / CGFloat(rows.count)
        
        // Set the cellSize
        if cellWidth <= cellHeight {
            cellSize = cellWidth
        } else {
            cellSize = cellHeight
        }
        
        guard let cellSize = cellSize else { return }
        gridView.setGridSize(elements: rows, cellSize: cellSize)
    }
}