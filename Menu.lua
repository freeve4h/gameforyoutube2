Menu = {}

function Menu:load()
    Menu.thing = true
end

function Menu:update(dt)
    -- content
end

function Menu:draw() 
    love.graphics.print("press Enter or Return or any of the arrow keys to start\npress esc to exit (or just click on an x idc)", 400, 300) -- using the numbers 400 and 300 is not very smart
end