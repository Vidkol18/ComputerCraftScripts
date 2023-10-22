--[[
getRFStored : function
getEUStored : function
getEnergyCapacity : function
getDocs : function
getItemMeta : function
getEUOutput : function
getEUCapacity : function
drop : function
getEnergyStored : function
size : function
getDemandedEnergy : function
suck : function
getRFCapacity : function
getMetaData : function
pullItems : function
getTransferLocations : function
getSinkTier : function
list : function
getSourceTier : function
getItem : function
pushItem : function
]]--

function getMethods()
    p = peripheral.wrap('top')
    for k, v in pairs(p) do
        print (k, v)
        read()
    end
end
--getMethods()



machine = peripheral.wrap('top')
monitor = peripheral.wrap('bottom')

buffer = {}
function queue(text)
    table.insert(buffer, text)
end

function queuef (format, ...)
    queue(string.format(format, ...))
end

function queue_flush()
    term.clear()
    term.setCursorPos(1, 1)

    print(table.concat(buffer, '\n'))
    buffer = {}
end


--Learn Rednet
rednet.close('bottom') -- just in case close the connection if one is running.
rednet.open('bottom')

senderID, message, distance = rednet.receive()
term.write(senderID .. ': '.. message)

rednet.send(2, 'Hello, World!')
