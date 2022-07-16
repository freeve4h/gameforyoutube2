require("stolencode")
require("Player")
require("Menu")

function love.load()
    love.window.setMode(800, 600, {resizable = false})
    Menu:load()
    Player:load()
end

function love.update(dt)
    if Menu.thing then 
        Menu:update(dt) 
    elseif Menu.thing == false then 
        Player:update(dt)
    end
    -- to quit the game of something idk i just need to record content
    if love.keyboard.isDown("escape") then 
        love.event.quit()
    end
end

function love.draw()
    if Menu.thing then 
        Menu:draw()
    elseif Menu.thing == false then 
        Player:draw()
    end
end

function love.keypressed(key) 
    if key == "return" or key == "up" or key == "down" or key == "left" or key == "right" then -- i wanted to make as much content from that as possible because i know a more efficient may to do that but i need content so yes
        Menu.thing = false
    end
end