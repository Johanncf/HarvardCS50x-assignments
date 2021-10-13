CS50 Semana 3: Algoritmos

- Nesta semana estudamos conceitos relacionados aos diferentes algoritmos de procura (search algorithms) e ordenação de um arranjo de dados (sort algorithms).
- Estudamos os conceitos Big O e Big Omega, funções que expressam o grau de complexidade assintótico (número de "passos") de um algoritmo no pior cenário e no melhor cenário possíveis, respectivamente.

Problem Set 3: Tideman

Em *Tideman* o entendimento dos tópicos da semana 3 foi realmente colocado à prova. Na minha opinião foi o pset mais desafiador do curso utilizando C. Nele tivemos que utilizar todo o conhecimento adquirido até então. Precisamos evoluir a manipulação de arrays, escrever um algoritmo de sort e criar funções trabalhando abstração de forma bem mais avançada. Neste projeto nossa missão era implementar um sistema de votação baseado em escolha ranqueada. E como funciona um sistema de votação desse tipo? O que ele tem interessante? 

No sistema de votação mais simples possível o que acontece é o seguinte: Existe uma lista de candidatos e cada eleitor vota no candidato de preferência. No final, o candidato que recebeu maior número de votos ganha. Porém, esse tipo de sistema apresenta alguns problemas. O primeiro é a possibilidade de empate entre dois ou mais candidatos. O segundo problema é que esse tipo de sistema não considera que todos os eleitores que não votaram no candidato vencedor, podem preferir, somados, outro candidato. Ou seja, um sistema simples nesse nível, não garante um resultado tão democrático quanto deveria. (Se esse segundo problema não tiver ficado tão claro, eu vou referenciar a página com a descrição do desafio e lá tem uma demonstração utilizando cédulas de voto ilustradas que deixam tudo mt mais claro ;D )

Uma solução pra isso seria criar um sistema ranqueado, ou seja, cada eleitor cria uma ordem de preferência entre os candidatos possíveis. Assim um empate fica muito mais simples de resolver e podemos computar o raciocínio das preferências. 

Na implementação desse código, nossa responsabilidade foi construir as funções:

vote( );
record_preferences( );
add_pairs( ); 
sort_pairs( );
lock_pairs( );
print_winner( );

OBS.: Eu implementei a função cycle( ) em adição à função lock_pairs( ). 

Te convido a ler a descrição do problema no link abaixo e depois dar uma olhada no código que implementei.

link para a proposta do problem set: https://cs50.harvard.edu/x/2021/psets/3/tideman/
