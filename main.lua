-- Screen dimensions = 800 x 600

function love.load()
    love.window.setTitle('GRAVITY SIMULATOR')
    earth = love.graphics.newImage('ball.png') -- Dimensions =
    moon = love.graphics.newImage('blip.png')   --           =
end

function love.update(dt)

end

function euclideanDistance(x1, y1, x2, y2)
    local dist = math.sqrt((y2 - y1)^2 + (x2-x1)^2)
    return dist
end

gravity = 1
x = 20
y = 100
vx = 2
vy = 0
function love.draw()
    gravity = 1000/(euclideanDistance(x, y, 381, 295))^2
    x = x + vx
    y = y + vy

    -- Coordinates of earth center = (381, 295) Y axis starts from top
    if (x > 381) then
        vx = vx - gravity
    else
        vx = vx + gravity
    end

    if (y > 247) then
        vy = vy - gravity
    else
        vy = vy + gravity
    end


    love.graphics.draw(earth, 324, 247)
    love.graphics.draw(moon, x, y)
    mx, my = love.mouse.getPosition()

    love.graphics.print('Mouse x = ' .. tostring(mx) .. ' Mouse y = ' .. tostring(my) ..
    ' Velocity x = ' .. tostring(vx) .. ' Velocity y = ' .. tostring(vy) .. ' Gravity = ' .. tostring(gravity))
end
