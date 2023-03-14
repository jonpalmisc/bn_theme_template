#!/usr/bin/env python3

import re
import sys

if len(sys.argv) != 3:
    print(f"usage: {sys.argv[0]} <json> <css>")

json_path, css_path = sys.argv[1:]
with open(json_path, "r") as f:
    json = f.read()
with open(css_path, "r") as f:
    css = f.read()

css = re.sub("\\s+", " ", css)
css = css.strip()

json = json.replace("<STYLE_CSS>", css)

print(json)
