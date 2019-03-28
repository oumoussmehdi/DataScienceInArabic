import sys

lines = []
for line in sys.stdin:
	lines.append(line.rstrip('\n'))

pos = lines[0]
for l in lines[1:]:
    pos += (l[0] - l[1])

if pos <= 100:
    sys.stdout.write(1000)
elif pos < 10000:
    sys.stdout.write(100)
else :
    sys.stdout.write('KO')