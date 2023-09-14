component = require('component')
sides = require('sides')
rs = component.redstone
reactor = component.reactor_chamber

print('reactor running')

function reactor_monitor()
    while true do
        if rs.getInput(sides.front) == 15 then
            rs.setOutput(sides.back, 0)
            rs.setOutput(sides.left, 0)
            rs.setOutput(sides.right, 0)
            break
        else
            if reactor.getHeat() > 5000 then
                rs.setOutput(sides.back, 0)
            else
                rs.setOutput(sides.back, 15)
            end

            if check_fuelRods(reactor) == true then
                rs.setOutput(sides.left, 15)
                rs.setOutput(sides.right, 15)
            else
                rs.setOutput(sides.left, 0)
                rs.setOutput(sides.right, 0)
            end
        end
    end
end

function check_fuelRods(reactor)
    if reactor.getHeat() == 0 and reactor.getReactorEUOutput() == 0 and reactor.producesEnergy() == true then
        print('reactor is off')
        return true
    else
        return false
    end
end

function main()
    --check_fuelRods(reactor)
    reactor_monitor()
end

main()