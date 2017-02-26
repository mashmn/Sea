%{
#include <stdio.h>
#include <stdlib.h>

%}

%union{
	char c;
	char s[200];
}
%token <c> SP
%token <c> LF
%token <c> CR
%token <c> TAB
%token <c> VTAB
%token <c> FF
%token <c> SC
%token <c> NUM
%token <c> WORD
%%
html:
| html line LF
;

line:
| line TAB
| line VTAB
| line LF
| line FF
| line SC 
| line CR
| line SP
/*| line NUM NUM SC NUM NUM { printf("X"); }*/
| line WORD
| line NUM
;
%%

#include <ctype.h>

#define IS(a,b) (strcmp((a),(b))==0)
int yylex(void) {
 int c;
 char *v=yylval.s;
 int p=0;

c=getc(stdin);

 if(c==EOF){v[0]='\0';return (0);}
/*
switch(c){
	//case ' ': return SP;{ printf(" ");  break;}
	case '\n':{ return LF; printf("\n");  break;}
	case '\r':{ return CR; printf("%c",c);  break;}
	default:
	{if(isdigit(c))
		{printf("%c",c); return NUM;} 
	else if (!isalpha(c) && !isdigit(c)) 
		{ printf("%c",c); return SC; }
	}
}*/

if (isdigit(c)) { printf("%c",c); return NUM; };
if (c==' ') { printf("%c",c); return SP; };
if (c=='\r') { printf("%c",c); return CR; };
if (c=='\n') { printf("%c",c); return LF; };
if (c=='\t') { printf("%c",c); return TAB; };
if (c=='\f') { printf("%c",c); return FF; };
if (c=='\v') { printf("%c",c); return VTAB; };
if (!isalpha(c) && !isdigit(c) && !isspace(c)) { printf("%c",c); return SC; }
while(isalpha(c)){
	v[p++]=c;
	printf("%c",c);
	c=getc(stdin);
 }
ungetc(c,stdin);
v[p]='\0';

/*if(IS(v,"table")){return TABLE;}
if(IS(v,"div")){return DIV;}
if(IS(v,"span")){return SPAN;}
if(IS(v,"tr")){return TR;}
if(IS(v,"td")){return TD;}
if(IS(v,"class")){return CLASS;}
if(IS(v,"href")){return HREF;}*/ 
//printf("?x?");
return WORD;
}

int yyerror(char *s){printf("yyerror: %s\n",s);}
int main(int argc, char **agrv){int yydebug=1;yyparse();}
