import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var artist = [[String:Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadDataArtist()
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    func loadDataArtist() {
        // membuat request dari alamofire
        Alamofire.request("http://itunes.apple.com/search?media=music&term=bollywood")
            .responseJSON { (response) in
                // menampilkan data json
                print("Response: \(response)")
                print("Response value: \(response.result.value!)")
                
                if let jsonData = response.result.value as! [String:Any]? {
                    if let responseValue = jsonData["results"] as! [[String:Any]]? {
                        self.artist = responseValue
                        self.tableView.reloadData()
                    }
                }
            }
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        artist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MainTableViewCell
        
        // mendistribusikan data json kedalam cell
        if (artist.count > 0) {
            do {
                let artistData = artist[indexPath.row]
                cell.artistImageView.image = try UIImage(data: Data(contentsOf: URL(string: artistData["artworkUrl100"] as! String) ?? URL(string: "http://www.google.com")!))
                cell.artistName.text = artistData["artistName"] as! String
                cell.artistCountry.text = artistData["country"] as! String
                cell.trackName.text = artistData["trackName"] as! String
            } catch {
                
            }
        }
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
}
