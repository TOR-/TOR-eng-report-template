%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Tiarnach Ó Riada's Engineering report class
%% 
%% Sample usage shown below
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\documentclass[article,twocolumn]{TOREngReport}
%
%\begin{document}
%% Define report details
%\TOREngReportDetails{Lab 4|Minor Project Part 1}{EEEN30110 Signals \& Systems}{UCD}{Tiarnach \'O Riada 16315466}
%\maketitle
%
%\pagenumbering{roman}
%\pagestyle{preface}
%\tableofcontents
%\cleardoublepage
%
%\pagenumbering{arabic}
%\pagestyle{body}
%% FOR EACH SECTION
%\include{src/p1}


%% APPENDICES
%\begin{appendix}
%\end{appendix}
%\end{document}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ProvidesClass{TOREngReport}[2019/11/06 Class for engineering reports]
\NeedsTeXFormat{LaTeX2e}
%% Article options
\DeclareOption{article}{
	\DeclareOption{10pt}{\PassOptionsToClass{\CurrentOption}{article}}
	\DeclareOption{twocolumn}{\PassOptionsToClass{\CurrentOption}{article}}
}
\DeclareOption{report}{
	\DeclareOption{10pt}{\PassOptionsToClass{\CurrentOption}{report}}
	\DeclareOption{twocolumn}{\PassOptionsToClass{\CurrentOption}{report}}
}
%\DeclareOption{12pt}{\PassOptionsToClass{\CurrentOption}{article}}
\DeclareOption{problem}{\def\isproblemsheet{1}}
\DeclareOption*{
	\ClassWarning{TOREngReport}{Unknown option '\CurrentOption'}
}
%\ExecuteOptions{10pt}
\ProcessOptions*
\LoadClass[twocolumn]{article}
%\renewcommand{\normalsize}{\fontsize{9}{10}\selectfont}
\setlength{\textwidth}{280mm}
\setlength{\textheight}{193mm}

\RequirePackage[utf8]{inputenc}
\RequirePackage[a4paper,margin=2cm]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{datetime2}
%\RequirePackage{lastpage}
%\RequirePackage[french]{babel}
%\RequirePackage{setspace, booktabs, url}
\RequirePackage{subcaption}
\RequirePackage[pdftex]{graphicx}
\RequirePackage{natbib}
%\RequirePackage{wrapfig}
%\RequirePackage[T1]{fontenc}
\RequirePackage[font=small, labelfont=bf]{caption}
\RequirePackage{helvet}
\RequirePackage{circuitikz}
\RequirePackage{siunitx}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{mathtools}
\RequirePackage{mathrsfs}
\RequirePackage{tikz}
\RequirePackage{tikz-3dplot}
%\RequirePackage[protrusion=true, expansion=true]{microtype}
%\RequirePackage{sectsty}
%\RequirePackage{flafter}
%\RequirePackage{algorithm}
\RequirePackage{booktabs}
%\RequirePackage{listings,xcolor, amssymb}
%\RequirePackage{algorithmicx}
\RequirePackage[toc,page]{appendix}
\RequirePackage{titlesec}

\ifx\isproblemsheet\undefined

\else

	\renewcommand\contentsname{\centering Problems}
	
\fi
\RequirePackage[hidelinks,pdftex,backref,
%pdfauthor=\@authors,
%pdftitle=\@title,
%pdfsubject=\@subject,
%pdfkeywords=\@keywords,
pdfproducer={Latex with hyperref},
pdfcreator={pdflatex}]{hyperref}

\RequirePackage{cleveref}
%\graphicspath{ {./images/} }

\DeclareCaptionType{captioneq}[][List of equations]
\captionsetup[captioneq]{labelformat=simple}
\renewcommand{\captioneqname}{Equation}
\newcommand{\HRule}[1]{\rule{\linewidth}{#1}}
%\onehalfspacing
\setcounter{tocdepth}{5}
\setcounter{secnumdepth}{5}

% Reference formatting
\def\sectionautorefname{\S}
\def\subsectionautorefname{\S}
\def\subsubsectionautorefname{\S}
\def\algorithmautorefname{Algorithm}
\renewcommand{\ref}[1]{\cref{#1}}

% Counter formatting
\renewcommand\theenumi{\roman{enumi}}
\renewcommand\theenumii{\alph{enumii}}
\renewcommand\theenumiii{\roman{enumiii}}

% MATHS BITS
\DeclarePairedDelimiter\abs{\lvert}{\rvert}%
\DeclarePairedDelimiter\norm{\lVert}{\rVert}%

% Frames
\DeclareRobustCommand*{\ora}{\overrightarrow}
\newcommand{\Frame}[1]{$\ora{E}$\textsuperscript{#1}}
\newcommand{\mFrame}[1]{\ora{E}^{#1}}
\newcommand{\axis}[2]{\Frame{#1}\textsubscript{#2}}
\newcommand{\maxis}[2]{\mFrame{#1}_{#2}}

% Vectors
\renewcommand{\vec}[1]{\textbf{\textit{#1}}}
\newcommand{\tvec}[1]{$\ora{#1}$}
\newcommand{\mvec}[1]{\ora#1}
\newcommand{\colvec}[1]{\underline{#1}}

% Matrices
\newcommand{\mat}[1]{\textbf{$\mathcal{#1}$}}
\newcommand{\sqmat}[1]{\underline{\underline{#1}}}

% Transformy bois
\def\fourier{\mathscr{F}}
\newcommand\series[2]{\mathcal{S}_n\left(#1{\scriptstyle \left(#2\right)}\right)}
\newcommand\transform[1]{\mathscr{#1}}

% Exponential
\renewcommand{\exp}[1]{e^{#1}}

% Fancy equals
\newcommand{\equalexpl}[1]{%
	\underset{\substack{\uparrow\\\mathrlap{\text{\hspace{-1em}#1}}}}{=}}

\newcommand{\mLabel}[1]{\mbox{$\textstyle{#1}$}}
%-------------------------------------------------------------------------------
% HEADER & FOOTER
%-------------------------------------------------------------------------------
\pagestyle{fancy}
\fancyhf{}

\fancypagestyle{body}{
	\setlength\headheight{15pt}
	\fancyhead[L]{\thesubject}
	\fancyhead[R]{\theinstitution}
	\fancyfoot[L]{\theauthors}
	\fancyfoot[R]{\thepage}

	\renewcommand{\headrulewidth}{1pt}
	\renewcommand{\footrulewidth}{1pt}
}
\fancypagestyle{preface}{
	\setlength\headheight{15pt}
	\fancyhead[L]{\thesubject}
	\fancyhead[R]{\theinstitution}
	\fancyfoot[L]{\theauthors}
	\fancyfoot[R]{\thepage}

	\renewcommand{\headrulewidth}{1pt}
	\renewcommand{\footrulewidth}{1pt}
}

%% TABLE OF CONTENTS
%\renewcommand{\cfttoctitlefont}{\hfill\Huge}

%% --------------------------------
\def\thetitle{ }
\def\thesubject{ }
\def\theinstitution{ }
\def\theauthors{ }
\newcommand{\TOREngReportDetails}[4]{
	\def\thetitle{#1}
	\def\thesubject{#2}
	\def\theinstitution{#3}
	\def\theauthors{#4}
}

%
% TITLE PAGE
%
\renewcommand{\maketitle}{
	\pagenumbering{gobble}
	\begin{titlepage}
		\thispagestyle{plain}
		\vspace*{\fill}
		\centering
		{\thesubject}\\
		\bigskip
		\textbf{\Huge \thetitle}\\
		\smallskip
		{\normalsize \textbf{\theauthors}}\\
		\smallskip
		{\normalsize \DTMtoday}
		\vspace*{\fill}
	\end{titlepage}
	\clearpage
}

\crefname{lstlisting}{listing}{listings}
\Crefname{lstlisting}{Listing}{Listings}
%%
% Custom sections
% QUESTION
\newcounter{question}[section]
\newcommand\question{\refstepcounter{question}{\Large\bfseries Question \thequestion} 
	\addcontentsline{toc}{section}{Question \thequestion}
	\\\smallskip}
%PROBLEM
\newcounter{problem}[section]
\newcommand\problem{\refstepcounter{problem}{\normalfont\Large\bfseries Problem \theproblem} 
	\addcontentsline{toc}{section}{Problem \theproblem}
	\\\smallskip}
%%%%%%%%%%%%
%% FLOATS %%
%%%%%%%%%%%%
%\usepackage[nomarkers,figuresonly]{endfloat}
%\renewcommand{\listoffigures}{}


%%%%%%%%%%%%
%% IMAGES %%
%%%%%%%%%%%%
\graphicspath{ {./img/} }
