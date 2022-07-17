require("stolencode")
require("Player")
require("Menu")
require("Enemy")

function love.load()
    love.window.setMode(800, 600, {resizable = false})
    Menu:load()
    Player:load()
    Enemy:load()
end

function love.update(dt)
    if Menu.thing then 
        Menu:update(dt) 
    elseif Menu.thing == false then 
        if Player.Alive then 
            Player:update(dt)
        end
        Enemy:update(dt)
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
        Enemy:draw()
    end
    if Player.Alive == false then 
        love.graphics.print("u ded, press r to restart", 400, 300)
    end
end

function love.keypressed(key) 
    if key == "return" or key == "up" or key == "down" or key == "left" or key == "right" then -- i wanted to make as much content from that as possible because i know a more efficient may to do that but i need content so yes
        Menu.thing = false
    end
    if key == "r" then 
        Player.Alive = true 
        Player:load() 
        Enemy:load()
    end -- so that you can play forever or something
end