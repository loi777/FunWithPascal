program Prova;

type
        matrizGenerica = array[1 .. 100, 1 .. 100] of integer;

var
        matrizFinal : matrizgenerica;
        M , N , posiUmX , posiUmY , distanciaMinima : integer;
(*-------------------------------------------------------TAD--------------------------------------------------------*)
function DescobrirIlhas(matriz : matrizgenerica ; tamanhoL : integer ; tamanhoC : integer ; distancia : integer) : integer;
var
        posiL , posiC , subPosiL , subPosiC , subInicioL , subInicioC , subFinalL , subFinalC , quantidadeEncontrada : integer;
        testeSucesso : boolean;
begin
        quantidadeEncontrada:= 0;

        for posiL:= 1 to tamanhoL do
        begin
                for posiC:= 1 to tamanhoC do
                begin
                        if (matriz[posiL , posiC] = 1) then
                        begin
                                testeSucesso:= true;

                                if (posiL - distancia < 1) then
                                        SubInicioL:= 1
                                else
                                        SubinicioL:= posiL - distancia;

                                if (posiC - distancia < 1) then
                                        SubInicioC:= 1
                                else
                                        SubInicioC:= posiC - distancia;

                                if (posiL + distancia > tamanhoL) then
                                        SubFinalL:= tamanhoL
                                else
                                        SubFinalL:= posiL + distancia;

                                if (posiC + distancia > tamanhoC) then
                                        SubFinalC:= tamanhoC
                                else
                                        SubFinalC:= posiC + distancia;
                                //
                                for subPosiC:= subInicioC to subFinalC do
                                begin
                                        for subPosiL:= subInicioL to subFinalL do
                                        begin
                                                if ((matriz[subPosiL, subPosiC] = 1) and ((subPosiL <> posiL) or (subPosiC <> posiC))) then
                                                        testeSucesso:= false;
                                        end;
                                end;
                                //
                                if (testeSucesso) then
                                        quantidadeEncontrada:= quantidadeEncontrada + 1;
                        end;
                end;
        end;

        DescobrirIlhas:= quantidadeEncontrada;
end;

procedure IniciarMatriz(var matriz : matrizGenerica ; tamanhoL : integer ; tamanhoC : integer);
var posiL , posiC : integer;
begin
        for posiL:= 1 to tamanhoL do
                for posiC:= 1 to tamanhoC do
                        matriz[posiL , posiC]:= 0;
end;

procedure EscreverMatriz(matriz : matrizGenerica ; tamanhoL : integer ; tamanhoC : integer);
var posiL , posiC : integer;
begin
        for posiL:= 1 to tamanhoL do
        begin
                for posiC:= 1 to tamanhoC do
                        write(matriz[posiL , posiC] , '  ');
                writeln();
        end;
end;
(*---------------------------------------------------END TAD--------------------------------------------------------*)
begin
        write('Entre com o numero de linhas e colunas da matriz: ');
        read(M , N);
        IniciarMatriz(matrizFinal, M, N);
        writeln();
        //
        writeln('Entre com as posicoes da matriz com valor 1:');
        read(posiUmX, posiUmY);
        writeln();
        while ((posiUmX <> 0) or (posiUmY <> 0)) do
        begin
                matrizFinal[posiUmX , posiUmY]:= 1;
                read(posiUmX, posiUmY);
                writeln();
        end;
        //
        writeln('Matriz de entrada:');
        EscreverMatriz(matrizFinal , M , N);
        writeln();
        write('Entre com a distancia minima entre as ilhas: ');
        read(distanciaMinima);
        writeln();
        writeln('Ilhas com distancia ' , distanciaMinima , ' = ' , DescobrirIlhas(matrizFinal, M , N , distanciaMinima));
        //
        writeln('Aperte enter para sair');
        readln();
end.
