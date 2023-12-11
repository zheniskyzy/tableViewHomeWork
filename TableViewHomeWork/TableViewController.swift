//
//  TableViewController.swift
//  TableViewHomeWork
//
//  Created by Madina Olzhabek on 11.12.2023.
//

import UIKit

class TableViewController: UITableViewController {
    
    //var arrayNames = ["Карате пацан", "Аладдин", "1+1", "Мой ужасный сосед", "Интерстеллар"]
   // var arrayGenre = ["боевые искусства / драма / семейный", "комедия / мюзикл / фэнтези / приключения / мелодрама", "Комедии / Драмы / Биография", "Драма / Комедия", "Приключения / Драмы / Фантастика"]
   // var arrayImage = ["карате пацан", "аладдин", "1+1", "мой ужасный сосед", "интерстеллар"]
    var arrayFilm = [Film(name: "Карате пацан", genre: "боевые искусства / драма / семейный", imagename: "карате пацан", descrip: "12-летний Дре Паркер (Джейден Смит) мог бы быть самым популярным парнем в Детройте, но из-за последнего карьерного изменения у его матери (Тараджи Хенсон) оказался в Китае. Дре сразу понравилась одноклассница Мей Йинг, и чувства взаимны, но культурные различия делают их дружбу невозможной.", year: "2010", director: "Харальд Цварт", image2: "пацан2", image3: "пацан3", image4: "пацан4"),
                     Film(name: "Аладдин", genre: "комедия / мюзикл / фэнтези / приключения / мелодрама", imagename: "аладдин", descrip: "Молодой воришка по имени Аладдин хочет стать принцем, чтобы жениться на принцессе Жасмин. Тем временем визирь Аграбы Джафар, намеревается захватить власть над Аграбой, а для этого он стремится заполучить волшебную лампу, хранящуюся в пещере чудес, доступ к которой разрешен лишь тому, кого называют «алмаз неограненный», и этим человеком является никто иной как сам Аладдин.", year: "2019", director: "Гай Ричи",image2: "аладдин2",image3: "аладдин3", image4: "аладдин4"),
                     Film(name: "1+1", genre: "Комедии / Драмы / Биография", imagename: "1+1", descrip: "Пострадав в результате несчастного случая, богатый аристократ Филипп нанимает в помощники человека, который менее всего подходит для этой работы, — молодого жителя предместья Дрисса, только что освободившегося из тюрьмы. Несмотря на то, что Филипп прикован к инвалидному креслу, Дриссу удается привнести в размеренную жизнь аристократа дух приключений.", year: "2011", director: "Оливье Накаш, Эрик Толедано", image2: "1+1.2", image3: "1+1.3", image4: "1+1.4"),
                     Film(name: "Мой ужасный сосед", genre: "Драма / Комедия", imagename: "мой ужасный сосед", descrip: "Когда весёлая молодая семья переезжает в соседний дом, Отто встречает пару в своей манере, но вскоре неожиданная дружба с сообразительной и глубоко беременной Марисоль перевернёт его мир с ног на голову.", year: "2023", director: "Марк Форстер", image2: "сосед2", image3: "сосед3", image4: "сосед4"),
                     Film(name: "Интерстеллар", genre: "Приключения / Драмы / Фантастика", imagename: "интерстеллар", descrip: "Наше время на Земле подошло к концу, команда исследователей берет на себя самую важную миссию в истории человечества; путешествуя за пределами нашей галактики, чтобы узнать есть ли у человечества будущее среди звезд.", year: "2014",director: "Кристофер Нолан", image2: "интерстеллар2", image3: "интерстеллар3",image4: "интерстеллар4")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    
    @IBAction func addPerson(_ sender: Any) {
        //arrayNames.append("new film")
       // arrayGenre.append("new genre")
       // arrayImage.append("avatar")
        arrayFilm.append(Film(name: "new film",genre: "new genre",imagename: "avatar", year: "-", director: "-"))
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayFilm.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = arrayFilm[indexPath.row].name

        let labelGenre = cell.viewWithTag(1001) as! UILabel
        labelGenre.text = arrayFilm[indexPath.row].genre
        
        let imageview = cell.viewWithTag(1002) as! UIImageView
        imageview.image = UIImage(named: arrayFilm[indexPath.row ].imagename)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 89
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVc = storyboard?.instantiateViewController(withIdentifier: "detailViewController") as! ViewController
        //detailVc.name = arrayFilm[indexPath.row].name
       // detailVc.genre = arrayFilm[indexPath.row].genre
       // detailVc.imagename = arrayFilm[indexPath.row].imagename
        detailVc.film = arrayFilm[indexPath.row ]
        
        navigationController?.show(detailVc, sender: self )
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
    // arrayNames.remove(at: indexPath.row)
    // arrayGenre.remove(at: indexPath.row)
    // arrayImage.remove(at: indexPath.row)
            arrayFilm.remove(at: indexPath.row)
             
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
