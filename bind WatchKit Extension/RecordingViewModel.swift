//
//  RecordingModel.swift
//  bind WatchKit Extension
//
//  Created by Wilton Ramos on 31/05/21.
//

import Foundation
import SwiftUI
import Combine
import AVFoundation
import CoreData

class RecordingViewModel: ObservableObject {
    
    @FetchRequest(entity: Record.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Record.date, ascending: true)], animation: .easeIn) var history : FetchedResults<Record>
    
    let objectWillChange = PassthroughSubject<AVAudioRecorder, Never>()
    var audioRecorder: AVAudioRecorder!
    var audioPath: String?
    
    var recording = false {
        didSet {
            objectWillChange.send(self.audioRecorder)
        }
    }
    
    func startRecording() {
        let recordingSession = AVAudioSession.sharedInstance()
        
        do {
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)
        } catch {
            print("Failed to set up recording session")
        }
        
        let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        self.audioPath = documentPath.absoluteString
        
        let audioFilename = documentPath.appendingPathComponent("\(Date().toString(dateFormat: "dd-MM-YY_'at'_HH:mm:ss")).m4a")
        
        let settings = [
                    AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
                    AVSampleRateKey: 12000,
                    AVNumberOfChannelsKey: 1,
                    AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
                ]
        
        do {
                    audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
                    audioRecorder.record()

                    recording = true
                } catch {
                    print("Could not start recording")
                }
    }
    
    func stopRecording() {
        audioRecorder.stop()
        recording = false
        history.first?.audiopath = audioPath
        PersistenceController.shared.save()
    }
}
