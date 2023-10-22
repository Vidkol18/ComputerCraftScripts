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
        --h.writeLine(k, v)
        h.writeLine(v)
    end
    h.writeLine()
    h.writeLine()
    h.writeLine("---End Of File---")
    h.close()
    fs.move(file,directory..file)
end
getMethods()






