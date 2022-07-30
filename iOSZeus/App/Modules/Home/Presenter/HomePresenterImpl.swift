//
//  HomePresenterImpl.swift
//  iOSZeus
//
//  Created by Javier Cueto on 27/07/22.
//
import Foundation

final class HomePresenterImpl: HomePresenter {

    weak var view: HomeViewFromPresenter?
    
    var interactor: HomeInteractorInput?
    
    var router: HomeRouter?
    
}

extension HomePresenterImpl: HomePresenteInput {

    
    var title: String? {
        interactor?.title
    }
    
    func viewDidLoad() {
        interactor?.getColor()
    }
    
    func didSelectRowAt(indexPath: IndexPath) {
        interactor?.goToModule(indexPath: indexPath)
    }
    
    func cellType(cellForRowAt indexPath: IndexPath) -> HomeCellType? {
        interactor?.cellType(cellForRowAt: indexPath)
    }
    
    func numberCells() -> Int? {
        interactor?.getNumberCells()
    }
    
    func saveColor(_ color: String) {
        interactor?.persistenColor(color)
    }
    
    func saveName(_ name: String?) {
        interactor?.persistenName(name)
    }
}


extension HomePresenterImpl: HomeInteractorOutput {

    
    func updateColor(_ color: String) {
        view?.setColor(color)
    }
    
    func onError(errorMessage: String) {
        view?.showError(errorMessage: errorMessage)
    }
    
    func goToCameraModule() {
        router?.goToCamera(view: view, parentPresenter: self)
    }
    
    func goToChartModule(backgroundColor: String?) {
        router?.goToChart(view: view, backGroundColor: backgroundColor)
    }
    
    func userDataLoaded() {
        view?.clearField()
    }
}



extension HomePresenterImpl: CameraPresenterDelegate {
    func imageTaken(image: Any) {
        interactor?.persistenImage(image)
    }

}


