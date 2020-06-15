//
//  HomeViewModel.swift
//  FilmsApp
//
//  Created by camilo andres ibarra yepes on 7/06/20.
//  Copyright © 2020 camilo andres ibarra yepes. All rights reserved.
//

import Foundation
import RxSwift

class HomeViewModel {
    private weak var view: HomeView?
    private var router: HomeRouter?
    private var managerConnection = ManagerConnections()
    
    func bind(view: HomeView, router: HomeRouter) {
        self.view = view
        self.router = router
        self.router?.setSourceView(view)
    }
    
    func getListMoviesData() -> Observable<[Movie]> {
        return managerConnection.getPopularMovies()
    }
}



