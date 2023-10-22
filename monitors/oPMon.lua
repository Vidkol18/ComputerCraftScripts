term.redirect(peripheral.wrap('top'))
print('ID: ' .. os.computerID())

local modemPort = 'bottom'

rednet.close(modemPort) -- Always close just in case it is already open.
rednet.open(modemPort)

senderID, message, distance = rednet.receive()

while true do
    term.clear()
    term.setCursorPos(1, 1)
    print(message)
    os.sleep(1)
end
