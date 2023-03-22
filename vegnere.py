def vigener(string , key_string):
 cipher = ""
 for i in range(len(string)):
  cipher_order = ord(string[i]) + ord(key_string[i%(len(key_string))])
  cipher += chr(cipher_order)
 print (cipher)

vigener("baba" , "hsb")




def decrypt(string , key_string):
 cipher = ""
 for i in range(len(string)):
  cipher_order = ord(string[i]) - ord (key_string[i%(len(key_string))])
  cipher += chr(cipher_order % 0x110000)
 print (cipher)

decrypt ("ÊÔÄÉ" , "hsb")