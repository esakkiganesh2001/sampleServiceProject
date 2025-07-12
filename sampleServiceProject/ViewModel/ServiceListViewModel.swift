//
//  ServiceListViewModel.swift
//  sampleServiceProject
//
//  Created by Esakki Ganesh iOS on 12/07/25.
//

import ServicesSampleData
import SwiftUI
import Combine

class ServiceListViewModel: ObservableObject {
    
    @Published var services: [Service] = []
    @Published var searchText: String = ""

    private var allServices: [Service] = []
    private var cancellables = Set<AnyCancellable>()

    init() {
        $searchText
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .sink { [weak self] _ in self?.filterServices() }
            .store(in: &cancellables)
        
        fetchServices()
    }

    func fetchServices() {
        allServices = SampleData.generateServices()
        filterServices()
    }

    private func filterServices() {
        if searchText.isEmpty {
            services = allServices
        } else {
            services = allServices.filter {
                $0.title.localizedCaseInsensitiveContains(searchText) ||
                $0.customerName.localizedCaseInsensitiveContains(searchText) || $0.description.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}
