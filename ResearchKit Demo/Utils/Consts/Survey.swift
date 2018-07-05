//
//  SleepStudy.swift
//  ResearchKit Demo
//
//  Created by devansh.vyas on 03/07/18.
//  Copyright © 2018 Solution Analysts. All rights reserved.
//

import UIKit
import ResearchKit

//MARK: Sleep Study Survey
public var sleepStudy: ORKOrderedTask{
  let obj = SurveyConstants()
  
  var steps = [ORKStep]()
  let introStep = ORKInstructionStep(identifier: obj.instructionStep)
  introStep.title = obj.instructionTitle
  introStep.text = obj.sleepInstructionText
  steps += [introStep]
  
  
  let ageAnsFormat = ORKValuePickerAnswerFormat(textChoices: obj.ageChoice)
  let ageQueStep = ORKQuestionStep(identifier: obj.ageStep , title: obj.ageTitle, question: obj.ageQue, answer: ageAnsFormat)
  steps += [ageQueStep]
  
  let sleepAnsFormat = ORKValuePickerAnswerFormat(textChoices: obj.SleepChoice)
  let sleepQueStep = ORKQuestionStep(identifier: obj.SleepStep, title: obj.SleepTitle, question: obj.SleepQue, answer: sleepAnsFormat)
  steps += [sleepQueStep]
  
  let completeStep = ORKCompletionStep(identifier: obj.completeStep)
  completeStep.text = obj.completeTitle
  steps += [completeStep]
  
  return ORKOrderedTask(identifier: obj.sleepOrderedTask, steps: steps)
}

//MARK: Walk Study Survey
public var walkStudy: ORKOrderedTask{
  let obj = SurveyConstants()
  
  var steps = [ORKStep]()
  let introStep = ORKInstructionStep(identifier: obj.instructionStep)
  introStep.title = obj.instructionTitle
  introStep.text = obj.walkInstructionText
  steps += [introStep]
  
  let locationAnsFormat = ORKLocationAnswerFormat()
  let locationQueStep = ORKQuestionStep(identifier: obj.locationStep, title: obj.locationTitle, question: obj.locationQue, answer: locationAnsFormat)
  steps += [locationQueStep]
  
  let walkAnsFormat = ORKBooleanAnswerFormat()
  let walkQueStep = ORKQuestionStep(identifier: obj.walkStep, title: obj.walkTitle, question: obj.walkQue, answer: walkAnsFormat)
  steps += [walkQueStep]
  
  let amountWalkAnsFormat = ORKNumericAnswerFormat(style: .integer, unit: obj.amountAnsUnit, minimum: obj.amountMin, maximum: obj.amountMax)
  let amountWalkQueStep = ORKQuestionStep(identifier: obj.amountWalkStep, title: obj.amountWalkTitle, question: obj.amountWalkQue, answer: amountWalkAnsFormat)
  steps += [amountWalkQueStep]
  
  let completeStep = ORKCompletionStep(identifier: obj.completeStep)
  completeStep.text = obj.completeTitle
  steps += [completeStep]
  
  let task = ORKNavigableOrderedTask(identifier: obj.navigableIdentifier, steps: steps)
  let predicate = ORKResultPredicate.predicateForBooleanQuestionResult(with: ORKResultSelector(resultIdentifier: walkQueStep.identifier), expectedAnswer: false)
  let rule = ORKPredicateStepNavigationRule(resultPredicatesAndDestinationStepIdentifiers: [(resultPredicate: predicate, destinationStepIdentifier: completeStep.identifier)])
  task.setNavigationRule(rule, forTriggerStepIdentifier: walkQueStep.identifier)
  
  return task
}

//MARK: Work Study Survey
public var workStudy: ORKOrderedTask{
  let obj = SurveyConstants()
  
  var steps = [ORKStep]()
  let introStep = ORKInstructionStep(identifier: obj.instructionStep)
  introStep.title = obj.instructionTitle
  introStep.text = obj.walkInstructionText
  steps += [introStep]
  
  let departmentAnsStep = ORKValuePickerAnswerFormat(textChoices: obj.deptChoice)
  let departmentQueStep = ORKQuestionStep(identifier: obj.deptStep, title: obj.deptTitle, question: obj.deptQue, answer: departmentAnsStep)
  steps += [departmentQueStep]
  
  let workingHrAnsStep = ORKScaleAnswerFormat(maximumValue: obj.workingHrMax, minimumValue: obj.workingHrMin, defaultValue: obj.workingHrDefault, step: 1, vertical: false, maximumValueDescription: obj.workingHrMaxDes, minimumValueDescription: obj.workingHrMaxDes)
  let workingHrQueStep = ORKQuestionStep(identifier: obj.workingHrStep, title: obj.workingHrTitle, question: obj.workingHrQue, answer: workingHrAnsStep)
  steps += [workingHrQueStep]
  
  let reviewAnsStep = ORKImageChoiceAnswerFormat(imageChoices: obj.reviewChoice, style: .singleChoice, vertical: false)
  let reviewQueStep = ORKQuestionStep(identifier: obj.reviewStep, title: obj.reviewTitle, question: obj.reviewQue, answer: reviewAnsStep)
  steps += [reviewQueStep]
  
  let completeStep = ORKCompletionStep(identifier: obj.completeStep)
  completeStep.text = obj.completeTitle
  steps += [completeStep]
  
  return ORKOrderedTask(identifier: obj.workOrderedTask, steps: steps)
}

//MARK: tapping Speed Activity
public var tappingSpeed: ORKOrderedTask{
  let obj = SurveyConstants()
  
 return ORKOrderedTask.twoFingerTappingIntervalTask(withIdentifier: obj.tappingStep, intendedUseDescription: obj.tappingDes, duration: obj.tappingDuration, handOptions: .right, options: ORKPredefinedTaskOption())
}

//MARK: Spatial Activity
public var spatial: ORKOrderedTask{
  let obj = SurveyConstants()
  
  return ORKOrderedTask.spatialSpanMemoryTask(withIdentifier: obj.spatialStep, intendedUseDescription: obj.spatialDes, initialSpan: obj.spatialInitSpan, minimumSpan: obj.spatialMinSpan, maximumSpan: obj.spatialMaxSpan, playSpeed: obj.spatialplaySpeed, maximumTests: obj.spatialMaxTest, maximumConsecutiveFailures: obj.spatialMaxFail, customTargetImage: nil , customTargetPluralName: nil, requireReversal: false, options: ORKPredefinedTaskOption())
}

//MARK: PSVAT
public var psat: ORKOrderedTask{
  let obj = SurveyConstants()
  
  return ORKOrderedTask.psatTask(withIdentifier: obj.psatStep, intendedUseDescription: obj.psatDes, presentationMode: .visual, interStimulusInterval: obj.psatInterval, stimulusDuration: obj.psatInterval, seriesLength: obj.psatSeriesLength, options: ORKPredefinedTaskOption())
}

//MARK: consent Document
public var consentDocument: ORKConsentDocument{
  let consentDoc = ORKConsentDocument()
  consentDoc.title = SurveyConstants().consentDocTitle
  let consentSecType: [ORKConsentSectionType] = [.overview, .dataGathering, .privacy, .dataUse, .timeCommitment, .studySurvey, .studyTasks, .withdrawing]
  consentDoc.addSignature(ORKConsentSignature(forPersonWithTitle: SurveyConstants().consentSignTitle, dateFormatString: nil, identifier: SurveyConstants().consentSignId))
  let consentSection: [ORKConsentSection] = consentSecType.map { conSecTyp in
    let conSec = ORKConsentSection(type: conSecTyp)
    return conSec
  }
  consentDoc.sections = consentSection
  return consentDoc
}

//MARK: Consent
public var consent: ORKOrderedTask{
  let obj = SurveyConstants()
  var steps = [ORKStep]()
  
  let visualConsentStep = ORKVisualConsentStep(identifier: obj.visualConsentStep, document: consentDocument)
  steps += [visualConsentStep]
  
  let sign = consentDocument.signatures?.first
  let reviewConsentStep = ORKConsentReviewStep(identifier: obj.reviewConsentStep, signature: sign, in: consentDocument)
  steps += [reviewConsentStep]
  
  let completeStep = ORKCompletionStep(identifier: obj.completeStep)
  steps += [completeStep]
  
  return ORKOrderedTask(identifier: obj.consentOrderedTask, steps: steps)
}
