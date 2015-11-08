//
//  PlayViewController.swift
//  ShadyGrid
//
//  Created by Toni Möckel on 29.10.15.
//  Copyright © 2015 Toni Möckel. All rights reserved.
//

import UIKit

protocol PlayViewControllerDelegate {
    
    func playViewController(playViewController: PlayViewController, didFinishWithScore score: Int)
    
}

class PlayViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var configuration: PlayConfiguration = PlayConfiguration()
    var matrix: GameMatrixProtocol = AdjacentMatrix(cols: 3, rows: 6, colorSteps: 8)
    var delegate: PlayViewControllerDelegate! = nil
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        matrix = createMatrix(configuration)
        self.collectionView?.reloadData()
        
    }
    
    func createMatrix(configuration: PlayConfiguration) -> GameMatrixProtocol {
        
        let colorMatrix: AdjacentMatrix = AdjacentMatrix(cols: configuration.cols, rows: configuration.rows, colorSteps: configuration.colorSteps, color: configuration.color)
        colorMatrix.fillWithRandom()
        
        return colorMatrix
        
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return matrix.count();
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let  cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! ShadyCell
        configure(cell, indexPath: indexPath)
        return cell
        
    }
    
    func configure(cell: ShadyCell, indexPath: NSIndexPath) -> Void {
        cell.contentView.backgroundColor = matrix.colorForElement(indexPath.row)
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsetsZero;
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(self.view.frame.size.width / CGFloat(matrix.colCount()), self.view.frame.size.height / CGFloat(matrix.rowCount()))
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        matrix.increaseValue(indexPath.row)
        collectionView.reloadData()
        
        if (matrix.isCompleted()){
            self.delegate.playViewController(self, didFinishWithScore: matrix.score)
        }
        
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}

