Enemy = {}

function Enemy:load()
    Enemy.xpos = 0
    Enemy.ypos = 0
    Enemy.Width = 32
    Enemy.Height = 32 
    Enemy.Speed = 350
    Enemy.Direction = "up"
    Enemy.Widththingx = 0
    Enemy.Widththingy = Enemy.ypos
    Enemy.WidththingWidth = 800
    Enemy.WidththingHeight = Enemy.Height
    Enemy.Heightthingx = Enemy.xpos
    Enemy.Heightthingy = 0
    Enemy.HeightthingWidth = Enemy.Width
    Enemy.HeightthingHeight = 600
end

function Enemy:update(dt)
    if checkCollision(Player.xpos, Player.ypos, Player.Width, Player.Height, self.xpos, self.ypos, self.Width, self.Height) then 
        Player.Alive = false 
    end
    if Enemy:goleft() then 
        Enemy.Direction = "left"
    elseif Enemy:goright() then 
        Enemy.Direction = "right"
    elseif Enemy:goleft() == false and Enemy:goright() == false then
        if Enemy:goup() then 
            Enemy.Direction = "up"
        elseif Enemy:godown() then 
            Enemy.Direction = "down"
        end
    end
    Enemy.Widththingx = 0
    Enemy.Widththingy = Enemy.ypos
    Enemy.WidththingWidth = 800
    Enemy.WidththingHeight = Enemy.Height
    Enemy.Heightthingx = Enemy.xpos
    Enemy.Heightthingy = 0 
    Enemy.HeightthingWidth = Enemy.Width
    Enemy.HeightthingHeight = 600
    if Enemy.Direction == "up" then
        Enemy.ypos = Enemy.ypos - Enemy.Speed * dt
    elseif Enemy.Direction == "down" then
        Enemy.ypos = Enemy.ypos + Enemy.Speed * dt
    elseif Enemy.Direction == "left" then
        Enemy.xpos = Enemy.xpos - Enemy.Speed * dt
    elseif Enemy.Direction == "right" then
      Enemy.xpos = Enemy.xpos + Enemy.Speed * dt
    end
    if love.keyboard.isDown("up") then
        Enemy.Direction = "up"
    elseif love.keyboard.isDown("down") then
        Enemy.Direction = "down"
    elseif love.keyboard.isDown("left") then
        Enemy.Direction = "left"
    elseif love.keyboard.isDown("right") then
        Enemy.Direction = "right"
    end
end

function Enemy:draw() 
    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("fill", self.xpos, self.ypos, self.Width, self.Height)
    love.graphics.setColor(1, 1, 1)
end

function Enemy:goleft()
    if Enemy.xpos + Enemy.Width > Player.xpos + Player.Width or Enemy.xpos + Enemy.Width > Player.xpos and Enemy.xpos > Player.xpos or Enemy.xpos > Player.xpos + Player.Width then
        if checkCollision(Enemy.Heightthingx, Enemy.Heightthingy, Enemy.HeightthingWidth, Enemy.HeightthingHeight, Player.xpos, Player.ypos, Player.Width, Player.Height) == false then 
            return true
        else
            return false 
        end
    else
        return false
    end
end

function Enemy:goright()
    if Enemy.xpos + Enemy.Width < Player.xpos + Player.Width or Enemy.xpos + Enemy.Width < Player.xpos and Enemy.xpos < Player.xpos or Enemy.xpos < Player.xpos + Player.Width then 
        if checkCollision(Enemy.Heightthingx, Enemy.Heightthingy, Enemy.HeightthingWidth, Enemy.HeightthingHeight, Player.xpos, Player.ypos, Player.Width, Player.Height) == false then 
            return true
        else
            return false 
        end
    else 
        return false
    end
end

function Enemy:godown()
    if Enemy.ypos + Enemy.Height < Player.ypos + Player.Height or Enemy.ypos + Enemy.Height < Player.ypos and Enemy.ypos < Player.ypos or Enemy.ypos > Player.ypos + Player.Height then 
        if checkCollision(Enemy.Widththingx, Enemy.Widththingy, Enemy.WidththingWidth, Enemy.WidththingHeight, Player.xpos, Player.ypos, Player.Width, Player.Height) == false then
            return true 
        else
            return false 
        end
    else
        return false 
    end
end

function Enemy:goup()
    if Enemy.ypos + Enemy.Height > Player.ypos + Player.Height or Enemy.ypos + Enemy.Height > Player.ypos and Enemy.ypos > Player.ypos or Enemy.ypos > Player.ypos + Player.Height then 
        if checkCollision(Enemy.Widththingx, Enemy.Widththingy, Enemy.WidththingWidth, Enemy.WidththingHeight, Player.xpos, Player.ypos, Player.Width, Player.Height) == false then
            return true 
        else
            return false 
        end
    else
        return false 
    end
end