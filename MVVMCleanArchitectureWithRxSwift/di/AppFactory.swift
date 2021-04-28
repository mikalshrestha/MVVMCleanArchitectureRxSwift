//
//  AppFactory.swift
//  MVVMCleanArchitectureWithRxSwift
//
//  Created by Mikal Shrestha on 20/04/2021.
//

import Foundation

public class AppFactory {
    
    private static let appFactory = AppFactory()

    private var dataFactory: DataFactory?
    private var domainFactory: DomainFactory?
    private var vmFactory: VmFactory?
    
    public static func getInstance() -> AppFactory {
        return self.appFactory
    }
    
    public func providesDataFactory() -> DataFactory {
        guard let dataFactory = self.dataFactory else {
            self.dataFactory = DataFactory()
            return self.dataFactory!
        }
        return dataFactory
    }
    
    public func providesDomainFactory() -> DomainFactory {
        guard let domainFactory = self.domainFactory else {
            self.domainFactory = DomainFactory(endpoint: providesDataFactory().provideEndpoint(), initialDataUc: providesDataFactory().providesInitialDataUC())
            return self.domainFactory!
        }
        return domainFactory
    }
    
    public func providesPresenterFactory() -> PresenterFactory {
        guard let presenterFactory = self.presenterFactory else {
            self.presenterFactory = PresenterFactory(dataFactory: providesDataFactory(), domainFactory: providesDomainFactory())
            return self.presenterFactory!
        }
        return presenterFactory
    }
    
    public func providesVmFactory() -> VmFactory {
        guard let vmFactory = self.vmFactory else {
            self.vmFactory = VmFactory(dataFactory: providesDataFactory(),
            domainFactory: providesDomainFactory())
            return self.vmFactory!
        }
        return vmFactory
    }
}
