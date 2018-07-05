//
//  ViewController.swift
//  ResearchKit Demo
//
//  Created by devansh.vyas on 03/07/18.
//  Copyright © 2018 Solution Analysts. All rights reserved.
//

import UIKit
import ResearchKit
//import SwiftyJSON

class SurveyVC: UIViewController, ORKTaskViewControllerDelegate{
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  func taskViewController(_ taskViewController: ORKTaskViewController, didChange result: ORKTaskResult) {
    if let stepResult = taskViewController.currentStepViewController?.result?.firstResult as? ORKChoiceQuestionResult{
      if let answer = stepResult.choiceAnswers?[0]{
        print("\(String(describing: answer))")
      }
    }
    if let stepResult = taskViewController.currentStepViewController?.result?.firstResult as? ORKLocationQuestionResult{
      if let answer = stepResult.locationAnswer{
        print("\(String(describing: answer))")
      }
    }
    if let stepResult = taskViewController.currentStepViewController?.result?.firstResult as? ORKNumericQuestionResult{
      if let answer = stepResult.numericAnswer{
        print("\(String(describing: answer))")
      }
    }
    if let stepResult = taskViewController.currentStepViewController?.result?.firstResult as? ORKScaleQuestionResult{
      if let answer = stepResult.scaleAnswer{
        print("\(String(describing: answer))")
      }
    }
    
//    if let tappingTaskResult = ((result.results?[2] as? ORKStepResult)?.results![0] as? ORKTappingIntervalResult)?.samples?.count{
//      print(tappingTaskResult)
//    }
    if let spatialTaskResult = ((result.results?[2] as? ORKStepResult)?.results?[0] as? ORKSpatialSpanMemoryResult)?.score{
      print(spatialTaskResult)
    }
//    if let psvatTaskResult = ((result.results?[3] as? ORKStepResult)?.results?[0] as? ORKPSATResult)?.totalCorrect{
//      print(activeTaskResult)
//    }
  }
  
  func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
    taskViewController.dismiss(animated: true, completion: nil)
 
  }
  
  @IBAction func SleepStudyPressed(_ sender: UIButton) {
    let taskVC = ORKTaskViewController(task: sleepStudy, taskRun: nil)
    taskVC.delegate = self
    present(taskVC, animated: true, completion: nil)
  }
  
  @IBAction func WalkStudyPressed(_ sender: UIButton) {
    let taskVC = ORKTaskViewController(task: walkStudy, taskRun: nil)
    taskVC.delegate = self
    present(taskVC, animated: true, completion: nil)
  }
  
  @IBAction func WorkStudyPressed(_ sender: UIButton) {
    let taskVC = ORKTaskViewController(task: workStudy, taskRun: nil)
    taskVC.delegate = self
    present(taskVC, animated: true, completion: nil)
  }
  @IBAction func TappingActivity(_ sender: UIButton) {
    let taskVC = ORKTaskViewController(task: tappingSpeed, taskRun: nil)
    taskVC.delegate = self
    present(taskVC, animated: true, completion: nil)
  }
  @IBAction func SpatialActivity(_ sender: UIButton) {
    let taskVC = ORKTaskViewController(task: spatial, taskRun: nil)
    taskVC.delegate = self
    present(taskVC, animated: true, completion: nil)

  }
  @IBAction func PSATPressed(_ sender: UIButton) {
    let taskVC = ORKTaskViewController(task: psat, taskRun: nil)
    taskVC.delegate = self
    present(taskVC, animated: true, completion: nil)
  }
}

