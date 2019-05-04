import java_cup.runtime.*;
import java.util.*;
import java.io.*;
import java.lang.System;

%%

%function next_token
%class A4JF
%cup

%eofval{
          return null;
%eofval}
%state COMMENTS, INLINECOMMENTS, HASH


ID = [a-zA-Z_][a-zA-Z0-9_]*
NUMBER = -?[0-9]+(\.[0-9]+)?([eE][\-\+][0-9]+)?

%%
<YYINITIAL>"void"		{ return new java_cup.runtime.Symbol( A4Symbol.VOID); }
<YYINITIAL>"int"		{ return new java_cup.runtime.Symbol( A4Symbol.INT); }
<YYINITIAL>"return"		{ return new java_cup.runtime.Symbol( A4Symbol.RETURN); }
<YYINITIAL>"main"		{ return new java_cup.runtime.Symbol( A4Symbol.MAIN); }
<YYINITIAL>"+"          { return new java_cup.runtime.Symbol( A4Symbol.PLUS); }
<YYINITIAL>"*"          { return new java_cup.runtime.Symbol( A4Symbol.MULTI); }
<YYINITIAL>"if"			{ return new java_cup.runtime.Symbol( A4Symbol.IF); }
<YYINITIAL>"else"		{ return new java_cup.runtime.Symbol( A4Symbol.ELSE); }
<YYINITIAL>">"          { return new java_cup.runtime.Symbol( A4Symbol.GOPR); }
<YYINITIAL>"<"          { return new java_cup.runtime.Symbol( A4Symbol.LOPR); }
<YYINITIAL>"<="         { return new java_cup.runtime.Symbol( A4Symbol.LEOPR); }
<YYINITIAL>">="         { return new java_cup.runtime.Symbol( A4Symbol.GEOPR); }
<YYINITIAL>"=="         { return new java_cup.runtime.Symbol( A4Symbol.EEOPR); }
<YYINITIAL>"!="         { return new java_cup.runtime.Symbol( A4Symbol.NEOPR); }
<YYINITIAL>"for"        { return new java_cup.runtime.Symbol( A4Symbol.FOR); }
<YYINITIAL>"-"          { return new java_cup.runtime.Symbol( A4Symbol.MINUS); }
<YYINITIAL>";"          { return new java_cup.runtime.Symbol( A4Symbol.SEMI); }
<YYINITIAL>","          { return new java_cup.runtime.Symbol( A4Symbol.COMMA); }
<YYINITIAL>"("          { return new java_cup.runtime.Symbol( A4Symbol.LPAR); }
<YYINITIAL>")"          { return new java_cup.runtime.Symbol( A4Symbol.RPAR); }
<YYINITIAL>"{"          { return new java_cup.runtime.Symbol( A4Symbol.LBRA); }
<YYINITIAL>"}"          { return new java_cup.runtime.Symbol( A4Symbol.RBRA); }
<YYINITIAL>"="			{ return new java_cup.runtime.Symbol( A4Symbol.EQUAL); }
<YYINITIAL>"printf"		{ return new java_cup.runtime.Symbol( A4Symbol.PRINTF); }
<YYINITIAL>{ID}         { return new java_cup.runtime.Symbol( A4Symbol.ID); }
<YYINITIAL>{NUMBER}		{ return new java_cup.runtime.Symbol( A4Symbol.NUMBER); }
<YYINITIAL>\"[^\"]*\"   { return new Symbol( A4Symbol.QUOTES); }
<YYINITIAL>"/*" {yybegin(COMMENTS);}
<COMMENTS>"*/" {yybegin(YYINITIAL); }
<COMMENTS>{ID}|{NUMBER}|<QUOTES> {}

<YYINITIAL>"//" {yybegin(INLINECOMMENTS);}
<INLINECOMMENTS>"\r"|"\n" {yybegin(YYINITIAL); }
<INLINECOMMENTS>{ID}|{NUMBER}|<QUOTES> {}

<YYINITIAL>"#" {yybegin(HASH);}
<HASH>"\r"|"\n" {yybegin(YYINITIAL); }
<HASH>{ID}|{NUMBER}|<QUOTES> {}

\r|\n {/* Do nothing */}
. {System.out.println("Error ar:"+yytext());}