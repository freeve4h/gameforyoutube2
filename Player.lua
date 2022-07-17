Player = {}

function Player:load()
    Player.xpos = 400
    Player.ypos = 300
    Player.Size = 32
    Player.Width = Player.Size
    Player.Height = Player.Size
    Player.Speed = 400 -- yes
    Player.Alive = true
end

function Player:update(dt)
    Player:Bounderies()
    -- moving and stuff
    if love.keyboard.isDown("up") then 
        Player.ypos = Player.ypos - Player.Speed * dt 
    end
    if love.keyboard.isDown("down") then 
        Player.ypos = Player.ypos + Player.Speed * dt -- this is very interesting content, not boring at all...
    end
    if love.keyboard.isDown("right") then 
        Player.xpos = Player.xpos + Player.Speed * dt -- this must be getting very boring 
    end
    if love.keyboard.isDown("left") then 
        Player.xpos = Player.xpos - Player.Speed * dt -- i am commenting on my code for no reason at all
    end
    Player:Bounderies()
end

function Player:draw()
    love.graphics.rectangle("fill", Player.xpos, Player.ypos, Player.Width, Player.Height)
end

function Player:Bounderies()
    -- my pc is so bad
    if Player.xpos < 0 then 
        Player.xpos = 0
    end
    if Player.ypos < 0 then 
        Player.ypos = 0 
    end
    if Player.xpos + Player.Width > love.graphics.getWidth() then 
        Player.xpos = love.graphics.getWidth() - Player.Width 
    end
    if Player.ypos + Player.Height > love.graphics.getHeight() then -- besure to watch my other content!!!
        Player.ypos = love.graphics.getHeight() - Player.Height 
    end
end