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
    local teapot = 1;
        for k, v in pairs(p.getItem(i)) do
            if teapot == 6 then break end
            print (k, v)
            h.writeLine(k .. ' || ' ..dump(v))
            teapot = teapot + 1
        end

    h.writeLine()
    h.writeLine()
    h.writeLine("---End Of File---")
    h.close()
    fs.move(file,directory..file)
end
getMethods()





print(dump(p.getItemMeta(2)))