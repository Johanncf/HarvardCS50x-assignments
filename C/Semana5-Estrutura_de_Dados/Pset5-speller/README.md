<h1>CS50 Semana 5: Estrutura de Dados</h1>

<p>Após aprender sobre a possibilidade de manipular endereços específicos da memória do computador através dos pointers, na semana 4 (Memória), na semana 5 começamos a estudar como contruir estruturas de dados na memória do computador unindo os pointers, arrays e algoritmos, abrindo um novo mundo de possibilidades na manipulação de dados.</p>
<ul>
    <li>Liked lists</li>
    <li>Hash Functions</li>
    <li>Hash tables</li>
    <li>Binary search tree</h1>
    <li>Tries</li>
</ul>

<h2>Problem Set 5: Speller</h2>

<p>
Em <em>Speller</em> o desafio foi criar um programa de terminal de comando que lê um arquivo .txt e verifica a soletração de cada palavra do texto com base em um dicionário que será carregado em uma hash table (estrutura de dado). Além disso, o programa deve funcionar da forma mais eficiente possível, ou seja, deve realizar a verificação no menor tempo possível, buscando minimizar também o espaço de memória utilizado para criar a estrutura de dados.
</p><br>

![image](https://user-images.githubusercontent.com/90796061/143493958-8bb18b22-52b7-4da8-8287-29e35188b521.png)

<p>
    O arquivo que possue as minhas implementações para o problema é o <strong>dictionary.c</strong>. Todos os outros arquivos foram escritos pela equipe pedagógica e auxiliam a simplificar a implementação do exercício. Contudo, o principal desafio lógico se encontra na implementação das 5 funções a seguir, e tal desafio ficou por minha conta.
</p>

<ul>
    <li>load - Carrega todas as palavras do dicionário na hash table;</li>
    <li>hash - Recebe uma palavra e passa por parâmetro para uma hash function que retorna um número correspondente a esta palavra. Funciona como um criar de impressão digital para cada palavra;</li>
    <li>size - Retorna quantas palavras existem no dicionário;</li>
    <li>check - Recebe uma palavra por parâmetro e checa se a mesma se encontra no dicionário, ou seja, se está corretamente escrita ou não;</li>
    <li>unload - Libera toda memória que foi separada com o objetivo de alocar as palavras do dicionário. Sim, em C precisamos liberar a memória que alocamos dinâmicamente (no heap) através do nosso código, caso contrário podemos ter um "vazamento de memória" por conta do programa, comprometendo todo o funcionamento do computador;</li>
</ul>

<p>
    Para verificar a eficiência do meu programa, o curso me forneceu um script que roda o código implementado pela equipe pedagógica (sem dar acesso ao código, é claro). Desta forma foi possível ter um parâmetro de comparação. 
</p><br>

<p>
    Este foi um dos códigos mais desafiadores que precisei implementar ao longo dos meus estudos de ciência da computação, tanto pela linguagem complexa e verbosa que é o C, quanto pela complexidade teórica e abstrativa que envolve a criação de uma estrutura de dados. 
</p>

<p>
    OBSs:<br>
    1 - Para conferir a descrição completa do exercício na plataforma do curso, <a href='https://cs50.harvard.edu/x/2021/psets/5/speller/'>clique aqui.</a><br>
    2 - Caso você queira testar o código, será necessário o download dos pacotes importados pelo código. Outra possibilidade é utilizar a IDE do curso, que já possui todos os pacotes instalados. Para acessar a IDE do curso basta fazer login com uma conta do github. Acesse a IDE <a href='https://ide.cs50.io/'>clicando aqui</a>.
</p>


