import SafariServices
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var disabledLabel: UILabel!
    @IBOutlet weak var enabledLabel: UILabel!

    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent;
    }

    override func viewWillAppear(_ animated: Bool) {
        if #available(iOS 10.0, *) {
            SFContentBlockerManager.getStateOfContentBlocker(withIdentifier: "com.kablock.ios.Ka-Block-Content-Blocker", completionHandler: {
                (state, error) in

                if state != nil {
                    self.enabledLabel.isHidden = !state!.isEnabled
                    self.disabledLabel.isHidden = state!.isEnabled
                }
            })
        } else {
            // Show settings hint on iOS 9.
            self.enabledLabel.isHidden = true
            self.disabledLabel.isHidden = false
        }
    }
}
