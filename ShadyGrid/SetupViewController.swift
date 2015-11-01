//
//  SetupViewController.swift
//  ShadyGrid
//
//  Created by Toni Möckel on 30.10.15.
//  Copyright © 2015 Toni Möckel. All rights reserved.
//

import UIKit

class SetupViewController: UIViewController, PlayViewControllerDelegate {

    @IBOutlet weak var colorStepsSlider: UISlider!
    @IBOutlet weak var rowCountSlider: UISlider!
    @IBOutlet weak var colCountSlider: UISlider!
    @IBOutlet weak var colorSegmentedControl: UISegmentedControl!
    @IBOutlet weak var rowCountLabel: UILabel!
    @IBOutlet weak var colCountLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var highScoreTitleLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    @IBOutlet weak var colorStepsTitleLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    
    var configuration: PlayConfiguration = PlayConfiguration()
    
    enum SegueIdentifier: String {
        case StartPlaySegue = "startPlay"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setUIFromConfiguration(configuration)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        switch segue.identifier {
        case SegueIdentifier.StartPlaySegue.rawValue?:
            
            let controller : PlayViewController = (segue.destinationViewController as? PlayViewController)!
            controller.delegate = self
            controller.configuration = configuration
            
            break
        default:
            break
            
        }
        
    }
    
    func setUIFromConfiguration (config: PlayConfiguration) -> Void {
        
        rowCountLabel.text = String(config.rows)
        rowCountSlider.value = Float(config.rows)
        
        colCountLabel.text = String(config.cols)
        colCountSlider.value = Float(config.cols)
        
        colorSegmentedControl.selectedSegmentIndex = config.color.rawValue
        
        colorStepsSlider.value = Float(config.colorSteps)
        colorStepsTitleLabel.text = String(config.colorSteps)
        
        
    }
    
    func playViewController(playViewController: PlayViewController, didFinishWithScore score: Int) {
        
        playViewController.dismissViewControllerAnimated(true, completion: nil)
        
        let alert = UIAlertController(title: NSLocalizedString("Congrats", comment: "Alert"), message: String(format: "Your Score: %d", score), preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
        highScoreLabel.text = String(score)
        
    }

    
    @IBAction func colorStepsSliderValueChanged(sender: UISlider) {
        configuration.colorSteps = Int(sender.value)
        setUIFromConfiguration(configuration)
    }
    
    @IBAction func colorControlValueChanged(sender: UISegmentedControl) {
        configuration.color = PlayConfiguration.ColorMode(rawValue: sender.selectedSegmentIndex)!
        setUIFromConfiguration(configuration)
    }
    @IBAction func rowSliderValueChanged(sender: UISlider) {
        configuration.rows = Int(sender.value)
        setUIFromConfiguration(configuration)
    }

    @IBAction func colSliderValueChanged(sender: UISlider) {
        configuration.cols = Int(sender.value)
        setUIFromConfiguration(configuration)
    }

}
