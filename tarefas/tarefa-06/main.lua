function cenario()
    count=6
	for index=1,2*count,2
	do
		size=math.random(TAM*6,height-TAM*12)
		barra[index] = {}
		barra[index]["x"] = index*width/count/2+200
		barra[index]["y"] = 0
		barra[index]["size"] = size
		barra[index+1] = {}
		barra[index+1]["x"] = index*width/count/2+200
		barra[index+1]["y"] = size+6*TAM
		barra[index+1]["size"] = height-size-6*TAM
	end
	flap.y=(height-3*TAM)/2
	lose=false
end
-- Array:A variavel barra é um exemplo de array onde cada elemento será do tipo tera os campos x,y,size

-- Registro:Cada um dos elementos de barra é um registro já que são uma coleção de objetos
-- barra[index]={x=index*width/count/2+200,y=0,size=size}
function love.load()
	math.randomseed( os.time() )
	TAM=20
	pause=false
	width, height, flags = love.window.getMode( )
	flap={}
	flap.x=50
	flap.y=(height+TAM)/2
	love.graphics.setColor(255,255,255)
	lose=false
	barra={}	
	cenario()
	
end
function love.draw()
	love.graphics.setColor(0,0,255)
    love.graphics.rectangle("fill", 50, flap.y, TAM, TAM )	
	love.graphics.setColor(255,255,255)
	for i,v in ipairs(barra)
	do 
		love.graphics.rectangle("fill", v.x, v.y,TAM*2, v.size )
	end

	if(lose)then
		msg={{255,0,0},"Voce Perdeu Aperte Enter para Recomecar"}
		love.graphics.print(msg, width/4, width/2)		
	end
end
-- Tupla:A variavel msg é uma tupla de dois elementos, a cor do texto(em um array de inteiros) e o texto
function love.update(dt)
	if flap.y>=height then
		lose=true		
	elseif(not lose)then 		
		flap.y=flap.y+2
		love.timer.sleep(dt/60)
		for i,v in ipairs(barra)
		do 
			v.x=v.x-1
			if(flap.x+TAM>=v.x) and (flap.x<=v.x+TAM*2) and flap.y+TAM>=v.y and flap.y<=(v.y+v.size)then
				lose=true
			end
			if v.x<-TAM*2 then
				v.x=width
			end
		end
	end
			
end
function love.keypressed(key,unicode)	
		if key=="space" then
			if (not lose) then
				flap.y=flap.y-50
			end
		end
		if key=="return" then
			if lose then
				cenario()
			end
		end
end
-- Enum:O paremetro "space" da função "keypressed" é exemplo de uma enumeração em lua
-- onde cada tecla do teclado tem um valor associado conjunto de constantes