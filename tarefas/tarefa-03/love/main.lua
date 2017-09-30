function love.load()
    Font = love.graphics.newFont("Georgia.ttf", 18)
	
end
 
function love.draw()
    love.graphics.setFont(Font)
	love.graphics.setColor(255,0,0)
    love.graphics.print('Oie Mundo!\nBy:Rodrigo Dantas', 350, 275)
end