# Swift (linguagem de programação)

## Sobre o Swift
Swift é uma linguagem de programação criada pela Apple Inc. para desenvolvimento de programas para suas próprias plataformas (iOS, macOS, watchOS, tvOS) e Linux. Essa linguagem destina-se a ser uma alternativa mais simples e eficaz ao desenvolvimento de softwares para suas plataformas do que o Objective-C (linguagem anteriormente usada).
Sua construção visa a elaboração de códigos mais enxutos e mais resilientes à erros, com otimizações no desempenho e uma alta expressividade. Além disso foi projetada para trabalhar com os frameworks da Apple, Cocoa e Cocoa touch, e com códigos em Objective-c.  
## Origens e Influências
O desenvolvimento da linguagem Swift pela Apple começou em julho de 2010, com o programador Chris Lattner liderando o projeto. Em 2014 na Conferência Mundial de Desenvolvedores da Apple (WWDC), ocorreu a divulgação de uma versão beta da linguagem para desenvolvedores registrados Apple, juntamente com seu manual gratuito.
Sua primeira versão foi oficialmente lançada em setembro de 2014, sendo submetidas atualizações para a versão 1.1 em outubro e 1.2 em abril do ano seguinte. Na WWDC 2015 foi anunciada uma atualização mais importante para Swift 2.0, sendo disponibilizada em setembro do mesmo ano e se tornando uma linguagem de código aberto em dezembro. Swift 3.0 foi lançado em 13 de setembro de 2016. 
De acordo com o próprio desenvolvedor, Swift foi influenciada por diversas linguagens, buscando inspiração principalmente nas seguintes: Objective-C, Rust, Haskell, Ruby, Python, C#, CLU, (D).
## Classificação
Swift é uma linguagem de programação compilada e multiparadigma, sendo extremamente versátil, dando suporte aos seguintes tipos de programação:
- Orientada a objetos
- Funcional
- Imperativa

Além disso, trata-se de uma linguagem de uso geral, podendo ser usada para desenvolver diversos tipos de software para as plataformas compatíveis, tendo uma tipagem forte e estática, possuindo também inferência de tipo como podemos ver no código abaixo.
```swift
   var stringVar1:String = "Ola Mundo"
   var stringVar2 = "Ola Mundo"
```



## Avaliação Comparativa
Swift é uma linguagem que possui características inspiradas nas principais linguagens de programação atuais, buscando obter o máximo de expressividade ao utilizar o que há de melhor em cada uma delas. Porém, ela também possui suas próprias expressividades particulares.
De acordo com as pesquisas realizadas sobre sua versão 2.0, Swift possui um desempenho muito melhor do que o Objective-C e Python, além de possuir uma performance média quase na mesma velocidade de C++.

### Read/Write:
O principal objetivo do swift é ser uma linguagem de fácil escrita, e isso pode ser observado pela simplicidade da linguagem, onde com apenas algumas linhas de código podemos escrever programas completos,Porém como ela apresenta alguns paradigmas diferentes das linguagens mais convencionais como (quais paradigmas) ,sua leitura pode acabar se tornando algo mais complicado em certos programas, e essa simplicidade dos códigos atrapalha aqueles que estão começando com a linguagem, tornando C e Java por exemplo linguagens de leitura mais fácil.
		Já quando falamos de escrita Swift é uma linguagem bastante simples assim como Python e Java já que a linguagem possui uma série de vantagens na sua sintaxe tornando a elaboração de códigos bem mais simples daqueles em C	


### Swift vs C
Apesar de possuir grande parte de sua estrutura básica similar à linguagem C, Swift possui um grande número de funcionalidade extras. A diferença mais notável seria a ausência da necessidade de “;” ao final de cada declaração. Além disso vários comportamentos que são conhecidos como grandes geradores de erros foram alterados, como:
- Os ponteiros não são expostos por padrão;
- Não há necessidade de break em blocos switch;
- As variáveis e constantes sempre são inicializadas e os limites da matriz sempre são verificados;
- O formulário de uma declaração de if e while, que permite a omissão de chaves ao redor da instrução, não é suportado;

### Swift vs Python
Grande parte da capacidade de Swift de gerar códigos enxutos e de fácil entendimento deve-se a uma sintaxe muito similar à de Python. Porém suas comparações não estão restritas a esse aspecto da linguagem:
-  A forma de declarar e lidar com strings e arrays nas duas linguagens, com uma visão mais parecida com listas no segundo caso, é extremamente similar, com ambas contado com diversas funções para lidar com strings.
-  Swift apresenta uma tipagem forte e estática, com suporte a constante, o que já não ocorre em Python, que permite até mesmo listas com tipos diversos.
### Swift vs Java
A principal comparação que pode ser feita com relação a Java, que necessita de muitas linhas de código para alguns comandos simples, é quanto a redigibilidade. Swift é uma linguagem que não necessita de uma função main e de chaves, podendo funcionar como uma linguagem de script quando necessário. Outro ponto de diferenças entre elas é em relação à inferência de tipos presente em Swift e o retorno de valores múltiplos, ambos não suportados em Java.
Já o comportamento relativo a Strings e objetos é semelhante em ambas as linguagens, já que Swift inclusive conta com alguns conceitos como herança e interface, além de adicionar outros como protocolos.
### Protocolos
Em swift existe a ideia de protocolos, que nada mais é do que um escopo que define tanto métodos quanto propriedades a uma classes ou a uma estrutura existente, sempre lembrando que para estar em conformidade com um protocolo uma classes ou estrutura deve todas as suas funcionalidade devem ser implementadas,possuindo assim mesma funcionalidade da herança orientação a objetos do Java porém sem nenhuma associação fortemente vinculada.
``` swift
protocol Drivable {
    var topSpeed: Int { get }
}
 
protocol Reversible {
    var reverseSpeed: Int { get }
}
 
protocol Transport {
    var seatCount: Int { get }
}

struct Car: Drivable, Reversible, Transport {
    var topSpeed = 150
    var reverseSpeed = 20
    var seatCount = 5
}
```
### Tipos
## Conclusão
