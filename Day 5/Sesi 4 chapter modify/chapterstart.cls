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
% Left margin (2.0in) holds side notes; right margin (1.5in) takes
% off-margin tables.
\RequirePackage[left=2.0in,right=1.5in,top=1.0in,bottom=1in,
                marginparwidth=1.5in,marginparsep=0.2in]{geometry}
\RequirePackage{amsmath,amssymb}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{tikz}
\RequirePackage{booktabs}
\RequirePackage{changepage}   % adjustwidth: lets tables extend into margins
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

% ---------- Off-margin table ----------
% Extends into the RIGHT margin by the optional amount (default 1.0in).
% Use tabular* with \linewidth so the table fills the widened area:
%   \begin{widetable}[1.0in]
%     \caption{...}\label{...}
%     \begin{tabular*}{\linewidth}{@{\extracolsep{\fill}}lrr}
%       ... \end{tabular*}
%   \end{widetable}
\newenvironment{widetable}[1][1.0in]{%
  \begin{table}[htbp]
  \begin{adjustwidth}{0pt}{-#1}%
  \centering
}{%
  \end{adjustwidth}
  \end{table}
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
    % title
    \node[anchor=north west, inner sep=0pt, align=left, text width=\chaptitlew,
          font=\Huge\bfseries\sffamily]
          (title) at (\chaptitleoffset,0) {\MakeUppercase{#2}};
    % rule under title
    \draw[black, line width=0.8pt]
          ([yshift=-0.35em]title.south west) -- ++(\chaptitlew,0);
    % intro text
    \node[anchor=north west, inner sep=0pt, align=left, text width=\chaptitlew,
          font=\sffamily\small]
          (intro) at ([yshift=-1.2em]title.south west) {#3};
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
% Boxed section-number cell (same width as the chapter box), with blue
% rules running across to the right margin.
% Usage: \sectionheader{1.1}{Functions and Their Representations}
\newcommand{\sectionheader}[2]{%
  \par\vspace{1.8em}%
  \noindent
  \begin{tikzpicture}[line width=0.8pt, draw=chapblue]
    \draw (0,0) rectangle (\chapboxw,\secheight);
    \draw (\chapboxw,0) -- (\linewidth,0);
    \draw (\chapboxw,\secheight) -- (\linewidth,\secheight);
    \node[anchor=east, xshift=-0.12in, text=chapblue,
          font=\bfseries\sffamily\large]
          at (\chapboxw,0.5*\secheight) {#1};
    \node[anchor=west, xshift=0.15in,
          font=\bfseries\sffamily\small]
          at (\chapboxw,0.5*\secheight) {\MakeUppercase{#2}};
  \end{tikzpicture}\par
  \nobreak\vspace{0.8em}\nobreak
}

% ---------- Figure ----------
% Usage: \chapterfigure{file}{Caption text}
\newcommand{\chapterfigure}[2]{%
  \begin{figure}[htbp]
    \centering
    \includegraphics[width=0.7\linewidth]{#1}
    \caption{#2}
  \end{figure}
}
