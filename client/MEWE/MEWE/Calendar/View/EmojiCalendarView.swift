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
    var body: some View {
        VStack{

            EmojiCalendarController()
            Button(action: {

            }, label: {
                Text("close")
            })

        }


    }
}

struct EmojiCalendarController: UIViewControllerRepresentable {

    func makeUIViewController(context: UIViewControllerRepresentableContext<EmojiCalendarController>) -> EmojiCalendar {
        return EmojiCalendar()
    }

    func updateUIViewController(_ uiViewController: EmojiCalendar, context: UIViewControllerRepresentableContext<EmojiCalendarController>) {
    }

}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
