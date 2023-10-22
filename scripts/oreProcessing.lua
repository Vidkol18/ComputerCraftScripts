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

peripheral.find("modem", rednet.close)
peripheral.find("modem", rednet.open)

function getMethods()
    p = peripheral.wrap('top')
    for k, v in pairs(p) do
        print (k, v)
        read()
    end
end
--getMethods()


machine = peripheral.wrap('top')

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
    print('Running ...')

    rednet.send(2, table.concat(buffer, '\n'))
    buffer = {}
end

function getItemFromSlot(slot)
    return machine.getItem(slot)
end

local machineSlot = {
    ore = getItemFromSlot(1) or 'None',
    primarySlurryTank = getItemFromSlot(2) or 'Empty',
    primaryTank = getItemFromSlot(3) or 'Empty',
    secondaryTank = getItemFromSlot(4) or '',
    secondarySlurryTank = getItemFromSlot(7) or '',
}


while true do
    local status, err = pcall(function()
        queue('Crafting Status')
        queue('------------------')
        queue('')
        queuef('Power : %s', machine.getEnergyStored())
        queuef('Limit : %s', machine.getEnergyCapacity())
        queue('')
        queuef('Ore : %s', machineSlot.ore)
        queuef('Acid : %s', machineSlot.primaryTank)

    end)

    if not status then
        buffer = {}
        queue('Error reading data')
        queue('Check connections.')
        queue('------------------')
        queue(err)
    end

    queue_flush()
    os.sleep(1)
end

