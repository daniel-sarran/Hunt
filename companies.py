#!/usr/bin/env python

import sqlite3


class Companies:

    def create(self, name: str, sector: str = '', description: str = '') -> None:
        connection = sqlite3.connect('jobs.db')
        with connection:
            cursor = connection.cursor()
            cursor.execute('INSERT INTO companies VALUES (:ID, :name, :sector, :description)',
                           {'ID': None, 'name': name, 'sector': sector, 'description': description})
            cursor.close()

    # works
    def delete(self, company_id: str) -> None:
        connection = sqlite3.connect('jobs.db')
        with connection:
            cursor = connection.cursor()
            cursor.execute('DELETE FROM companies WHERE company_ID=:ID', {'ID': company_id})
            cursor.close()

    # works
    def search_by_name(self, company_name: str) -> list:
        connection = sqlite3.connect('jobs.db')
        cursor = connection.cursor()
        cursor.execute(f'SELECT * FROM companies WHERE company_name=:name', {'name': company_name})
        results = cursor.fetchall()
        cursor.close()
        connection.close()
        return results

    def get_from_id(self, id):
        connection = sqlite3.connect('jobs.db')
        cursor = connection.cursor()
        cursor.execute(f'SELECT * FROM companies WHERE company_id=:id', {'id': id})
        company = cursor.fetchone()
        cursor.close()
        connection.close()
        return company

    # works
    def __len__(self):
        connection = sqlite3.connect('jobs.db')
        cursor = connection.cursor()
        companies = cursor.execute('SELECT * FROM companies')
        cursor.close()
        connection.close()
        return companies

    # def __init__(self, name, sector='', description=''):
    #     """Initializes a Company object."""
    #     self._name = name
    #     self._description = description
    #     self._sector = sector
    #     # self._applications = SortedList([])
    #
    # def __repr__(self):
    #     return f'<Company object: {self._name}>'
    #
    # def __str__(self):
    #     return f'{self._name}'
    #
    # def set_name(self, name):
    #     """Sets company name."""
    #     self._name = name
    #
    # def get_name(self):
    #     """Returns company name"""
    #     return self._name
    #
    # def set_sector(self, sector):
    #     """Sets user industry."""
    #     self._sector = sector
    #
    # def get_sector(self):
    #     """Returns company industry."""
    #     return self._sector
    #
    # def set_description(self, description):
    #     """Change company description."""
    #     self._description = description
    #
    # def get_description(self):
    #     """Returns company description."""
    #     return self._description
    #
    # def get_applications(self):
    #     return self._applications
    #
    # def add_application(self, application: object):
    #     self._applications.add(application)
    #
    # # TODO: remove application from company, from database, decrement application count
    # def remove_application(self, application: object):
    #     pass

# if __name__ == '__main__':
#     data = Data()
#     company = 'SalesForce'
#     data.add_co(Company(company, 'Really sweet CRMs, ticker CRM'))
#     data.display_companies()
