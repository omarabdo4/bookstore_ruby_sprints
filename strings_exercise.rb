# A Strings Exercise

mytext = "Hello Ruby World"

helloText = "Hello"

helloRemovedText = mytext.sub(helloText,"")

p helloRemovedText

welcomeAddedText = "Weclome" + helloRemovedText

p welcomeAddedText

textwithmyname = welcomeAddedText.sub("World","Omar") 

p textwithmyname

textwithmyquotedname = textwithmyname.sub("Omar","'Omar'")

p textwithmyquotedname

commaAfterRubyText = textwithmyquotedname.sub("Ruby","Ruby,")

p commaAfterRubyText

tabAfterComaText = commaAfterRubyText.sub(",",",  ")

p tabAfterComaText

tabAfterComaTextCount = tabAfterComaText.length

p tabAfterComaTextCount

textSpacesCount = tabAfterComaText.count(" ")

p textSpacesCount

textWithHyphens = tabAfterComaText.sub(" ","-")

p textWithHyphens