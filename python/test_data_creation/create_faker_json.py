from json import dumps
from faker import Faker
from faker.providers import internet
from faker.providers import credit_card
from faker.providers import address
import collections
import json


def fake_person_generator(occurances, fake):
    for x in range(occurances):
        yield {'last_name': fake.last_name(),
               'first_name': fake.first_name(),
               'address': fake.address(),
               'credit_card_provider': fake.credit_card_provider(),
               'credit_card_number': fake.credit_card_number(),
               'credit_card_security_code': fake.credit_card_security_code(),
               'credit_card_expire': fake.credit_card_expire(),
               'ipv4_private': fake.ipv4_private(),
               'email': fake.email(),
               'index': x}


database = []
filename = 'snowflake_test_data'
occurances = 1000
fake = Faker('en_US')
fake.add_provider(internet)
fpg = fake_person_generator(occurances, fake)
i = 0
with open(mode='w',
          file='%s.json' % filename
          ) as output:
    # to make json file valid according to JSON format
    # output.write('{"objects":[')
    # output.write('[')
    for person in fpg:
        i += 1
        # output.write('[')
        json.dump(person, output)
        # output.write(']')
        # if i != occurances:
        # output.write(',')
        output.write('\n')

    # output.write(']}')  # to make json file valid according to JSON format
    # output.write(']')  # to make json file valid according to JSON format
print("Done.")
