function create (index)
	size=math.random(TAM*6,height-TAM*12)
	nova_barraUp = {}
	nova_barraUp["x"] = width
	nova_barraUp["y"] = 0
	nova_barraUp["size"] = size
	table.insert(barra,nova_barraUp)
	nova_barraDown = {}
	nova_barraDown["x"] = width
	nova_barraDown["y"] = size+6*TAM
	nova_barraDown["size"] = height-size-6*TAM
	table.insert(barra,nova_barraDown)
end
function cenario()
    count=6
	barra={}
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
	score=0
end
-- Array:A variavel barra é um exemplo de array onde cada elemento será do tipo tera os campos x,y,size
-- Registro:Cada um dos elementos de barra é um registro já que são uma coleção de objetos
-- barra[index]={x=index*width/count/2+200,y=0,size=size}
function love.load()
	math.randomseed( os.time() )
	TAM=20
	score=0
	pause=false
	width, height, flags = love.window.getMode( )
	flap={}
	flap.x=50
	flap.y=(height+TAM)/2
	love.graphics.setColor(255,255,255)
	lose=false
	barra={}	
	cenario()
	checkpoint = love.audio.newSource("pass.ogg",static)
	
end
-- Sobre o array barra:
-- Escopo: É uma variavel global por default do lua
-- Tempo de Vida: Seu tempo de vida é toda a execução do jogo.
-- Alocação: É feita na função love.load
-- Desalocação: É desalocado quando a partida termina
function love.draw()
	love.graphics.setColor(0,0,255)
    love.graphics.rectangle("fill", 50, flap.y, TAM, TAM )	
	love.graphics.setColor(255,255,255)
	for i,v in ipairs(barra)
	do 
		love.graphics.rectangle("fill", v.x, v.y,TAM*2, v.size )
	end
	love.graphics.setColor(255,0,0)
	love.graphics.print(score/2, height/4, width/2)		
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
			if v.x<(-TAM*2) and (v~=nil) then
				table.remove(barra,i) -- Desalocação do elemento
				if(score%2==0)then
					create()-- Alocação do elemento
				end
				score=score+1
				love.audio.play(checkpoint)
			end
		end
	end			
end
-- Sobre um objeto do array barra:
-- Escopo: Como a array já é global por si só, os seus elementos também serão globaisl, por consequência.
-- Tempo de Vida: Seu tempo de vida será desde a alocação até quando a barra some da tela ou quando o jogo reinicia.
-- Alocação: Ele será criado quando um par das barras passar do limite da tela, ou no inicio do jogo
-- Desalocação: Será desalocado quando não for mais possivel exibir sua posição na tela
function love.keypressed(key,unicode)	
		if key=="space" then
			if (not lose) and (flap.y>0) then
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