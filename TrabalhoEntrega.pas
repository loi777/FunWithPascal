program ProvaExe1;

type
        arrayGenerico = array[1 .. 100] of integer;

var
        vetorN , vetorM : arrayGenerico;
        n , m , num : integer;
        intersec : boolean;

procedure EncherVetor(var vetor : arrayGenerico ; tamanho : integer);
var num : integer;
begin
        for num:= 1 to tamanho do
                read(vetor[num]);
end;

procedure BuscarValorNoVetor(vetor : arrayGenerico ; tamanho : integer ; valor : integer ; var booleanFinal : boolean);
var num : integer;
begin
        num:= 1;
        while ((num <= tamanho) and (booleanFinal = true)) do
        begin
                if (valor = vetor[num]) then
                        booleanFinal:= false;
                num:= num + 1;
        end;
end;

begin
        writeln('Escreva o tamanho de 2 vetores, no maximo ate 100');
        read(n , m);
        writeln();
        //
        if ((n <= 100) and (m <= 100)) then
        begin
                writeln('Agora escreva o primeiro vetor');
                EncherVetor(vetorN , n);
                writeln();
                writeln('Agora escreva o segundo vetor');
                EncherVetor(vetorM , m);
                writeln();
                intersec:= true;        // a prova exigiu que fosse true para vazio, por isso minha procedure ficou um pouco mais confusa

                for num:= 1 to n do
                begin
                        BuscarValorNoVetor(vetorM , m , vetorN[num] , intersec);
                end;

                if (intersec = true) then
                        writeln('Intersecao: vazia')
                else
                        writeln('Intersecao: nao vazia');

        end else
                writeln('Ocorreu um erro colocando o tamanho dos vetores');
        //
        writeln('Aperte enter para sair');
        readln();
end.
