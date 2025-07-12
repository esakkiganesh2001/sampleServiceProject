//
//  ServiceDetailView.swift
//  sampleServiceProject
//
//  Created by Esakki Ganesh iOS on 12/07/25.
//

import ServicesSampleData
import SwiftUI
import Combine
import MapKit

struct ServiceDetailView: View {
    let service: Service

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                Map(coordinateRegion: .constant(MKCoordinateRegion(
                    center: CLLocationCoordinate2D(latitude: 47.6097, longitude: -122.3331),
                    span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                )), annotationItems: [service]) { _ in
                    MapMarker(coordinate: CLLocationCoordinate2D(latitude: 47.6097, longitude: -122.3331), tint: .blue)
                }
                .frame(height: 200)
                .cornerRadius(15)
                .padding(.horizontal)
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Text(service.title)
                            .font(.title2.bold())
                        Spacer()
                        HStack(spacing: 6) {
                            RoundedRectangle(cornerRadius: 3)
                                .fill(ServiceUIHelper.statusColor(service.status))
                                .frame(width: 12, height: 12)
                            Text(service.status.rawValue)
                                .font(.caption)
                                .foregroundColor(.primary)
                        }
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(ServiceUIHelper.statusBackground(service.status))
                        .cornerRadius(10)
                    }
                    LabelledText(icon: "person", title: "Customer", value: service.customerName)
                    LabelledText(icon: "docIcon", title: "Description", value: service.description)
                    LabelledText(icon: "clock", title: "Scheduled Time", value: ServiceUIHelper.formatDate(service.scheduledDate))
                    LabelledText(icon: "ellipseIcon", title: "Location", value: service.location)
                    LabelledText(icon: "bubble", title: "Service Notes", value: service.serviceNotes)
                }
                .padding(.horizontal)
            }
            .navigationTitle("Service Detail")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
