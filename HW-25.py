from typing import List

words: List[str] = ["apple", "banana", "cherry", "dragonfruit"]

def find_longest_word(arg: List[str]) -> str:
    word_longest = ""
    for word in arg:
        count = len(word)
        if count > len(word_longest):
            word_longest = word
        else: continue
    return (word_longest)



print("longest word: ",find_longest_word(words))