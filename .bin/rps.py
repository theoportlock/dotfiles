#!/usr/bin/env python3
import random
import time
import os

scoring = [
        [ 0, 1,-1],
        [-1, 0, 1],
        [1 ,-1, 0]]
score = 0

while True:
    os.system('clear')
    inp = input(f"Score:{score}\nRock, paper, scissors (rps): ")
    ans = random.choice("rps")
    score += scoring["rps".find(ans)]["rps".find(inp)]
    time.sleep(1)
