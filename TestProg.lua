p = peripheral.wrap('top')
function getMethods()
    for k, v in pairs(p.getDocs()) do
        print (k, v)
        read()
    end
end
getMethods()

print(p.getDocs())



