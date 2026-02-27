#!/usr/bin/env python3
"""
Usage:
  multiline.py "full command with quotes preserved"
  echo 'full command' | multiline.py
Notes:
  - If you pass the command as a single quoted string it preserves inner quoting.
  - If you pass many argv pieces (e.g. multiline.py foo bar baz) quoting is lost;
    prefer calling with a single string: multiline.py "foo 'arg with space' -o out"
"""
import shlex
import sys

# get input string: prefer a single argument (preserves quoting), else read stdin
if len(sys.argv) == 2:
    s = sys.argv[1]
else:
    s = sys.stdin.read().strip()
    if not s:
        # fallback: join argv pieces (best-effort)
        s = " ".join(sys.argv[1:])

tokens = shlex.split(s)
if not tokens:
    sys.exit(0)

# build lines: keep first two tokens (command + first positional) on first line if present
lines = []
if len(tokens) == 1:
    lines = [shlex.join(tokens)]
else:
    first_line = [tokens[0]]
    if len(tokens) >= 2:
        first_line.append(tokens[1])
    lines.append(shlex.join(first_line))

    # remaining tokens each on their own line
    for tok in tokens[2:]:
        lines.append(shlex.quote(tok))

# print with backslashes between lines
for i, ln in enumerate(lines):
    end = " \\" if i < len(lines) - 1 else ""
    # indent continuation lines for readability
    if i == 0:
        print(f"{ln}{end}")
    else:
        print(f"  {ln}{end}")

