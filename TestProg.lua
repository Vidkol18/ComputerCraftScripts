p = peripheral.wrap('top')
function getMethods()
    for k, v in pairs(p.getDocs()) do
        print (k, v)
        read()
    end
end
--getMethods()

for k, v in pairs(p.getItem(1)) do
    print (k, v)
    read()
end

--print(p.getItem(1))



