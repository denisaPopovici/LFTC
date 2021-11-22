%{
  #include<stdio.h>
%}

%option noyywrap

letter [A-Za-z]
digit [0-9]
identificator ([a-zA-Z]{1,8})
integer ([0-9]|[1-9][0-9]+)
float (([0])|([1-9][0-9]*\.[0-9]*[1-9]+)|([0]\.[0-9]*[1-9]+))
constanta ({integer}|{float})

%%
"int"|"double"|"include"|"<iostream>"|"using"|"namespace"|"std"|"while"|"if"|"cin"|"cout"|"main()"|"return" {printf("\nKeyword : %s", yytext);}

":"|";"|","|"{"|"}"|"("|")"|"<<"|">>" {printf("\nSeparator : %s", yytext);}

"="|"+"|"-"|"*"|"<"|">"|"%" {printf("\nOperator : %s", yytext);}

{digit}*\.{digit}+ {printf("\nConstant : %s", yytext);}

{digit}* {printf("\nConstant : %s", yytext);}

{letter}[1-8] {printf("\nIdentifier: %s", yytext);}

%%

int main()
{
  FILE *fp;
  fp = fopen("input.txt", "r");
  yyin = fp;
  yylex();
  fclose(fp);
  return 0;
}
