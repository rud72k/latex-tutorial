\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{textbookchapter}[2026/11/21 v1.0 Textbook chapter openings]
\LoadClassWithOptions{book}

\RequirePackage{iftex}
\RequirePackage{amsmath}
\ifPDFTeX
  \RequirePackage[T1]{fontenc}
  \RequirePackage{tgtermes}
  \RequirePackage[scale=1]{tgheros}
  \RequirePackage{newtxmath}
\else
  \RequirePackage[no-math]{fontspec}
  \setmainfont{texgyretermes}[
    Extension=.otf, UprightFont=*-regular, BoldFont=*-bold,
    ItalicFont=*-italic, BoldItalicFont=*-bolditalic]
  \setsansfont{texgyreheros}[
    Extension=.otf, UprightFont=*-regular, BoldFont=*-bold,
    ItalicFont=*-italic, BoldItalicFont=*-bolditalic]
  \RequirePackage{unicode-math}
  \setmathfont{texgyretermes-math.otf}
\fi
\RequirePackage{microtype}
\RequirePackage{geometry}
\RequirePackage{xcolor}
\RequirePackage{tikz}
\RequirePackage{fancyhdr}
\RequirePackage{hyperref}
\RequirePackage{etoc}

\geometry{hmargin=.185\paperwidth, top=80.4bp, bottom=72bp,
  headheight=14pt, headsep=20pt}
\hypersetup{hidelinks}
\raggedbottom

% Public palette and labels. Redefine these in the document preamble.
\definecolor{ChapterAccent}{HTML}{00C0F2}
\definecolor{ChapterPale}{HTML}{E5F7FD}
\definecolor{ChapterInk}{HTML}{000000}
\newcommand*\chaptercontentsname{Chapter Contents}
\newcommand*\chapterintroductionname{Introduction}

% Opening pages use the same horizontal proportions as the reference.
% All coordinates are relative to the upper left of the chapter heading.
\newcommand*\textbook@label[1]{\textls[75]{\MakeUppercase{#1}}}
\newcommand*\textbook@chapterheading[1]{%
  \par\nointerlineskip
  \moveleft 41bp\hbox{%
    \begin{tikzpicture}[inner sep=0pt, outer sep=0pt]
      % Reserve room for a two-line title. Taller titles extend the box.
      \path (0,0) (\dimexpr\textwidth+82bp\relax,-100bp);
      \fill[ChapterInk] (0,0) rectangle (5.64bp,-23.28bp);
      \fill[ChapterInk] (109.4bp,0) rectangle ++(14.82bp,-23.28bp);
      \fill[ChapterAccent] (\dimexpr\textwidth+75.65bp\relax,0)
        rectangle ++(6.35bp,-23.28bp);
      \node[anchor=base, text=ChapterInk] at (52bp,-16.67bp)
        {\sffamily\bfseries\fontsize{12.7bp}{15bp}\selectfont
         \textbook@label{\@chapapp}};
      \node[anchor=base, text=ChapterInk] at (49.2bp,-88.35bp)
        {\sffamily\bfseries\fontsize{67.03bp}{67.03bp}\selectfont\thechapter};
      \node[anchor=base west, text=ChapterInk] at (113bp,-58.24bp)
        {\parbox[t]{\dimexpr\textwidth-37.4bp\relax}{%
          \raggedright\sffamily\mdseries\fontsize{28.22bp}{33.85bp}\selectfont
          \hyphenpenalty=10000\relax #1\par}};
    \end{tikzpicture}%
  }%
  \nobreak\vskip 32.7bp\relax
}

% Keep book's chapter counter, optional short title, marks, and TOC entry.
\renewcommand*\@makechapterhead[1]{%
  \ifnum\c@secnumdepth>\m@ne
    \if@mainmatter
      \thispagestyle{empty}%
      \textbook@chapterheading{#1}%
    \else
      \@makeschapterhead{#1}%
    \fi
  \else
    \@makeschapterhead{#1}%
  \fi
}

\renewcommand*\@makeschapterhead[1]{%
  \nointerlineskip
  \hbox{\textcolor{ChapterAccent}{\rule{6.35bp}{23.28bp}}}%
  \nobreak\vskip 13bp\relax
  {\parindent=0pt\raggedright\normalfont\sffamily\color{ChapterInk}%
    \fontsize{28.22bp}{33.85bp}\selectfont #1\par}%
  \nobreak\vskip 23bp\relax
}

% The square pairs sit just outside the text measure.
\newcommand*\textbook@panelmarkers{%
  \par\nointerlineskip
  \moveleft 16.9bp\hbox to\dimexpr\linewidth+33bp\relax{%
    \color{ChapterPale}\rule{5.64bp}{5.64bp}\hfil\rule{5.64bp}{5.64bp}}%
}
\newcommand*\textbook@panelheading[1]{%
  \textbook@panelmarkers
  \nobreak\vskip 24.9bp\relax\nointerlineskip
  \hbox{\sffamily\bfseries\color{ChapterAccent}%
    \fontsize{11.29bp}{13.6bp}\selectfont\textbook@label{#1}}%
}
\newcommand*\textbook@paneltext{%
  \normalfont\fontsize{10.58bp}{13.617bp}\selectfont
}

% Chapter contents pull their titles and targets from the standard TOC.
% Each row is a paragraph, so wrapped titles keep their hanging indent.
\newsavebox\textbook@entrylabel
\newlength\textbook@numbercolumn
\newcommand*\textbook@contentsrow[1]{%
  \begingroup
    \leftskip=#1\relax\rightskip=0pt plus 2em\relax
    \noindent\llap{\usebox\textbook@entrylabel\hspace{5.3bp}}%
    \rule[-3bp]{0pt}{13.617bp}\etocname\par
  \endgroup
}
\newcommand*\textbook@sectionentry{%
  \etocifnumbered
    {\sbox\textbook@entrylabel{\color{ChapterAccent}\bfseries\etocthenumber.}}%
    {\sbox\textbook@entrylabel{}}%
  \@tempdima=\dimexpr\wd\textbook@entrylabel+5.3bp\relax
  \ifdim\@tempdima<\textbook@numbercolumn
    \@tempdima=\textbook@numbercolumn
  \fi
  \textbook@contentsrow{\@tempdima}%
}
\newcommand*\textbook@subsectionentry{%
  \sbox\textbook@entrylabel{\color{ChapterAccent}\textbullet}%
  \textbook@contentsrow{\dimexpr\textbook@numbercolumn+23.1bp\relax}%
}

\NewDocumentCommand\chaptercontents{O{\chaptercontentsname}}{%
  \par\begingroup
    \let\textbook@savedhref\@currentHref
    \textbook@paneltext
    \settowidth\textbook@numbercolumn{\bfseries\thechapter.9.\hspace{5.3bp}}%
    \setlength\parskip{3.53bp}%
    \etocsetnexttocdepth{subsection}%
    \etocsetstyle{section}{}{}{\textbook@sectionentry}{}%
    \etocsetstyle{subsection}{}{}{\textbook@subsectionentry}{\addvspace{3.53bp}}%
    \etocchecksemptiness
    \etocsettocstyle
      {\textbook@panelheading{#1}\nobreak\vskip 14.25bp\relax\nointerlineskip}%
      {\nobreak\vskip 16.9bp\relax\textbook@panelmarkers\vskip 14.1bp\relax}%
    \localtableofcontents*\relax
    % Keep a following \label attached to the chapter's hyperlink target.
    \global\let\@currentHref\textbook@savedhref
  \endgroup
}

\NewDocumentEnvironment{chapterintroduction}{O{\chapterintroductionname}}{%
  \par
  \textbook@paneltext
  \raggedright
  \textbook@panelheading{#1}%
  \nobreak\vskip 17.25bp\relax\nointerlineskip
  \@afterindentfalse\@afterheading
  \ignorespaces
}{\par\ignorespacesafterend}

% Book-wide contents. The depth can be set separately from the chapter list.
\setcounter{tocdepth}{2}
\etocsettocstyle{%
  \chapter*{\contentsname}%
  \pdfbookmark[0]{\contentsname}{\@currentHref.contents}%
  \@mkboth{\contentsname}{\contentsname}%
}{}
\renewcommand*\l@chapter[2]{%
  \ifnum\c@tocdepth>\m@ne
    \addpenalty{-\@highpenalty}\addvspace{12bp}%
    \begingroup
      \sffamily\bfseries
      \let\textbook@tocnumberline\numberline
      \def\numberline##1{\textbook@tocnumberline{\textcolor{ChapterAccent}{##1}}}%
      \@dottedtocline{0}{0em}{2em}{#1}{#2}%
    \endgroup
  \fi
}
\renewcommand*\l@section{\@dottedtocline{1}{2em}{2.8em}}
\renewcommand*\l@subsection{\@dottedtocline{2}{4.8em}{3.6em}}

% Regular pages use sans-serif headings and folios to echo the openers.
\renewcommand*\section{\@startsection{section}{1}{\z@}%
  {-3.5ex\@plus -1ex\@minus -.2ex}{2.3ex\@plus .2ex}%
  {\normalfont\sffamily\Large\bfseries}}
\renewcommand*\subsection{\@startsection{subsection}{2}{\z@}%
  {-3.25ex\@plus -1ex\@minus -.2ex}{1.5ex\@plus .2ex}%
  {\normalfont\sffamily\large\bfseries}}
\renewcommand*\@seccntformat[1]{%
  \textcolor{ChapterAccent}{\csname the#1\endcsname}\quad
}
\renewcommand*\chaptermark[1]{%
  \markboth{\ifnum\c@secnumdepth>\m@ne\if@mainmatter
    \thechapter.\enspace\fi\fi #1}{}%
}
\fancypagestyle{textbook}{%
  \fancyhf{}%
  \fancyhead[L]{\small\sffamily\nouppercase{\leftmark}}%
  \fancyhead[R]{\small\sffamily\bfseries\textcolor{ChapterAccent}{\thepage}}%
  \renewcommand*\headrulewidth{0pt}%
}
\pagestyle{textbook}

\endinput
