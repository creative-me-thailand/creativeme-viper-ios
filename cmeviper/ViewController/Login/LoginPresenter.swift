//
//  LoginPresenter.swift
//  cmeviper
//
//  Created Patipat Sahasapanan on 29/8/2561 BE.
//  Copyright © 2561 CreativeMe. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class LoginPresenter: LoginPresenterProtocol, LoginInteractorOutputProtocol {

    weak private var view: LoginViewProtocol?
    var interactor: LoginInteractorInputProtocol?
    private let router: LoginWireframeProtocol

    init(interface: LoginViewProtocol, interactor: LoginInteractorInputProtocol?, router: LoginWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}