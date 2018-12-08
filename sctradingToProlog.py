import csv,sys,time,math

def slug(x): return x[0].lower() + x[1:].replace(" ", "") 

counter = 0
places = []
prices = {}
for row in csv.reader(iter(sys.stdin.readline, '')):
  if counter == 0:
    places = [slug(x)  for x in row if len(x) > 0]
  elif counter == 1 :
    pass
  else:
    good = slug(row[0])
    rpri = row[1:]
    for idx in range(len(rpri)):
      place = places[math.floor(idx / 2)]
      action = "buy" if idx % 2 == 0 else "sell"
      if place not in prices: prices[place] = {}
      if good not in prices[place]: prices[place][good] = {}
      prices[place][good][action] = float(rpri[idx].replace(",", ".")) if len(rpri[idx]) > 0 else 0

  counter += 1

for place, v1 in prices.items():
  print("% "+place)
  for good, v2 in v1.items():
    for action, price in v2.items():
      if price == 0: continue
      print(action + "(" + place + ", " + good + ", " + str(price) + ")")
  print("")
