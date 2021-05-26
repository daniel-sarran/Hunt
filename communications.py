#!/usr/bin/env python

"""communication.py: Creates a single communication (email, call, etc)."""

import sqlite3


class Communications():
    """

    """

    def __init__(self):
        """

        """
        self._interaction_type = {
            0: 'Call',
            1: 'Email',
            2: 'Meeting'
        }
        self._status_type = {
            0: 'Scheduled',
            1: 'Done'
        }

    def create(self, application_id, date, interaction, status, notes='') -> None:
        """

        :param application_id:
        :param date:
        :param interaction:
        :param status:
        :param notes:
        :return:
        """
        connection = sqlite3.connect('jobs.db')
        with connection:
            cursor = connection.cursor()
            cursor.execute(
                'INSERT INTO communications VALUES (:ID, :application_ID, :date, :interaction, :status, :notes)',
                {
                    'ID': None,
                    'application_ID': application_id,
                    'date': date,
                    'interaction': self._interaction_type[interaction],
                    'status': self._status_type[status],
                    'notes': notes
                }
            )

    def delete(self, communication_id: int) -> None:
        """

        :param communication_id:
        :return:
        """
        connection = sqlite3.connect('jobs.db')
        with connection:
            cursor = connection.cursor()
            cursor.execute('DELETE FROM communications WHERE communication_ID=:ID', {'ID': communication_id})
            cursor.close()

    def search_by_date(self, date: str) -> list:
        """

        :param date:
        :return:
        """
        connection = sqlite3.connect('jobs.db')
        cursor = connection.cursor()
        cursor.execute('SELECT * FROM communications WHERE communication_date=:date', {'date': date})
        results = cursor.fetchall()
        cursor.close()
        connection.close()
        return results

    def get_upcoming_communications(self):
        connection = sqlite3.connect('jobs.db')
        cursor = connection.cursor()
        cursor.execute("""
                        SELECT * FROM communications
                        WHERE status='Scheduled'
                        ORDER BY communication_date DESC
                        LIMIT 3
                        """)
        results = cursor.fetchall()
        cursor.close()
        connection.close()
        return results
#     def _get_date(self):
#         return self._date
#
#     def set_interaction_type(self, interaction):
#         """Sets interaction to 'Call', 'Email', or 'Meeting'."""
#         self._interaction_type = interaction
#
#     def get_interaction_type(self):
#         return self._interaction_type
#
#     def set_notes(self, notes):
#         """Set notes from communication."""
#         self._notes = notes
#
#     def get_notes(self):
#         """Returns notes from communication."""
#         note_lines = textwrap.wrap(self._notes)
#         return note_lines
#
#     def set_status(self, status):
#         """Set status to 'Done', 'In Progress', 'Cancelled' or 'Failed'."""
#         self._status = status
#
#     def get_status(self):
#         return self._status
#
#
# if __name__ == '__main__':
#     comm = Communications((2020, 12, 20), 0, 0, 'You are invited to Online Assessment!')
#     print(comm)
#     comm2 = Communications((2020, 12, 21), 0, 0, 'Recruiter: focus on problem solving process over working code')
#     print(comm2)
#     print(comm < comm2)
