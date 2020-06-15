//
//  HomeView.swift
//  FilmsApp
//
//  Created by camilo andres ibarra yepes on 7/06/20.
//  Copyright © 2020 camilo andres ibarra yepes. All rights reserved.
//

import UIKit
import RxSwift

class HomeView: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    private var router = HomeRouter()
    private var viewModel = HomeViewModel()
    private var disposeBag = DisposeBag()
    private var movies = [Movie]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        viewModel.bind(view: self, router: router)
        getData()
    }
    
    private func configureTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: "CustomMovieCell", bundle: nil), forCellReuseIdentifier: "CustomMovieCell")
    }
    
    private func getData() {
        return viewModel.getListMoviesData()
        // Manage the concurrency or threads of RxSwift
            // Execute on the main thread
            .subscribeOn(MainScheduler.instance)
            .observeOn(MainScheduler.instance)
        // Suscribe to the observable
            .subscribe(
                onNext: { movies in
                    self.movies = movies
                    self.reloadTableView()
            }, onError: { error in
                print(error.localizedDescription)
            }, onCompleted: {
            }).disposed(by: disposeBag)
        // Complete the Rxswift sequence
    }
    
    private func reloadTableView() {
        DispatchQueue.main.async {
            self.activity.stopAnimating()
            self.activity.isHidden = true
            self.tableView.reloadData()
        }
    }
}

extension HomeView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "CustomMovieCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CustomMovieCell.self)) as! CustomMovieCell
        if let imageUrl = movies[indexPath.row].image {
            cell.imageMovie.imageFromServerURL(urlString: "\(Constans.URL.urlImages+imageUrl)", placeHolderImage: UIImage(named: "placeHolderMovie")!)
        }
        cell.titleMovie.text = movies[indexPath.row].title
        cell.descriptionMovie.text = movies[indexPath.row].sinopsis
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
