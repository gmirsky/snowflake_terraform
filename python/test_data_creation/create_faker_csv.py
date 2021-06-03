import csv
import random
from time import time
from decimal import Decimal
from faker import Faker

RECORD_COUNT = 100000
FILE_PATH_AND_NAME = './invoices_5.csv'
fake = Faker('en_US')


def create_csv_file():
    with open(
        mode='w',
        file=FILE_PATH_AND_NAME,
        newline=''
    ) as csvfile:
        fieldnames = [
            'first_name',
            'last_name',
            'email',
            'product_id',
            'qty',
            'amount',
            'description',
            'country_code'
        ]
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)

        writer.writeheader()
        for _ in range(RECORD_COUNT):
            writer.writerow(
                {
                    'first_name': fake.first_name(),
                    'last_name': fake.last_name(),
                    'email': fake.email(),
                    'product_id': fake.random_int(min=100, max=999),
                    'qty': fake.random_int(min=1, max=99),
                    'amount': float(Decimal(random.randrange(500, 10000))/100),
                    'description': fake.sentence(nb_words=5),
                    'country_code': fake.country_code(representation='alpha-3')
                }
            )


def get_totals():
    qty_total = 0
    amount_total = 0
    with open(FILE_PATH_AND_NAME, 'r', newline='') as csvfile:
        reader = csv.reader(csvfile, delimiter=',')
        for row in reader:
            if row[4] != 'qty':
                qty = int(row[4])
                qty_total += qty

                amount = float(row[5])
                amount_total += amount
    return qty_total, amount_total


if __name__ == '__main__':
    start = time()
    create_csv_file()
    print('file created')
    elapsed = time() - start
    print('created csv file time: {}'.format(elapsed))

    start = time()
    qty_total, amount_total = get_totals()
    elapsed = time() - start
    print('got totals time: {}'.format(elapsed))

    print('qty: {}'.format(qty_total))
    print('amount: {}'.format(amount_total))
