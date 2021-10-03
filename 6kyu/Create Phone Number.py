"""All tasks come from www.codewars.com"""

"""Write a function that accepts an array of 10
integers (between 0 and 9), that returns a string
of those numbers in the form of a phone number.

Example
create_phone_number([1, 2, 3, 4, 5, 6, 7, 8, 9, 0]) # => returns "(123) 456-7890"
The returned format must be correct in order to complete this challenge.
Don't forget the space after the closing parentheses!
"""


def create_phone_number(arr):
    phone_numbers = ''
    for num in arr:
        phone_numbers += str(num)
    return f"({phone_numbers[0:3]}) {phone_numbers[3:6]}-{phone_numbers[6:11]}"


def create_phone_number(n):
    return "({}{}{}) {}{}{}-{}{}{}{}".format(*n)
