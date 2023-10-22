print('ID: ' .. os.computerID())
print('Running...')
monitor = peripheral.wrap('top')
term.redirect(monitor)
monitor.setTextScale(0.5)

local modemPort = 'bottom'

rednet.close(modemPort) -- Always close just in case it is already open.
rednet.open(modemPort)

-- there be a flicker but it will do for now.

while true do
    term.clear()
    term.setCursorPos(1, 1)

    senderID, message, distance = rednet.receive()
    print(message)

    os.sleep(5)
end


-- Version Mk1 final