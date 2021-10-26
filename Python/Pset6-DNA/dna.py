import csv
from sys import argv

def main():
    if len(argv) != 3:
        print("Usage: python dna.py data.csv sequence.txt")

    with open(argv[1], 'r') as csvfile:
        csv_columns = csvfile.readline().strip('\n').split(',')

    with open(argv[2], 'r') as textfile:
        sequence = textfile.read()

    STR_repeats = []  # Records the number of consecutive repeats for each STR in DNA analyzed
    for i in range(1, len(csv_columns)):
        STR_repeats.append(max_repeats(csv_columns[i], sequence))

    with open(argv[1], 'r') as csvfile:
        database = csv.DictReader(csvfile)
        for line in database:
            for i in range(1, len(csv_columns), 1):
                if int(line[f"{csv_columns[i]}"]) == STR_repeats[i - 1]:
                    person = line['name']
                else:
                    person = ""
                    break
            if person != "":
                break

    if person == "":
        print("No match")
    else:
        print(person)


def max_repeats(STR, sequence):
    count0 = 0
    count = 0
    index = sequence.find(STR)
    if index != -1:
        while index != -1:
            count0 += 1
            index += len(STR)
            while sequence[index : index + len(STR)] == STR:
                count0 += 1
                index += len(STR)
            if count0 > count:
                count = count0
            count0 = 0
            index = sequence.find(STR, index)
        return count
    else:
        return count

main()