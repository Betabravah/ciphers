def ceasar(string, key):
 cipher = ""
 for i in string.upper():
  cipher += chr((ord(i)+key) % 26)
 print (cipher)

ceasar("betty", 7)


def decrypt(string, key):
 cipher = ""
 for i in string:
  cipher += chr(ord(i)-key )
 print (cipher)

decrypt("betty", 5)