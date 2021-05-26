# This Python file uses the following encoding: utf-8
import sys
import os
import sqlite3
from datetime import date
from PySide6.QtCore import QObject, Slot, Signal
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

from companies import Companies
from applications import Applications
from communications import Communications



class MainWindow(QObject):
    def __init__(self):
        super().__init__()
        self.company = Companies()
        self.applications = Applications()
        self.communications = Communications()
        self.setup()

        self.recent_applications = [[None for i in range(4)] for j in range(3)]
        self.upcoming_activities = [[None for i in range(3)] for j in range(3)]
        self.load_recent_applications()
        self.load_upcoming_activities()

        self.company_details = []

    @Slot(int, int, result=str)
    def get_app_field(self, row, col):
        return self.recent_applications[row][col]

    @Slot(int, int, result=str)
    def get_act_field(self, row, col):
        return self.upcoming_activities[row][col]

    @Slot(str)
    def set_company_details(self, string):
        self.company_details.append(string)

    @Slot(str, result=str)
    def get_company_details(self):
        return self.company_details.pop()

    @Slot(str, result=str)
    def welcome_text(self, name):
        return 'Welcome ' + name

    def load_recent_applications(self):
        for i, (app_ID, co_ID, app_date, stage, job, desc) in enumerate(self.applications.get_recent_applications()):
            self.recent_applications[i][0] = self.iso_to_date(app_date)
            self.recent_applications[i][1] = self.company.get_from_id(co_ID)[1]
            self.recent_applications[i][2] = job
            self.recent_applications[i][3] = stage

    def load_upcoming_activities(self):
        for i, (comm_id, app_id, comm_date, interaction, status, notes) in enumerate(
                self.communications.get_upcoming_communications()):
            self.upcoming_activities[i][0] = self.iso_to_date(comm_date)
            self.upcoming_activities[i][1] = interaction
            self.upcoming_activities[i][2] = notes

    def iso_to_date(self, iso_date: str) -> str:
        return date.fromisoformat(iso_date).strftime('%B  %-d,  %Y')

    def setup(self):
        # Define connection and cursor
        connection = sqlite3.connect('jobs.db')
        cursor = connection.cursor()

        # Create companies' table
        cursor.execute("""CREATE TABLE IF NOT EXISTS companies (
                        company_ID INTEGER PRIMARY KEY,
                        company_name TEXT UNIQUE,
                        sector TEXT,
                        co_desc TEXT
                        )""")
        connection.commit()

        cursor.execute("""CREATE TABLE IF NOT EXISTS applications (
                        application_ID INTEGER PRIMARY KEY,
                        company_ID INTEGER,
                        application_date TEXT,
                        stage TEXT,
                        job_title TEXT,
                        job_desc TEXT,
                        FOREIGN KEY(company_ID) REFERENCES companies(company_ID)
                        )""")
        connection.commit()

        cursor.execute("""CREATE TABLE IF NOT EXISTS communications (
                        communication_ID INTEGER PRIMARY KEY,
                        application_ID INTEGER,
                        communication_date TEXT,
                        interaction TEXT,
                        status TEXT,
                        notes TEXT,
                        FOREIGN KEY(application_ID) REFERENCES applications(application_ID)
                        )""")
        connection.commit()
        connection.close()

    def display_all(code):
        tables = {
            0: 'companies',
            1: 'applications',
            2: 'communications'
        }
        connection = sqlite3.connect('jobs.db')
        cursor = connection.cursor()
        results = cursor.execute(f'SELECT * FROM {tables[code]}')
        for entry in results:
            print(entry)
        cursor.close()
        connection.close()


if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    # Get Context
    main = MainWindow()

    # Load QML File
    context = engine.rootContext()
    context.setContextProperty("backend", main)
    engine.load(os.path.join(os.path.dirname(__file__), "qml/main.qml"))

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
