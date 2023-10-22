local w, h = term.getSize()

local currTerm = term.current()
local window = window.create(currTerm, 1, 1, w, h, false)

function render()
    term.redirect(window)
    paintutils.drawFilledBox(5, 5, 30, 16, colors.green)
    paintutils.drawFilledBox(5, 5, 30, 16, colors.red)
    paintutils.drawFilledBox(5, 5, 30, 16, colors.blue)
    paintutils.drawFilledBox(5, 5, 30, 16, colors.black)
    paintutils.drawFilledBox(5, 5, 30, 16, colors.blue)
    paintutils.drawFilledBox(5, 5, 30, 16, colors.white)
    paintutils.drawFilledBox(5, 5, 30, 16, colors.lightBlue)

    term.redirect(currTerm)

    window.setVisible(true)
    window.setVisible(false)
end
while true do
    os.pullEvent()

    render()
end