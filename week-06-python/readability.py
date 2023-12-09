from cs50 import get_string


# -- Request input from the user:
text = ""

while text == "":
    text = get_string("Text: ")

# -- Count the number of letters in the text:
text_length = len(text)
remove_chars = 0

for i in [",", " ", "-", "'", '"', ".", "!", "?"]:
    # print(f"Total  : {text.count(i)}")
    remove_chars += text.count(i)

# print(f"text_length: {text_length} -- remove_chars: {remove_chars}")

letters = text_length - remove_chars
# print(f"letters: {letters}")

# -- Count the number of words in the text:
words = len(text.split())
# print(f"words: {words}")

# -- Count the number of sentences in the text:
sentences = 0

for i in ["!", "?", "."]:
    # print(f"Total  : {text.count(i)}")
    sentences += text.count(i)

# print(f"sentences: {sentences}")


# -- Calculate average number of letters & sentences per 100 words of the provided text:
l = float(100 * (letters / words))
s = float(100 * (sentences / words))
# print(f"l: {l} -- s: {s}")


index = int(round(0.0588 * l - 0.296 * s - 15.8, ndigits=0))
# print(f"Index: {index}")
# print((0.0588 * l - 0.296 * s - 15.8))

# -- Display the results:
if index < 1:
    print("Before Grade 1\n")
elif index > 16:
    print("Grade 16+\n")
else:
    print(f"Grade {index}\n")