echo "Hell World!"
import strutils
import tables

let f = open("aoc1.txt", fmRead)


proc reversed*[T](a: openArray[T], first, last: int): seq[T] =
  result = newSeq[T](last - first + 1)
  var x = first
  var y = last
  while x <= last:
    result[x] = a[y]
    dec(y)
    inc(x)

proc reversed*[T](a: openArray[T]): seq[T] =
  reversed(a, 0, a.high)

const str_to_nums: Table[string, char] = {
    "one": '1',
    "two": '2',
    "three": '3',
    "four": '4',
    "five": '5',
    "six": '6',
    "seven": '7',
    "eight": '8',
    "nine": '9',
}.toTable

proc isKeyContained(key: string, str: string): bool =
  return key in str


var sum = 0
for line in f.lines():
    var first: char = ' '
    var first_potential_str: string = ""
    for c in line.items:
        if c.isDigit():
            first = c
            break
        else:
            first_potential_str &= c
        for key in str_to_nums.keys:
            if isKeyContained(key, first_potential_str):
                first = str_to_nums[key]
                break
        if first != ' ':
            break
        

    var last: char = ' '
    var last_potential_str: string = ""
    for c in line.reversed().items:
        if c.isDigit():
            last = c
            break
        else:
            last_potential_str = c & last_potential_str
        for key in str_to_nums.keys:
            if isKeyContained(key, last_potential_str):
                last = str_to_nums[key]
                break
        if last != ' ':
            break
    echo line
    let n_str: string = first & last
    let n_int: int = n_str.parseInt()
    sum += n_int

echo sum
    

