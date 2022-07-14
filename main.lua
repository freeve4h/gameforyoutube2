require("stolencode")
require("Player")

function love.load()
    love.window.setMode(800, 600, {resizable = false})
    Player:load()
end

function love.update(dt)
    Player:update(dt)
    -- to quit the game of something idk i just need to record content
    if love.keyboard.isDown("escape") then 
        love.event.quit()
    end
end

function love.draw()
    Player:draw()
end