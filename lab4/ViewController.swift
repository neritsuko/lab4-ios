import UIKit

class ViewController: UIViewController {
    
    var timer: Timer?
    var counter = 0
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "Time: \(counter)"
    }
    
    @IBAction func startTimer(_ sender: UIButton) {
        if timer == nil || !(timer?.isValid ?? false) {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func stopTimer(_ sender: UIButton) {
        timer?.invalidate()
    }
    
    @IBAction func resetTimer(_ sender: UIButton) {
        counter = 0
        label.text = "Time: \(counter)"
        timer?.invalidate()
    }
    
    @objc func updateTimer() {
        counter += 1
        label.text = "Time: \(counter)"
    }
}
