%matletter.cls - letter class for mat/ufrgs
%copyright 2015 diego eckhard diegoeck@ufrgs.br

%adapted form
% deletter.cls - Letter class  for DELET/EE/UFRGS
% Copyright (C) 2004..2009 Walter Fetter Lages <w.fetter@ieee.org>
%
% This class was adapted from:
% iiletter.cls - modelo de carta com logotipo do II/UFRGS
% $Id: iiletter.cls,v 4.1 2002/12/07 17:20:09 utug Exp $
% Copyright (C) 2001 UFRGS TeX Users Group
%
% This is free software, distributed under the GNU GPL; please take
% a look in `deletex.cls' to see complete information on using, copying
% and redistributing these files
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{matletter}[2009/08/05 v1.4.0 DeleTeX package - matletter.cls - Letter Documents for UFRGS]
\DeclareOption{english}{\@englishtrue\OptionNotUsed}\newif\if@english
\DeclareOption{promo}{\@promotrue\OptionNotUsed}\newif\if@promo
\DeclareOption{spf}{\@spftrue\OptionNotUsed}\newif\if@spf
\DeclareOption{mat}{\@mattrue\OptionNotUsed}\newif\if@mat
\DeclareOption*{
	\PassOptionsToClass{\CurrentOption}{letter}
}
\ProcessOptions\relax
\LoadClass[a4paper,12pt]{letter}
\RequirePackage[english,brazilian]{babel}
\input{brazilian.babel}
\input{english.babel}
\selectlanguage{brazilian}
\if@english
	\selectlanguage{english}
        \AtBeginDocument{\selectlanguage{english}}
\fi
\RequirePackage{matexdefs}
%
% definicoes padrao
%
\date{Porto~Alegre, \today.}
\newcommand{\estilorodape}{\scriptsize\sffamily\bfseries}
\newcommand{\estilospf}{\sffamily\bfseries}
\address{
	\if@spf
		\ufrgs\\
		\ime\ --- \dmpa\\
	\fi
	Av. Bento Gon\c{c}alves, 9500 --- 91509-900,  Porto~Alegre, RS --- %
	\if@english %
		BRAZIL
	\else %
		Brasil
	\fi %
	\\
	\phonename: \telefone\hspace{2em}\site
}

%
% definicoes internas
%
\def\linha{\rule[1ex]{\textwidth}{2pt}}
\def\cabecalho{
	\if@spf
		\parbox[b]{\textwidth}{\center\spfshield[0.14]\\\estilospf\spf}
	\else
		\parbox[b]{\textwidth}{
		\if@promo
			\ufrgslogo[0.4]
		\else
			\ufrgsshield[0.2]
		\fi
		\if@mat
			\hfill\parbox[b]{0.7\textwidth}{\center\bf\ufrgs\\\ime\\\dmpa}\hfill
			\imlogo[0.33]
		\else
			\hfill\parbox[b]{0.7\textwidth}{\center\bf\ufrgs\\\ee\\\delet}\hfill
			\eelogo[0.33]
		\fi
		\\\linha}

	\fi
}
\def\rodape{\parbox[b]{\textwidth}{
	\linha\\
	\estilorodape\centering\fromaddress
}}

%
% definicao do estilo de pagina (cabecalho e rodape)
%
\def\ps@deletter{
	\let\@evenfoot\@empty
	\let\@evenhead\@empty
	\def\@oddhead{\cabecalho}
	\def\@oddfoot{\rodape}
}
\pagestyle{deletter}
\let\ps@empty\ps@deletter
\let\ps@firstpage\ps@deletter
\let\ps@headings\ps@deletter

%
% margens e etc
%
\setlength{\topmargin}{20mm}			% margem superior
\settoheight{\headheight}{\cabecalho}
\setlength{\headsep}{10mm}			% dist. cabecalho ao texto
\settoheight{\footskip}{\rodape}
	\addtolength{\footskip}{10mm}		% dist. texto ao rodape
\setlength{\textheight}{\paperheight}
	\addtolength{\textheight}{-8mm}		% margem inferior
	\addtolength{\textheight}{-\topmargin}
	\addtolength{\textheight}{-\headheight}
	\addtolength{\textheight}{-\headsep}
	\addtolength{\textheight}{-\footskip}
\setlength{\oddsidemargin}{30mm}		% margem esquerda
\setlength{\evensidemargin}{30mm}		% margem direita
\setlength{\textwidth}{\paperwidth}
	\addtolength{\textwidth}{-\oddsidemargin}
	\addtolength{\textwidth}{-\evensidemargin}
\addtolength{\topmargin}{-1in}
\addtolength{\oddsidemargin}{-1in}
\addtolength{\evensidemargin}{-1in}
\setlength{\parindent}{4em}

%
% redefine o comando opening para nao colocar o endereco
% no canto superior direito
%
\renewcommand*{\opening}[1]{
	{\raggedleft\@date\par}%
	\vspace{2\parskip}%
	{\raggedright\toname \\ \toaddress \par}%
	\vspace{2\parskip}%
	\noindent#1\par\nobreak
}
