-- getRFStored || function([side:string]):int -- The amount of RF currently stored
-- getOfferedEnergy || function():number -- EU output provided per tick
-- getEUStored || function():int -- The amount of EU currently stored
-- getRFCapacity || function([side:string]):int -- The maximum amount of RF that can be stored
-- getDocs || function([name: string]):string|table -- Get the documentation for all functions or the function specified. Errors if the function cannot be found.
-- getItemMeta || function(slot:int):table|nil -- The metadata of the item in the specified slot. The slot number starts from 1.
-- getEUOutput || function():number -- The maximum EU output per tick
-- getEUCapacity || function():int -- The maximum amount of EU that can be stored
-- drop || function(slot:int[, limit:int[, direction:string]]):int -- Drop an item on the ground. Returns the number of items dropped
-- getEnergyStored || function():int -- The amount of energy currently stored
-- size || function():int -- The size of the inventory
-- getDemandedEnergy || function():number -- The maximum amount of EU that can be received
-- suck || function([slot:int[, limit:int]]):int -- Suck an item from the ground
-- pushItems || function(toName:string, fromSlot:int[, limit:int[, toSlot:int]]):int -- Push items from this inventory to another inventory. Returns the amount transferred.
-- getMetadata || function():table -- Get metadata about this object
-- pullItems || function(fromName:string, fromSlot:int[, limit:int[, toSlot:int]]):int -- Pull items to this inventory from another inventory. Returns the amount transferred.
-- getTransferLocations || function([location:string]):table -- Get a list of all available objects which can be transferred to or from
-- getEnergyCapacity || function():int -- The maximum amount of energy that can be stored
-- getSinkTier || function():int -- The tier of this EU sink. 1 = LV, 2 = MV, 3 = HV, 4 = EV etc.
-- list || function():table -- List all items in this inventory
-- getItem || function(slot:int):table|nil -- The item in the specified slot. The slot number starts from 1.
-- getSourceTier || function():int -- The tier of this EU source. 1 = LV, 2 = MV, 3 = HV, 4 = EV etc.

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

local itemDetail = {
    ore = {
        slot = machine.getItemMeta(2),
        name = slot.name,
        count = slot.count
    }
}

while true do
    local status, err = pcall(function()
        queue('Crafting Status')
        queue('------------------')
        queue('')
        queuef('Power : %s', machine.getEnergyStored())
        queuef('Limit : %s', machine.getEnergyCapacity())
        queue('')
        queuef('Ore : %s', itemDetail.ore.name .. ' | ' .. itemDetail.ore.count)

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

