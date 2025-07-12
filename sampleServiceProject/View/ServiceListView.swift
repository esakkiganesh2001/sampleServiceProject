//
//  ServiceListView.swift
//  sampleServiceProject
//
//  Created by Esakki Ganesh iOS on 12/07/25.
//

import ServicesSampleData
import SwiftUI
import Combine

struct ServiceListView: View {
    
    @StateObject private var viewModel = ServiceListViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                CustomSearchBar(searchText: $viewModel.searchText)
                    .padding(.horizontal, 0)
                List {
                    ForEach(viewModel.services) { service in
                        ZStack {
                            NavigationLink(destination: ServiceDetailView(service: service)) {
                                EmptyView()
                            }
                            .opacity(0)
                            VStack(alignment: .leading, spacing: 6) {
                                HStack(alignment: .top) {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(service.title)
                                            .bold()
                                            .foregroundColor(.primary)
                                        Text(service.customerName)
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                        Text(service.description)
                                            .font(.footnote)
                                            .foregroundColor(.secondary)
                                    }
                                    Spacer()
                                    Circle()
                                        .fill(ServiceUIHelper.statusColor(service.status))
                                        .frame(width: 8, height: 8)
                                        .padding(.top, 2)
                                }
                                HStack {
                                    HStack(spacing: 6) {
                                        RoundedRectangle(cornerRadius: 3)
                                            .fill(ServiceUIHelper.statusColor(service.status))
                                            .frame(width: 12, height: 12)

                                        Text(service.status.rawValue)
                                            .font(.caption)
                                            .foregroundColor(.primary)
                                    }
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 4)
                                    .background(ServiceUIHelper.statusBackground(service.status))
                                    .cornerRadius(10)
                                    Spacer()
                                    Text(ServiceUIHelper.formatDate(service.scheduledDate))
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                            }
                            .padding(12)
                            .background(RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                                    .background(Color.white.cornerRadius(12)))
                        }
                        .listRowInsets(EdgeInsets(top: 6, leading: 10, bottom: 6, trailing: 10))
                        .listRowBackground(Color.clear)
                    }
                    .listRowSeparator(.hidden)
                }
                .listStyle(PlainListStyle())
                .refreshable {
                    viewModel.fetchServices()
                }
            }
            .navigationTitle("Services")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
