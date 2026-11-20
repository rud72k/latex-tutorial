\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{chapterstart}[2025/01/01 Chapter-opener document class]

% ---------- Class options ----------
%   [boxednum]  (default) chapter number in a white box with blue border
%   [plainnum]  chapter number as large blue text, no box
\newif\ifchapterbox
\chapterboxtrue
\DeclareOption{boxednum}{\chapterboxtrue}
\DeclareOption{plainnum}{\chapterboxfalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[11pt]{article}

% ---------- Packages ----------
% Wider page (10in x 11in). The left margin (2.4in) holds side notes,
% margin tables and margin captions; the right margin (2.1in) takes
% tables that overhang to the right.
\RequirePackage[paperwidth=10in,paperheight=11in,
                left=2.4in,right=2.1in,top=1.0in,bottom=1in,
                marginparwidth=1.6in,marginparsep=0.2in]{geometry}
\RequirePackage{amsmath,amssymb}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{tikz}         % also provides \pgfkeys
\RequirePackage{booktabs}
\RequirePackage{changepage}   % adjustwidth: lets tables overhang into margins
\RequirePackage{caption}
\RequirePackage{fancyhdr}

% ---------- Colours ----------
\definecolor{chapblue}{RGB}{0,173,239}   % sampled from the sample PDF

% ---------- Dimensions ----------
\newlength{\chapboxw}         % width of chapter box and section-number cell
\setlength{\chapboxw}{1.25in}
\newlength{\chapgap}          % gap between chapter box and title
\setlength{\chapgap}{0.2in}
\newlength{\chaptitlew}       % width of the title/intro column (set automatically)
\newlength{\chaptitleoffset}  % distance from the left edge to the title column
\newlength{\secheight}        % height of the section header bar
\setlength{\secheight}{0.28in}
\newlength{\secoffset}        % how far the section header extends into the left margin
\setlength{\secoffset}{\dimexpr\marginparwidth+\marginparsep\relax}
\newlength{\secwidth}         % total width of the section header (set automatically)

% ---------- Captions ----------
\captionsetup{font=small, labelfont={bf,color=chapblue}, labelsep=period}

% ---------- Running header (current chapter title) ----------
\newcommand{\chaptertitlecurrent}{}
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\fancyhead[L]{\small\sffamily\MakeUppercase{\chaptertitlecurrent}}
\fancyhead[R]{\small\sffamily\thepage}

% ---------- Paragraph layout ----------
\setlength{\parindent}{0pt}
\setlength{\parskip}{0.8em}

% ---------- Side notes (annotations) ----------
% Placed in the LEFT margin, aligned to the text block.
% Usage: \sidenote{text}
\reversemarginpar
\newcommand{\sidenote}[1]{%
  \marginpar{\raggedleft\sffamily\footnotesize\color{chapblue}#1}%
}

% ---------- Tables: margin or off-margin ----------
% Optional argument (key=value):
%   place=margin   table sits in the LEFT margin, beside the text (sample style)
%   place=right    table overhangs into the RIGHT margin (default)
%   extend=<len>   how far place=right overhangs (default 1.0in)
%
% Put \caption{...} and \label{...} inside the environment, before the tabular.
%   \begin{widetable}[place=margin]
%     \caption{...}\label{tab:x}
%     \begin{tabular*}{\linewidth}{@{\extracolsep{\fill}}lr} ... \end{tabular*}
%   \end{widetable}
\pgfkeys{/chapterstart/table/.cd,
  place/.store in=\cs@tableplace,
  extend/.store in=\cs@tableextend,
  place=right,
  extend=1.0in,
}
\def\cs@marginword{margin}
\newsavebox{\cs@tablebox}

% Caption shown in the margin (used for place=margin)
\newcommand{\cs@margincaption}[1]{%
  \refstepcounter{table}%
  {\raggedleft\sffamily\bfseries\footnotesize TABLE~\thetable\par}%
  {\raggedleft\sffamily\footnotesize #1\par}%
  \medskip
}

\newenvironment{widetable}[1][]{%
  \pgfkeys{/chapterstart/table/.cd, place=right, extend=1.0in, #1}%
  \ifx\cs@tableplace\cs@marginword
    \let\caption\cs@margincaption
    \setbox\cs@tablebox\vbox\bgroup
    \begin{minipage}{\marginparwidth}%
    \small
  \else
    \begin{table}[htbp]
    \centering
    \begin{adjustwidth}{0pt}{-\cs@tableextend}%
  \fi
}{%
  \ifx\cs@tableplace\cs@marginword
    \end{minipage}%
    \egroup
    \marginpar{\box\cs@tablebox}%
  \else
    \end{adjustwidth}%
    \end{table}%
  \fi
}

% ---------- Chapter opener ----------
% Chapter box on the left (white fill, blue border, blue number),
% title, rule and intro text on the right. The box automatically
% runs down to the bottom of the intro text, like the sample.
% Usage:
%   \chapteropener{<number>}{<title>}{<intro text>}
\newcommand{\chapteropener}[3]{%
  \clearpage
  \thispagestyle{plain}%
  \renewcommand{\chaptertitlecurrent}{#2}%
  \setlength{\chaptitlew}{\dimexpr\linewidth-\chapboxw-\chapgap\relax}%
  \setlength{\chaptitleoffset}{\dimexpr\chapboxw+\chapgap\relax}%
  \noindent
  \begin{tikzpicture}[baseline=(current bounding box.north)]
    % title (set in a parbox so hyphenation settings are respected)
    \node[anchor=north west, inner sep=0pt]
          (title) at (\chaptitleoffset,0)
          {\parbox[t]{\chaptitlew}{\raggedright\Huge\bfseries\sffamily
            \lefthyphenmin=99 \righthyphenmin=99 \MakeUppercase{#2}}};
    % rule under title
    \draw[black, line width=0.8pt]
          ([yshift=-0.35em]title.south west) -- ++(\chaptitlew,0);
    % intro text
    \node[anchor=north west, inner sep=0pt]
          (intro) at ([yshift=-1.2em]title.south west)
          {\parbox[t]{\chaptitlew}{\raggedright\sffamily\small #3}};
    \coordinate (introbottom) at (intro.south west);
    \ifchapterbox
      % box: top at the title, bottom at the bottom of the intro
      \draw[draw=chapblue, fill=white, line width=0.8pt]
            (0,0) rectangle (\chapboxw,0|-introbottom);
      % blue number, top right inside the box
      \node[anchor=north east, inner sep=0pt, text=chapblue,
            font=\bfseries\sffamily\fontsize{48}{48}\selectfont]
            at ([xshift=-0.12in, yshift=-0.08in]\chapboxw,0) {#1};
    \else
      % plain blue number, no box
      \node[anchor=north east, inner sep=0pt, text=chapblue,
            font=\bfseries\sffamily\fontsize{64}{64}\selectfont]
            at (\chapboxw,0) {#1};
    \fi
  \end{tikzpicture}\par
  \normalfont\normalsize
  \vspace{1.5em}
}

% ---------- Section header ----------
% Boxed section-number cell (same width as the chapter box) with blue
% rules. The header starts in the left margin (by \secoffset) and ends
% at the right edge of the text block, as in the sample.
% Usage: \sectionheader{1.1}{Functions and Their Representations}
\newcommand{\sectionheader}[2]{%
  \par\vspace{1.8em}%
  \setlength{\secwidth}{\dimexpr\linewidth+\secoffset\relax}%
  \noindent\hspace*{-\secoffset}%
  \begin{tikzpicture}[line width=0.8pt, draw=chapblue]
    \draw (0,0) rectangle (\chapboxw,\secheight);
    \draw (\chapboxw,0) -- (\secwidth,0);
    \draw (\chapboxw,\secheight) -- (\secwidth,\secheight);
    \node[anchor=east, xshift=-0.12in, text=chapblue,
          font=\bfseries\sffamily\large]
          at (\chapboxw,0.5*\secheight) {#1};
    \node[anchor=west, xshift=0.15in,
          font=\bfseries\sffamily\small]
          at (\chapboxw,0.5*\secheight) {\MakeUppercase{#2}};
  \end{tikzpicture}\par
  \nobreak\vspace{0.8em}\nobreak
}

% ---------- Figure with caption in the margin ----------
% The image is placed in the text flow (not a float, because margin notes
% cannot go inside floats). The caption sits in the left margin,
% bottom-aligned with the image.
% Usage: \chapterfigure[label]{file}{Caption text}
\newsavebox{\cs@figbox}
\newcommand{\cs@figcaption}[1]{%
  {\raggedleft\sffamily\bfseries\footnotesize FIGURE~\thefigure\par}%
  {\raggedleft\sffamily\footnotesize #1\par}%
}
\newcommand{\chapterfigure}[3][]{%
  \par\addvspace{0.8em}%
  \refstepcounter{figure}%
  \def\cs@figlabel{#1}%
  \ifx\cs@figlabel\empty\else\label{#1}\fi%
  \sbox{\cs@figbox}{\includegraphics[width=0.7\linewidth]{#2}}%
  \noindent
  \marginpar{%
    \begin{minipage}[b][\dimexpr\ht\cs@figbox+\dp\cs@figbox\relax][b]{\marginparwidth}%
      \cs@figcaption{#3}%
    \end{minipage}%
  }%
  \makebox[\linewidth][c]{\usebox{\cs@figbox}}\par
  \addvspace{0.8em}%
}
