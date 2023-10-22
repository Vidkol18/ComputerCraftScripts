print('ID: ' .. os.computerID())
print('Running...')
term.redirect(peripheral.wrap('top'))

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
