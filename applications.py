#!/usr/bin/env python

"""applications.py: Represents one application opportunity, and its basic information."""

# from communications import Communications
import sqlite3


# TODO: stage change should monitor date of stage change

class Applications():
    """Creates an application object representing a single job application to an employer."""

    def __init__(self):
        self._stages = {
            0: 'Applied',
            1: 'Online Assessment',
            2: 'Phone Screen',
            3: 'Interview',
            4: 'Offer',
            5: 'Rejection'
        }

    def create(self, company_id, date, stage, job, description='') -> None:
        """
        
        :param company_id:
        :param date:
        :param stage:
        :param job:
        :param description:
        :return:
        """
        connection = sqlite3.connect('jobs.db')
        with connection:
            cursor = connection.cursor()
            cursor.execute(
                'INSERT INTO applications VALUES (:ID, :company_ID, :date, :stage, :job, :description)',
                {
                    'ID': None,
                    'company_ID': company_id,
                    'date': date,
                    'stage': self._stages[stage],
                    'job': job,
                    'description': description
                }
            )

    def delete(self, application_id: str) -> None:
        connection = sqlite3.connect('jobs.db')
        with connection:
            cursor = connection.cursor()
            cursor.execute('DELETE FROM applications WHERE application_ID=:ID', {'ID': application_id})
            cursor.close()

    def search_by_date(self, date: str) -> list:
        connection = sqlite3.connect('jobs.db')
        cursor = connection.cursor()
        cursor.execute('SELECT * FROM applications WHERE application_date=:date', {'date': date})
        results = cursor.fetchall()
        cursor.close()
        connection.close()
        return results

    def __len__(self) -> int:
        connection = sqlite3.connect('jobs.db')
        cursor = connection.cursor()
        cursor.execute('SELECT application_ID FROM applications')
        results = cursor.fetchall()
        total = len(results)
        cursor.close()
        connection.close()
        return total

    def get_recent_applications(self):
        connection = sqlite3.connect('jobs.db')
        cursor = connection.cursor()
        cursor.execute("""SELECT * FROM applications
                        ORDER BY app_date DESC
                        LIMIT 3""")
        results = cursor.fetchall()
        cursor.close()
        connection.close()
        return results

    # def get(self, name: str) -> tuple:
    #     connection = sqlite3.connect('jobs.db')
    #     cursor = connection.cursor()
    #     cursor.execute(f'SELECT * FROM applications WHERE company=:name AND date=:date AND job=:job', (name.title(),))
    #     company = cursor.fetchone()
    #     cursor.close()
    #     connection.close()
    #     return company

#     def get_job(self):
#         return self._job
#
#     def set_job(self, job):
#         self._job = job
#
#     def get_job_description(self):
#         return self._job_description
#
#     def set_job_description(self, description):
#         self._job_description = description
#
#     def get_company(self):
#         return self._obj_company
#
#     def set_stage(self, stage):
#         if stage in self._stages:
#             self._stage = self._stages[stage]
#         else:
#             raise ValueError(f'Stages are: {self._stages}')
#
#     def advance_stage(self):
#         if self._stage in [0, 1, 2]:
#             self._stage += 1
#         elif self._stage == 3:
#             self._stage = 5
#         else:
#             return
#
#     def get_stage(self):
#         return self._stage
#
#     def add_activity(self, comm):
#         self._activities.add(comm)
#
#     def remove_activity(self, comm):
#         self._activities.remove(comm)
#
#     def get_activities(self):
#         return self._activities
#
#
# def display_total_applications():
#     print(f'Total Applications: {Applications.count}')
#
#
# if __name__ == '__main__':
#     app = Applications((2020, 12, 20), 'Apple', 'SWE',
#                       'Entry level -- required: 15+ yrs C++ and PhD in Computer Science')
#     print(app)
#     display_total_applications()
#     app1 = Applications((2020, 12, 22), 'Google', 'SWE',
#                        'Entry level -- required: 15+ yrs C++ and PhD in Computer Science')
#     print(app1)
#     display_total_applications()
#     comm1 = Communications((2020, 12, 20), 'Email', 'Invited to Online Assessment', 'Done')
#     app1.add_activity(comm1)
#     comm2 = Communications((2020, 12, 25), 'Meeting', 'Passed OA, awaiting interview per recruiter', 'Done')
#     app1.add_activity(comm2)
#     print(app1)
#     app1.set_stage(0)
