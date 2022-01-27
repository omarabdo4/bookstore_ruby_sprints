# A.Write a Ruby program to check three given integers (a:smallest,b,c:largest) 
#and return true if the three values are equally spaced, 
#so the difference between a and b is thesame as the difference between b and c.


def equallySpaced(a,b,c)
    diff1 = a-b
    diff2 = b-c
    return "same" if (diff1).abs == (diff2).abs
    return "diff" if (diff1).abs != (diff2).abs
end

p equallySpaced(1,1,3)

# B.Write a Ruby program to check three given integers 
#a, b, c and return true if one of b or c is close (difference out of a by at most 1)
#, while the other is far, difference from bothother values by 3 or more.

def diff1andLess3orMore(a,b,c)
    diff1 = a-b
    diff2 = b-c
    if(!(diff1.abs > 2)&& !(diff2.abs > 2) )
        return false
    else
        if(!(diff1.abs <= 1) && !(diff2.abs <= 1))
            return false
        else
            return true
        end
    end
end

p diff1andLess3orMore(1,2,7)

# C.Write a Ruby program to check two given integers,
# each in the range 10..99, return true if there is a digit that appears in both numbers.

def checkDigits(fst,sec)
    strFst = fst.to_s
    strSec = sec.to_s
    if(strFst[0] == strSec[0] || strFst[0] == strSec[1])
        return true
    end
    if(strFst[1] == strSec[0] || strFst[1] == strSec[1])
        return true
    end
    return false
end

p checkDigits(91,81)

# D.Write a Ruby program to check two given integers and 
#return true if either one is 11 or their sum or difference is 11 otherwise return false.

def checkEleven(fst,sec)
    if(fst == 11 || sec == 11 || (fst-sec).abs == 11 || (fst+sec) == 11)
        return true
    end
    return false
end

p checkEleven(10,1)

# E.Write a Ruby program to check whether 2 strings start and end with 
#different letters and both of them doesn’t include letter “x”.

def checkEleven(fst,sec)
    if(fst.include?("x") || sec.include?("x"))
        return false
    end
    if(fst[0] == fst[-1])
        return false
    end
    if(sec[0] == sec[-1])
        return false
    end
    return true
end

p checkEleven("sqes","saa")


# F.Write a Ruby program that checks whether a string contains a vowel.

def hasVouel(inputStr)
    inputStr.split("").intersection(["a","e","i","o","u","y"]).size > 0
end

p hasVouel("kkkqqqqe")

# G.Write a Ruby program that keeps getting an integer at the console less 
#than 100 scorefrom the user, and exists when he inserts -1.
#If he inserted a number out of range, print the message :”Please insert a score from 0 to100”.
#Your program shall print out the corresponding evaluation as follows:
# 0-49:fail.
# 50-60:pass
# 60-70:good
# 70-80:very good
# 80-90:excellent
# 90-100:incredible

def scoreRange(score)
    if(score >= 0 || score < 50)
        return "fail"
    end
    if(score >= 50 || score < 60)
        return "pass"
    end
    if(score >= 60 || score < 70)
        return "good"
    end
    if(score >= 70 || score < 80)
        return "very good"
    end
    if(score >= 80 || score < 90)
        return "excellent"
    end
    if(score >= 90 || score <= 100)
        return "incredible"
    end
    return -1
end

p scoreRange(60)
