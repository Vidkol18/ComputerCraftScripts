p = peripheral.wrap('top')
directory ="methods/"
if fs.isDir(directory) then fs.delete(directory) end
fs.makeDir(directory)

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
    h.writeLine("--Metadata:")
    for k, v in pairs(p.getMetadata()) do
        print (k, v)
        h.writeLine(k .. ' || ' .. dump(v))
    end
    --h.writeLine(dump(p.getMetadata()))

    h.writeLine()
    h.writeLine()
    h.writeLine("--getItem:")
    for i = 1, 6 do
        --for k, v in ipairs(p.getItem(i)) do
        print(p.getItem(i))
        read();
            --print (k, v)
            --h.writeLine(k .. ' || ' ..dump(v))
       -- end
    end

    h.writeLine()
    h.writeLine()
    h.writeLine("---End Of File---")
    h.close()
    fs.move(file,directory..file)
end
getMethods()





print(dump(p.getItemMeta(2)))