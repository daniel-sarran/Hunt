import sys
import os
from PySide6.QtCore import QObject, Slot, Signal
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtGui import QGuiApplication
from ui_main_menu import Ui_Dialog
from applications import Applications
from datetime import date


class MainWindow(QObject):
    def __init__(self, cos, apps, comms):
        super(MainWindow, self).__init__()
        self.ui = Ui_Dialog()
        self.ui.setupUi(self)
        self.company = cos
        self.applications = apps
        self.communications = comms

        self.recent_applications = [
            [self.ui.upcoming_app_00, self.ui.upcoming_app_01, self.ui.upcoming_app_02, self.ui.upcoming_app_03],
            [self.ui.upcoming_app_10, self.ui.upcoming_app_11, self.ui.upcoming_app_12, self.ui.upcoming_app_13],
            [self.ui.upcoming_app_20, self.ui.upcoming_app_21, self.ui.upcoming_app_22, self.ui.upcoming_app_23]
        ]
        self.upcoming_activities = [
            [self.ui.upcoming_act_00, self.ui.upcoming_act_01, self.ui.upcoming_act_02],
            [self.ui.upcoming_act_10, self.ui.upcoming_act_11, self.ui.upcoming_act_12],
            [self.ui.upcoming_act_20, self.ui.upcoming_act_21, self.ui.upcoming_act_22]
        ]
        self.load_recent_applications()
        self.load_upcoming_activities()

    def load_recent_applications(self):
        for i, (app_ID, co_ID, app_date, stage, job, desc) in enumerate(self.applications.get_recent_applications()):
            self.recent_applications[i][0].setText(self.iso_to_date(app_date))
            self.recent_applications[i][1].setText(self.company.get_from_id(co_ID)[1])
            self.recent_applications[i][2].setText(job)
            self.recent_applications[i][3].setText(stage)

    def load_upcoming_activities(self):
        for i, (comm_id, app_id, comm_date, interaction, status, notes) in enumerate(
                self.communications.get_upcoming_communications()):
            self.upcoming_activities[i][0].setText(self.iso_to_date(comm_date))
            self.upcoming_activities[i][1].setText(interaction)
            self.upcoming_activities[i][2].setText(notes)

    def iso_to_date(self, iso_date: str) -> str:
        return date.fromisoformat(iso_date).strftime('%B  %-d,  %Y')


if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    # Get Context
    main = MainWindow()
    engine.rootContext().setContextProperty('backend', main)

    # Load QML File
    engine.load(os.path.join(os.path.dirname))

    window = MainWindow()
    window.show()

    sys.exit(app.exec_())
