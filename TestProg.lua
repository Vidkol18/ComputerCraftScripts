p = peripheral.wrap('top')
directory ="methods/"
if fs.isDir(directory) then fs.delete(directory) end
fs.makeDir(directory)

function getMethods()
    local file = peripheral.getType(p)
    local h = fs.open(file, "w")
    h.writeLine("--Methods:")

    for k, v in pairs(p.getDocs()) do
        --print (k, v)
        h.writeLine(k .. ' || ' .. v)
    end

    h.writeLine()
    h.writeLine()
    h.writeLine("---End Of File---")
    h.close()
    fs.move(file,directory..file)
end
--getMethods()



function dump(o)
    if type(o) == 'table' then
        local s = '{ '
        for k,v in pairs(o) do
            if type(k) ~= 'number' then k = '"'..k..'"' end
            s = s .. '['..k..'] = ' .. dump(v) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
end

print(dump(p.getItem(1)))







