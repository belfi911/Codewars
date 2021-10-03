"""All tasks come from www.codewars.com"""

"""Complete the solution so that it splits
the string into pairs of two characters.
If the string contains an odd number of characters
then it should replace the missing second character
of the final pair with an underscore ('_').

Examples:

solution('abc') # should return ['ab', 'c_']
solution('abcdef') # should return ['ab', 'cd', 'ef']
"""
def solution(s):
    list1 = []
    for i in range(len(s)):
        if len(s) %2 !=0:
            s = s + "_"
            print(s)
        if i % 2 == 0:
            list1.append(s[i:i + 2])
    return list1
