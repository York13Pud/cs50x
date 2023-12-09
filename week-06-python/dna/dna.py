import csv
from sys import argv, exit


def main():
    # -- Check for command-line usage
    if len(argv) != 3:
        print("Usage: python dna.py data.csv sequence.txt")
        exit(1)
        
    # -- Read database file into a variable
    db = []
    with open(argv[1], "r") as csv_file:
        file_to_dict = csv.DictReader(csv_file)
        for row in file_to_dict:
            db.append(row)

    # -- Read DNA sequence file into a variable
    with open(argv[2], "r") as f:
        seq_file = f.read()
        
    # -- Find longest match of each STR in DNA sequence
    subsequences = list(db[0].keys())[1:]

    results = {}
    
    for subsequence in subsequences:
        results[subsequence] = longest_match(seq_file, subsequence)
    
    # -- Check database for matching profiles
    for person in db:
        matches = 0
        
        # -- Process the results
        for subsequence in subsequences:
            if int(person[subsequence]) == results[subsequence]:
                matches += 1

        # -- Display the name of the person if the results match:
        if matches == len(subsequences):
            print(person["name"])
            return

    # -- If there are no matches, print "No match":
    print("No match")
    
    return


def longest_match(sequence, subsequence):
    """Returns length of longest run of subsequence in sequence."""

    # Initialize variables
    longest_run = 0
    subsequence_length = len(subsequence)
    sequence_length = len(sequence)

    # Check each character in sequence for most consecutive runs of subsequence
    for i in range(sequence_length):

        # Initialize count of consecutive runs
        count = 0

        # Check for a subsequence match in a "substring" (a subset of characters) within sequence
        # If a match, move substring to next potential match in sequence
        # Continue moving substring and checking for matches until out of consecutive matches
        while True:

            # Adjust substring start and end
            start = i + count * subsequence_length
            end = start + subsequence_length

            # If there is a match in the substring
            if sequence[start:end] == subsequence:
                count += 1
            
            # If there is no match in the substring
            else:
                break
        
        # Update most consecutive matches found
        longest_run = max(longest_run, count)

    # After checking for runs at each character in seqeuence, return longest run found
    return longest_run


if __name__ == "__main__":
    main()
