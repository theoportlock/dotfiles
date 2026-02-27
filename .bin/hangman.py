#!/usr/bin/env python3
import random
import os

word_file = "/usr/share/dict/cracklib-small"
WORDS = open(word_file).read().splitlines()
word = random.choice(WORDS).lower()
curr_word = "_" * len(word)
guesses = 10
letters_used = []
while True:
    os.system('clear')
    if guesses > 0:
        print(f"{curr_word}\nLetters used = {letters_used}\nGuesses remaining = {guesses}")
        guess = input("Guess letter: ")[0].lower()
        if guess in word:
            while word.find(guess) != -1:
                lst_curr_word, lst_word = list(curr_word), list(word)
                lst_curr_word[word.find(guess)] = guess
                lst_word[word.find(guess)] = "_"
                curr_word, word  = "".join(lst_curr_word), "".join(lst_word)
        else:
            if guess not in letters_used:
                letters_used.append(guess)
                guesses -= 1
    else:
        print(f"You lose!, the word was\n{word}\n{curr_word}")
        quit()
    if curr_word.find("_") == -1:
        print("You win!")
        quit()
