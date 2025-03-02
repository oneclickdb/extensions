import Foundation
import AudioToolbox
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String)
{
    if let path = Bundle.main.path(forResource: sound, ofType: type)
    {
        do
        {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Error finding sound file")
        }
    }
}

//https://github.com/TUNER88/iOSSystemSoundsLibrary -> List of sounds
func playSystemSound(number: UInt32 = 1104)
{
    AudioServicesPlaySystemSound(number)
}

func speak(text: String)
{
    var speechSynthesizer = AVSpeechSynthesizer()

    var speechUtterance: AVSpeechUtterance = AVSpeechUtterance(string: text)
    
    speechUtterance.rate = AVSpeechUtteranceMaximumSpeechRate / 4.0
    
    speechUtterance.voice = AVSpeechSynthesisVoice(language: "en-GB")

    speechSynthesizer.speak(speechUtterance)
}
