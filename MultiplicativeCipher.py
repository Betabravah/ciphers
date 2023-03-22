def multiplicativeCipher(string, key):
    cipherNumber = ""
    cipherText = ""
    convertor= {"a" : 0, "b" : 1, "c" : 2, "d": 3, "e": 4, "f": 5 ,"g" : 6, "h" : 7, "i" : 8, "j" : 9, "k" : 10, "l" : 11, "m" : 12, "n" : 13, "o" : 14, "p" : 15, "q" : 16, "r" : 17, "s" : 18, "t" : 19, "u" : 20, "v" : 21, "w" : 22, "x" : 23, "y" : 24, "z" : 25}
    plainText = string.lower()
    for i in plainText:
        cipherNumber += str((convertor[i] * 5) % 26)
    for i in cipherNumber:
        cipherText += list(convertor.keys())[list(convertor.values()[i])]
    return cipherText

print(multiplicativeCipher("abc", 5))