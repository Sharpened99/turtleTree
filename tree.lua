--[[Version 1.0]] --
-- Made by Sharpened99 --

--- checks if the turtle needs fuel and if neccessary, refuels
function fuelCheck()
    local fuelLevel = turtle.getFuelLevel()
    if fuelLevel < 20 then
        turtle.select(1)
        turtle.refuel(1)
        print("Refueled!")
    end
end

--- checks if a log is in front of the turtle and if so, chops it down and places a new sapling
function chopTree()
    local success, data = turtle.inspect()
    if data.name == "minecraft:log" then
        print("Tree detected... chopping.")
        turtle.dig()
        turtle.forward()
        local boolean, blockUp = turtle.inspectUp()
        while blockUp.name ~= "minecraft:cobblestone" and boolean do
            turtle.digUp()
            turtle.up()
            boolean, blockUp = turtle.inspectUp()
        end
        while turtle.detectDown() == false do
            turtle.down()
        end
        turtle.back()
        turtle.select(3)
        turtle.place()
        turtle.select(1)
        turtle.suck()
        turtle.suckUp()
    end
end

--- checks if the turtle´s inventory is getting full and if so,
--- tries to put unneccessary items in a chest behind the turtle
function dropCheck()
    if turtle.getItemCount(16) > 0 then
        print("Dropping Items...")
        turtle.turnLeft()
        turtle.turnLeft()
        turtle.select(2)
        turtle.drop()
        for n = 4, 16 do
            turtle.select(n)
            turtle.drop()
        end
        turtle.turnRight()
        turtle.turnRight()
        turtle.select(1)
    end
end

--- action loop
local chopping = true
while chopping do
    fuelCheck()
    dropCheck()
    chopTree()
end