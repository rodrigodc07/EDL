function love.load()
	Font = love.graphics.newFont("pixelart.ttf", 30)
	love.graphics.setFont(Font)
	LARGURA=1280
	ALTURA=1024
	TAM=99
	VEL=10
	VEL_BARRA=15
	BORDA=20
	dire=1
    love.window.setMode(LARGURA, ALTURA, {fullscreen=true})
	b1x=BORDA
	b1y=(ALTURA-TAM/10)/2
	b2x=LARGURA-BORDA-TAM/10
	b2y=(ALTURA-TAM/10)/2
	j1=0
	j2=0
	sentido={-1,1}
	ball = {}
	ball["x"] = (LARGURA-TAM/10)/2
	ball["y"] = (ALTURA-TAM/10)/2
	ball["dirX"] = 0
	ball["dirY"] = 0
	msg="Para comecar o jogo aperte a barra de espaco\n'w' e 's' movimentam a barra da esquerda\nAs setas movimentam a barra da direita\nEsc para pausar o jogo"
	pause=false
	ini=true
	gol = love.audio.newSource("gol.wav",static)
	paddle = love.audio.newSource("paddle.wav",static)
	wall = love.audio.newSource("wall.wav",static)
	--musica = love.audio.newSource("musica.wav",stream)
	--love.audio.play(musica)
	aux={}
end
 -- Nome:dire
 -- Propriedade:Endereço
 -- Binding Time:Run
 -- Explicação:O endereço de variaveis só é definido em tempo de execução
 -- Já que as posições livres na memoria podem variar de execução em execução
 
 -- Nome:Palavra reservada false
 -- Propriedade:Valor
 -- Binding Time:Language Design Time
 -- Explicação: Durante o design da linguagem foi definido que o valor de 'false' seria o 0 logico,ou falso
 
function love.draw()
	love.graphics.setColor(255,255,255)
    love.graphics.rectangle("fill", b1x, b1y, TAM/10, TAM )
	love.graphics.rectangle("fill", b2x, b2y, TAM/10, TAM )
	love.graphics.rectangle("fill", ball.x, ball.y, TAM/10, TAM/10 )	
	love.graphics.setColor(255,0,0)
	love.graphics.print(j1, 350, 50)
	love.graphics.print(j2, 350+LARGURA/2, 50)
	if pause or ini then
		love.graphics.print(msg, LARGURA/4, ALTURA/2)
	end
    --else
		for y=0,ALTURA,TAM*3/4	
		do
			love.graphics.setColor(255,255,255)
			love.graphics.rectangle("fill", (LARGURA-TAM/20)/2,y, TAM/20, TAM/2 )
		end
	--end
end

 -- Nome:Caracter especial '='
 -- Propriedade:Implementação
 -- Binding Time:Language Design Time
 -- Explicação: Durante o design da linguagem foi amarrado a operação de atribuição ao caracter '='
 
function pausa()
	ball.dirX = 0
	ball.dirY = 0
	pause=true
end
 -- Nome:Função pausa()
 -- Propriedade:Implementação
 -- Binding Time:Compilation
 -- Explicação:Por pausa ser uma função criada no código ela tem sua amarração feita em tempo de compilação
function reinicia()
	pause=false
	ini=true
	ball.x=(LARGURA-TAM/10)/2
	ball.y = (ALTURA-TAM/10)/2
	math.randomseed( os.time() )
	ball.dirX=VEL*sentido[math.random(1,2)]
	ball.dirY=VEL*math.random(-1,1)
	--ball.dirX=VEL
	velo=VEL	
end
 -- Nome:A variavel pause
 -- Propriedade:Valor
 -- Binding Time:Compilation
 -- Explicação:Por pausa ser uma vairavel local a uma função 
function love.update(dt)
	ball.x=ball.x+ball.dirX
	ball.y=ball.y+ball.dirY
	--inverte a direção x apos a colisao com a barra
	if((ball.x>=b1x)and (ball.x<=b1x+TAM/10) and(ball.y>=b1y-TAM/10)and(ball.y<=b1y+TAM))or(((ball.x+TAM/10>=b2x)and(ball.x+TAM/10<=b2x+TAM/10)and(ball.y>=b2y-TAM/10)and(ball.y<=b2y+TAM)))then
		ball.dirX=-ball.dirX
		--altera y apos a colisao com a barra 1
		if ball.dirX>0 then
			if ball.y<b1y+TAM/3 then 
				ball.dirY=-velo
				velo=velo+1
			elseif(ball.y>b1y+2*TAM/3)then
				ball.dirY=velo
				velo=velo+1
			end
		end
		--altera y apos a colisao com a barra 2
		if ball.dirX<0 then
			if ball.y<b2y+TAM/3 then
				ball.dirY=-velo
				velo=velo+1
			elseif(ball.y>b2y+2*TAM/3)then
				ball.dirY=velo
				velo=velo+1
			end			
		end
		love.audio.play(paddle)
	end
	--inverte y apos colisao com a borda
	if ball.y<=0 or ball.y>=ALTURA then
		ball.dirY=-ball.dirY
		love.audio.play(wall)
	end
	--gol
	if ball.x<0 then
		j2=j2+1
		reinicia()
		pausa()
		love.audio.play(gol)
	end
	if ball.x>LARGURA then
		j1=j1+1
		reinicia()
		pausa()
		love.audio.play(gol)
	end
	if(love.keyboard.isDown("w")) then
		if(b1y>0)then
			b1y=b1y-VEL_BARRA
		end
	elseif(love.keyboard.isDown("s"))then
		if(b1y<ALTURA-TAM)then
			b1y=b1y+VEL_BARRA		
		end
	end
	if(love.keyboard.isDown("up")) then
		if(b2y>0)then
			b2y=b2y-VEL_BARRA
		end
	elseif(love.keyboard.isDown("down"))then
		if(b2y<ALTURA-TAM)then
			b2y=b2y+VEL_BARRA	
		end
	end
	
end
 -- Nome:Operador '+'
 -- Propriedade:implementação
 -- Binding Time:Compilation
 -- Explicação:Por '+' ter diferentes implementações para os diferentes de tipos de operadores
 -- Só é possivel definir sua implementação em tempo de compilação
function love.keypressed(key,unicode)
	if key=="space"and (pause or ini) then
	    --[[for x=2,0,-1
		do
			love.audio.play(paddle)
			love.timer.sleep(1)			
		end]]
		if ini then
			reinicia()
			ini=false
		else
			ball.dirX=aux.dirX
			ball.dirY=aux.dirY
			pause=false
		end
		msg="GOLL!!!\npressione espaco para nova bola" 
	end
	if key=="escape" and not pause then
		pause=true
		msg="Aperte Enter para uma nova partida\nE a barra de espaco para voltar a partida"
		aux.dirX=ball.dirX
		aux.dirY=ball.dirY
		ball.dirX=0
		ball.dirY=0
	end
	if (key=="return"or key=="kpenter")and pause then
		reinicia()
		pausa()
		ini=true
		msg="Para comecar o jogo aperte a barra de espaco\n'w' e 's' movimentam a barra da esquerda\nAs setas movimentam a barra da direita\nEsc para pausar o jogo"
		j1=0
		j2=0
		b1x=BORDA
		b1y=(ALTURA-TAM/10)/2
		b2x=LARGURA-BORDA-TAM/10
		b2y=(ALTURA-TAM/10)/2
	end
end
 -- Nome:A variavel key
 -- Propriedade:Valor
 -- Binding Time:Run
 -- Explicação:Como key é uma variavel que depende da entrada do usuario seu valor só pode ser amarrado em tempo de execução
function love.quit()
  print("Obrigado por jogar! Volte logo!")
end