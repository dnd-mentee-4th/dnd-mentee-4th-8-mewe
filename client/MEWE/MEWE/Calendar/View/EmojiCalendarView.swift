//
//  CalendarView.swift
//  MEWE
//
//  Created by 1v1 on 2021/01/26.
//

import SwiftUI
import FSCalendar

class EmojiCalendar: UIViewController, FSCalendarDelegate{
    var calendar = FSCalendar()

    override func viewDidLoad() {
        super.viewDidLoad()
        calendar.delegate = self
        calendar.appearance.titleDefaultColor = .black
        calendar.appearance.titleWeekendColor = .black
        calendar.appearance.headerTitleColor = .black
        calendar.appearance.weekdayTextColor = .black
        calendar.appearance.caseOptions = FSCalendarCaseOptions.weekdayUsesSingleUpperCase
        calendar.appearance.headerMinimumDissolvedAlpha = 0.0
        calendar.backgroundColor = UIColor.white.withAlphaComponent(0)
        calendar.today = nil
//        calendar.appearance.eventDefaultColor = .gray
//        calendar.appearance.eventSelectionColor = .gray

    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        calendar.frame = CGRect(x: 0, y: 100, width: view.frame.size.width, height: view.frame.size.width)
        view.addSubview(calendar)
    }
}

extension EmojiCalendar {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        calendar.scope = .week
    }
    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        calendar.scope = .month
    }

    
}

struct CalendarView: View {
    var calendarController = EmojiCalendarController()
    //var backStyle = backButtonStyle()
    var body: some View {
        VStack{
            HStack {
                Button(action: {
                    calendarController.showMonthMode()
                    
                }) {
                    Image("Calendar_BackButton")
                }.padding()
                .buttonStyle(backButtonStyle(isWeekMode: calendarController.isWeekMode()))
                Spacer()
            }
            calendarController
            
            //Details
            Text("details..")

        }
    }
}
struct backButtonStyle: PrimitiveButtonStyle {
    var isWeekMode: Bool
    func makeBody(configuration: Configuration) -> some View {
        MyButton(configuration: configuration)
    }
    struct MyButton: View {
        let configuration: PrimitiveButtonStyle.Configuration
        var body: some View {
            return configuration.label
                .opacity(1)
        }
    }
}


struct EmojiCalendarController: UIViewControllerRepresentable {
    var calendar = EmojiCalendar()

    func makeUIViewController(context: UIViewControllerRepresentableContext<EmojiCalendarController>) -> EmojiCalendar {
        return calendar
    }

    func updateUIViewController(_ uiViewController: EmojiCalendar, context: UIViewControllerRepresentableContext<EmojiCalendarController>) {
    }

    func showMonthMode() {
        calendar.calendar.scope = .month
    }
    
    func isWeekMode() -> Bool {
        if calendar.calendar.scope == .week {
            return true
        } else {
            return false
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
