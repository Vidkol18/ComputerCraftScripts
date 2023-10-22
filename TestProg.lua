p = peripheral.wrap('top')
function getMethods()
    for k, v in pairs(p.getItem()) do
        print (k, v)
        read()
    end
end
getMethods()

print(p.getItem(1))



