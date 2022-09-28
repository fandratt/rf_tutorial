import csv
from itertools import product

class csvLibrary(object):

    def write_into_csv(self, file_path, headernames, rows_dict):
        '''This creates a keyword named "Write Into CSV"
        This keyword takes arguments:
        file_path = path and csv file name to be created
        headernames = list of header names
        rows_dict = list of dict of the content of the CSV
        '''
        with open(file_path, 'w', encoding='UTF8', newline='') as file:
            writer = csv.DictWriter(file, fieldnames=headernames, quoting=csv.QUOTE_MINIMAL, delimiter=',')
            writer.writeheader()
            writer.writerows(rows_dict)
    
    def test_matrix(self, list_1, list_2):
        '''This creates a keyword named "Test Matrix"
        This keyword takes arguments:
        list_1 = list of column/headers in csv
        list_2 = list of possible data to be used
        '''
        # create empty list to store the combinations
        unique_combinations = []
        # Extract Combination Mapping in two lists
        # using zip() + product()
        unique_combinations = list(list(zip(list_1, element))
        for element in product(list_2, repeat = len(list_1)))
        return unique_combinations