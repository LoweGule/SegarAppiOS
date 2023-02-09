import UIKit

class UserViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var buah = [Buah]()

    
    @IBOutlet weak var tvBuah: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return buah.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tvBuah
            .dequeueReusableCell(withIdentifier: "UserCell", for:  indexPath) as! UserTableViewCell
        let buah = buah[indexPath.row]
        
        cell.nameTxt?.text = buah.name.capitalized
            
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadJSON {
            self.tvBuah.reloadData()
            print("success")
        }
        
        tvBuah.delegate = self
        tvBuah.dataSource = self
            
        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(didDoubleTap(gesture: )))
        doubleTapGesture.numberOfTapsRequired = 2
        view.addGestureRecognizer(doubleTapGesture)
    }
    
            
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            performSegue(withIdentifier: "toDetails", sender: self)
        }
            
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let destination = segue.destination as? DetailsViewController {
                destination.buah = buah[tvBuah.indexPathForSelectedRow!.row]
            }
        }
        
        
        func downloadJSON(completed: @escaping () -> ()) {
                let url = URL(string: "https://fruityvice.com/api/fruit/all")
                
                URLSession.shared.dataTask(with: url!) { data, response, err in
                    
                    if err == nil {
                        do {
                            self.buah = try JSONDecoder().decode([Buah].self, from: data!)
                            DispatchQueue.main.async {
                                completed()
                            }
                        }
                        catch {
                            print("error fetching data from api")
                        }
                    }
                    
                }.resume()
            }
        
    @objc func didDoubleTap(gesture: UITapGestureRecognizer) {
        let loc = gesture.location(in: tvBuah)
        if let indexPath = tvBuah.indexPathForRow(at: loc) {
            let cell = tvBuah.cellForRow(at: indexPath)
            
            
            
        }
        
        
    }
    
    
    @IBAction func goFav(_ sender: Any?) {
        performSegue(withIdentifier: "goFav", sender: self)
        
    }
    
}
