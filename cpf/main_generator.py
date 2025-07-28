import tenjin
from tenjin.helpers import *

import sys
print(sys.argv[1:])
input=sys.argv[1]
outputfile=sys.argv[2]
# Initialize Tenjin engine
engine = tenjin.Engine()

# Context with the variable replacement
context = {
    'number': 42,
    'string' : 'Hello, C++!'
}

# Render the template with the context
output = engine.render(input, context)

print(f"generating {outputfile}")

# Write to a .cpp file
with open(outputfile, 'w') as f:
    f.write(output)

print("C++ file generated successfully.")