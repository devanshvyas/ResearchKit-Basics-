//
//  SurveyConstants.swift
//  ResearchKit Demo
//
//  Created by devansh.vyas on 03/07/18.
//  Copyright © 2018 Solution Analysts. All rights reserved.
//

import UIKit
import ResearchKit

struct SurveyConstants {
  
  let instructionStep = "InstructionStep"
  let instructionTitle = "Welcome!"
  let completeStep = "CompleteStep"
  let completeTitle = "Complete!"

  
  //MARK: sleep Study Constants
  let sleepInstructionText = "Survey on Sleep Study"
  
  let ageStep = "AgeStep"
  let ageChoice = [ORKTextChoice(text: "16+", value: "16+" as NSString),
                   ORKTextChoice(text: "20+", value: "20+" as NSString),
                   ORKTextChoice(text: "25+", value: "25+" as NSString),
                   ORKTextChoice(text: "40+", value: "40+" as NSString),
                   ORKTextChoice(text: "60+", value: "60+" as NSString)]
  let ageTitle = "Age?"
  let ageQue = "Specify your age Group!"
  
  let SleepStep = "SleepStep"
  let SleepChoice = [ORKTextChoice(text: "2+", value: "2+" as NSString),
                   ORKTextChoice(text: "3+", value: "3+" as NSString),
                   ORKTextChoice(text: "4+", value: "4+" as NSString),
                   ORKTextChoice(text: "6+", value: "6+" as NSString),
                   ORKTextChoice(text: "8+", value: "8+" as NSString)]
  let SleepTitle = "Sleep!"
  let SleepQue = "Specify amount of sleep you take!"
  
 
  let sleepOrderedTask = "SleepSurvey"
  
  //MARK: Walk Study Constants
  let walkInstructionText = "Survey on Walk Study"
  
  let locationStep = "LocationStep"
  let locationTextLength = 20
  let locationTitle = "Location!"
  let locationQue = "Specify your Location!"

  let walkStep = "WalkStep"
  let walkTitle = "Walk!"
  let walkQue = "Do you take a walk Daily?"

  let amountWalkStep = "AmountWalkStep"
  let amountAnsUnit = "kms"
  let amountMin = 0 as NSNumber
  let amountMax = 30 as NSNumber
  let amountWalkTitle = "Walk!"
  let amountWalkQue = "Amount of walk you take!"
  
  let navigableIdentifier = "task"
  let walkOrderedTask = "WalkSurvey"

  //MARK: Work Study Constants
  let deptChoice = [ORKTextChoice(text: "Development", value: "dev" as NSString),
                   ORKTextChoice(text: "Sales", value: "sales" as NSString)]
  let deptStep = "DeptStep"
  let deptTitle = "Departments!"
  let deptQue = "Choose your Department:"

  let workingHrStep = "WorkingHrStep"
  let workingHrTitle = "Working hrs!"
  let workingHrQue = "your Working Hours:"
  let workingHrMin = 5
  let workingHrMax = 18
  let workingHrDefault = 8
  let workingHrMinDes = "Min"
  let workingHrMaxDes = "Max"

  let reviewChoice = [ORKImageChoice(normalImage: #imageLiteral(resourceName: "happy"), selectedImage: #imageLiteral(resourceName: "happy"), text: "Happy", value: "happy" as NSString),
                      ORKImageChoice(normalImage: #imageLiteral(resourceName: "ok"), selectedImage: #imageLiteral(resourceName: "ok"), text: "Okay", value: "ok" as NSString),
                      ORKImageChoice(normalImage: #imageLiteral(resourceName: "sad"), selectedImage: #imageLiteral(resourceName: "sad"), text: "Sad", value: "sad" as NSString)]
  let reviewStep = "ReviewStep"
  let reviewTitle = "Review!"
  let reviewQue = "What you feel about your work?"
  
  let workOrderedTask = "WorkSurvey"
  
  //MARK: tapping speed constants
  let tappingDes = "Check your Tapping Speed here!"
  let tappingStep = "TappingStep"
  let tappingDuration = TimeInterval(6)
  
  //MARK: spatial constants
  let spatialDes = "Check your Memory here!"
  let spatialStep = "SpatialStep"
  let spatialInitSpan = 2
  let spatialMinSpan = 1
  let spatialMaxSpan = 4
  let spatialMaxTest = 5
  let spatialMaxFail = 2
 let spatialplaySpeed = TimeInterval(2)
  
  //MARK: psat constant
  let psatDes = "Check your Maths!"
  let psatStep = "PsatStep"
  let psatSeriesLength = 10
  let psatInterval = TimeInterval(2)
  
  //MARK: consent
  let consentDocTitle = "Welcome!"
  let consentSignId = "ConsentUserSign"
  let consentSignTitle = "Customer"
  let visualConsentStep = "ConsentVisualStep"
  let reviewConsentStep = "ConsentReviewStep"
  let consentOrderedTask = "ConsentTask"
  
  //MARK: pdf
  let fileName = "Signature.pdf"
  
  //MARK: segue
  let tabBarSegue = "toTabBar"
  
  //MARK: pdfStep
  let pdfStep = "PdfStep"
}

