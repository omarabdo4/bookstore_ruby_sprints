# E.Hashes/iterators and reducers ExerciseA.For the following hash:
Employees = {
    10 => {name:"Ahmed",salary:1000},
    21 => {name:"Mohamed",salary:2000},
    113 => {name:"Mahmoud",salary:5000},
    4 => {name:"Yassin",salary:3000},
    52 => {name:"Taha",salary:4000},
    102 => {name:"Khadija",salary:nil},
    64 => {name:"Sara",salary:5000},
    37 => {name:"Nadine",salary:5000},
    88 => {name:"Doaa",salary:4000},
    90 => {name:"Iman",salary:4000},
    103 => {name:"Khadija",salary:1000},
    12 => {name:"Kholod",salary:nil},
    15 => {name:"Said",salary:nil},
    38 => {name:"Nadine",salary:5000},
    89 => {name:"Doaa",salary:4000},
    91 => {name:"Iman",salary:4000},
    104 => {name:"Khadija",salary:1000},
    17 => {name:"Kholod",salary:nil},
    14 => {name:"Said",salary:nil},
}
# Write a program for each of the following that
# I.Gets all employees name
def empsName(emps)
    result = []

    emps.each do |key, value|
        result.push(value[:name])
    end

    return result
end

p empsName Employees

# II.Gets all employee IDs ex:[10,21,113,...]
def empsIds(emps)
    result = []
    emps.each do |key, value|
        result.push(key)
    end
    return result
end

p empsIds Employees

# III.Gets employees with the highest salary in an array along their IDex::[{name:"Mahmoud",salary:5000,id:113},{name:"Sara",salary:5000,id:64},...]

def sortBySalaryIdInside(emps)
    result = []
    emps.each do |key, value|
        value[:id]= key
        if(value[:salary].nil?)
            value[:salary] = 0
        end
        result.push(value)
    end
    return result.sort_by { |emp| -emp[:salary] }
end

p sortBySalaryIdInside(Employees)

# IV.Gets employees with lowest salary in a hash keeping their IDsEx:{10:{name:"Ahmed",salary:1000},103:{name:"Khadija",salary:1000},....}

def sortAscBySalaryIdOutside(emps)
    result = []
    emps.each do |key, value|
        value[:id]= key
        if(value[:salary].nil?)
            value[:salary] = 0
        end
        result.push(value)
    end
    result.sort_by { |emp| emp[:salary] }
end

p sortAscBySalaryIdOutside(Employees)

# V.Gets average salaries

def averageSalary(emps)
    sum = 0
    count = 0
    emps.each do |key, value|
        if(!value[:salary].nil?)
            sum += value[:salary]
        end
        count += 1
    end
    return sum.to_f/count
end

p averageSalary(Employees)


# VI.Remove employees with nil salary.

def filterAllNils(emps)
    result = []
    emps.each do |key, value|
        value[:id]= key
        if(!value[:salary].nil?)
            result.push(value)
        end
    end
    return result
end

p filterAllNils(Employees)

# VII.Gets hash a new hash with uniq employees (remove duplicate)

def filterDuplicate(emps)
    result = []

    namesFlagsHash = {}
    emps.each do |key, value|

        curName = value[:name]

        if(!namesFlagsHash.has_key?(curName))
            namesFlagsHash[curName] = true
            result.push(value)
        end
    end
    
    return result
end

p filterDuplicate(Employees)

# B.Write a Ruby program to find most occurred item in a given array along the elements frequency:ex:Original

def findMaxOccurred(emps)
    result = []
    maxEmp = nil
    max = -1.0/0.0
    namesFlagsHash = {}
    emps.each do |key, value|

        curName = value[:name]

        if(!namesFlagsHash.has_key?(curName))
            namesFlagsHash[curName] = 1 
            result.push(value)
        else
            namesFlagsHash[curName] += 1
        end

        if(max < namesFlagsHash[curName])
            max = namesFlagsHash[curName]
            maxEmp = value
        end
    end
    
    return namesFlagsHash
end

p findMaxOccurred(Employees)
