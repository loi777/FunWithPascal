program buscaPGM;
const
   MAX	  = 1000;
   PRETO  = 0;
type
   TpMatriz = array[1..MAX, 1..MAX] of integer;
var
   arqIm, arqP, arqSai		   : text;
   nomeArqIm, nomeArqP, nomeArqSai : string[30];
   im, imP			   : TpMatriz;
   numLin, numCol, numMax	   : integer;
   linP, colP, maxP		   : integer;
   i, j				   : integer;

procedure leArqPGM(var f : text;
		   var m : TpMatriz; var numLin, numCol, numMax: integer);
var
   id	: string;
   i, j	: integer;
begin
   readln( f, id );
   readln( f, numCol, numLin );
   readln( f, numMax );
   for i:=1 to numLin do
      for j:= 1 to numCol do
	 read( f, m[i,j] );
end; { leArqPGM }

procedure escreveArqPGM(var f : text;
		  var m	: TpMatriz; numLin, numCol, numMax:integer);
var
   i, j	: integer;
begin
   writeln( f, 'P2' );
   writeln( f, numCol:4, numLin:4 );
   writeln( f, numMax );
   for i:= 1 to numLin do
   begin
      for j:= 1 to numCol do
	 write(f, m[i,j]:4);
      writeln( f );
   end;
end; { escreveArqPGM }

(*  Funcao achouPadrao:
 *  retorna true se o padrao de imagem imP com tamanho linP s colP
 *  for encontrado na imagem im com o canto superior esquerdo na posicao
 *  (linIni, colIni) *)

function achouPadrao(var im  : TpMatriz; linIni, colIni: integer;
		     var imP : TpMatriz; linP, colP: integer): boolean;
var
        i, j : integer;
        resultado : boolean;
begin
        resultado:= true;
        i:= 1;
        while ((i <= linP) and (resultado = true)) do
        begin
                j:= 1;
                while ((j <= colP) and (resultado = true)) do
                begin
                        if (im[linIni + i, colIni + j] <> imP[linIni + i, colIni + j]) then
                                resultado:= false;
                        j:= j + 1;
                end;
                i:= i + 1;
        end;
        achouPadrao:= resultado;
end; { achouPadrao }


(* Procedimento bordaPreta:
 * altera a imagem im, colocando uma borda de cor PRETO de tamanho
 * numLin x numCol com o canto superior esquerdo na posicao (linIni, colIni) *)

procedure bordaPreta (var im : TpMatriz;
			  linIni, colIni, numLin, numCol: integer);
var
        posi : integer;
begin
       for posi:= 1 to numLin do
       begin
                im[linIni + posi , colIni]:= 0;
                im[linIni + posi , colIni + numCol]:= 0;
       end;
       for posi:= 1 to numCol do
       begin
                im[linIni , colIni + posi]:= 0;
                im[linIni + numLin , colIni + posi]:= 0;
       end;
end; { bordaPreta }

begin
   writeln('Arquivo imagem PGM: ');
   read( nomeArqIm );
   assign( arqIm, nomeArqIm );
   reset( arqIm );
   leArqPGM( arqIm, im, numLin, numCol, numMax );
   close( arqIm );

   writeln('Arquivo padrao PGM: ');
   read( nomeArqP );
   assign( arqP, nomeArqP );
   reset( arqP );
   leArqPGM( arqP, imP, linP, colP, maxP );
   close( arqP );
   write('debugg');
   for i:=1 to numLin-linP+1 do
      for j:=1 to numCol-colP+1 do
        if achouPadrao(im, i, j, imP, linP, colP) then
	        bordaPreta(im, i, j, linP, colP);

   writeln('Arquivo saida PGM: ');
   read( nomeArqSai );
   assign( arqSai, nomeArqSai );
   rewrite( arqSai );
   escreveArqPGM( arqSai, im, numLin, numCol, numMax );
   close( arqSai );
end.
