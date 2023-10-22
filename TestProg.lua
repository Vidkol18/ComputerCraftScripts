p = peripheral.wrap('top')
function getMethods()
    for k, v in pairs(p) do
        print (k, v)
        read()
    end
end
getMethods()