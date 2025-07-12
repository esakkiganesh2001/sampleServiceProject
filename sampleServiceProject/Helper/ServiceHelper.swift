//
//  ServiceUIHelper.swift
//  sampleServiceProject
//
//  Created by Esakki Ganesh iOS on 12/07/25.
//

import SwiftUI
import ServicesSampleData

struct ServiceUIHelper {
    
    static func formatDate(_ isoDate: String) -> String {
        let formatter = ISO8601DateFormatter()
        guard let date = formatter.date(from: isoDate) else { return "Invalid Date" }
        let calendar = Calendar.current
        if calendar.isDateInToday(date) {
            return "Today, \(formatTime(date))"
        } else if calendar.isDateInTomorrow(date) {
            return "Tomorrow, \(formatTime(date))"
        } else if calendar.isDateInYesterday(date) {
            return "Yesterday, \(formatTime(date))"
        } else {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy, h:mm a"
            return dateFormatter.string(from: date)
        }
    }
    
    static func formatTime(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        return formatter.string(from: date)
    }
    
    static func statusColor(_ status: ServiceStatus) -> Color {
        switch status {
        case .active: return .blue
        case .scheduled: return .green
        case .completed: return .gray
        case .inProgress: return .yellow
        case .urgent: return .red
        }
    }
    
    static func statusBackground(_ status: ServiceStatus) -> Color {
        switch status {
        case .active: return .blue.opacity(0.2)
        case .scheduled: return .green.opacity(0.2)
        case .completed: return .gray.opacity(0.3)
        case .inProgress: return .yellow.opacity(0.3)
        case .urgent: return .red.opacity(0.3)
        }
    }
}
