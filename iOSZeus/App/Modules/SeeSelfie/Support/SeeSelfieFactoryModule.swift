//
//  SeeSelfieFactoryModule.swift
//  iOSZeus
//
//  Created by Javier Cueto on 30/07/22.
//

struct SeeSelfieFactoryModule {
    func makeModule(view: HomeViewFromPresenter?, with userDataBag: UserDataBag) {
        guard let view = view as? HomeViewController, let navigation = view.navigationController else { return }
        let presenter = SeeSelfiePresenterImpl()
        let interactor = SeeSelfieInteractorImpl()
        let controller = SeeSelfieViewController()
        interactor.title = userDataBag.name
        interactor.imageData = userDataBag.image
        interactor.backgroundColor = userDataBag.systemColor
        presenter.interactor = interactor
        controller.presenter = presenter
        navigation.pushViewController(controller, animated: true)
    }
}
