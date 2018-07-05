//
//  ConsentVC.swift
//  ResearchKit Demo
//
//  Created by devansh.vyas on 05/07/18.
//  Copyright © 2018 Solution Analysts. All rights reserved.
//

import UIKit
import ResearchKit

class ConsentVC: UIViewController, ORKTaskViewControllerDelegate,ORKStepViewControllerDelegate{
  //MARK: Variables
  var pdfPath: String?
  @IBOutlet weak var survey: UIButton!
  @IBOutlet weak var btn: UIButton!
  
  //MARK: Step View Delegate
  func stepViewController(_ stepViewController: ORKStepViewController, didFinishWith direction: ORKStepViewControllerNavigationDirection) {
    stepViewController.dismiss(animated: true, completion: nil)
  }
  
  func stepViewControllerResultDidChange(_ stepViewController: ORKStepViewController) {
  }
  
  func stepViewControllerDidFail(_ stepViewController: ORKStepViewController, withError error: Error?) {
  }
  
  func stepViewController(_ stepViewController: ORKStepViewController, recorder: ORKRecorder, didFailWithError error: Error) {
  }
  
  //MARK: task view delagate
  func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
    btn.isHidden = false
    survey.isHidden = false
    taskViewController.dismiss(animated: true) {
      if reason == .completed{
        if let signResult = taskViewController.result.stepResult(forStepIdentifier: SurveyConstants().reviewConsentStep)?.results?.first as? ORKConsentSignatureResult{
          let document = consentDocument.copy() as? ORKConsentDocument
          if (signResult.signature?.signatureImage) != nil{
            signResult.signature?.title = "\(signResult.signature?.givenName ?? "") \(signResult.signature?.familyName ?? "")"
            signResult.apply(to: document!)
            document?.makePDF{ (data, error) in
              let tempPath = NSTemporaryDirectory() as NSString
              self.pdfPath = tempPath.appendingPathComponent(SurveyConstants().fileName) as String
              print(self.pdfPath ?? "")
              do{
                try data?.write(to: URL(fileURLWithPath: self.pdfPath!), options: Data.WritingOptions.atomicWrite)
                  //  try data?.write(to: URL(fileURLWithPath: path))
              }
              catch{
                return
              }
            }
          }
        }
      }
    }
    
  }
  
  //MARK: On Button pressed
  @IBAction func consentPressed(_ sender: UIButton) {
    let taskVC = ORKTaskViewController(task: consent, taskRun: nil)
    taskVC.delegate = self
    present(taskVC, animated: true, completion: nil)
  }
  
  @IBAction func viewConsent(_ sender: UIButton) {
    let previewStep = ORKPDFViewerStep(identifier: SurveyConstants().pdfStep, pdfURL: URL(fileURLWithPath: pdfPath!))
    let taskVC = ORKPDFViewerStepViewController(step: previewStep)
    taskVC.delegate = self
    present(taskVC, animated: true, completion: nil)
  }

  @IBAction func toSurvey(_ sender: UIButton) {
    performSegue(withIdentifier: SurveyConstants().tabBarSegue, sender: self)
  }
  
}
