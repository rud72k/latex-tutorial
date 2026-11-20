\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{chapterstart}[2025/01/01 Chapter-opener document class]

% ---------- Class options ----------
%   [boxednum]  (default) chapter number in a coloured box
%   [plainnum]  chapter number as large coloured text, no box
\newif\ifchapterbox
\chapterboxtrue
\DeclareOption{boxednum}{\chapterboxtrue}
\DeclareOption{plainnum}{\chapterboxfalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[11pt]{article}

% ---------- Packages ----------
% Page: 2.0in left margin (holds side notes), 1.5in right margin
% (off-margin tables extend into it).
\RequirePackage[left=2.0in,right=1.5in,
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
\definecolor{chapblue}{RGB}{0,71,140}
\definecolor{rulegray}{gray}{0.4}

% ---------- Captions ----------
\captionsetup{font=small, labelfont={bf,color=chapblue}, labelsep=period}

% ---------- Running header (shows current chapter title) ----------
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

% ---------- Chapter number box ----------
% Coloured box, white number. Grows wider automatically for 2-digit numbers.
\newcommand{\chapnumbox}[1]{%
  \begin{tikzpicture}
    \node[fill=chapblue, text=white, inner sep=0.35em,
          minimum width=2.4cm, minimum height=2.4cm,
          font=\bfseries\sffamily\fontsize{60}{60}\selectfont] {#1};
  \end{tikzpicture}%
}

% ---------- Chapter opener ----------
% Usage:
%   \begin{chapterstart}{<number>}{<title>}
%     intro text
%   \end{chapterstart}
\newenvironment{chapterstart}[2]{%
  \clearpage
  \renewcommand{\chaptertitlecurrent}{#2}%
  \noindent
  \ifchapterbox
    \chapnumbox{#1}\par
  \else
    {\fontsize{64}{64}\selectfont\bfseries\sffamily\color{chapblue}#1}\par
  \fi
  \vspace{0.4em}
  {\huge\bfseries\sffamily\MakeUppercase{#2}}\par
  \vspace{0.3em}
  {\color{rulegray}\rule{\linewidth}{1.2pt}}\par
  \vspace{1.2em}
  \large\itshape
}{%
  \par\normalfont\normalsize
  \vspace{1.5em}
}

% ---------- Numbered section header ----------
% Usage: \sectionheader{1.1}{Functions and Their Representations}
\newcommand{\sectionheader}[2]{%
  \par\vspace{2em}%
  \noindent
  {\Large\bfseries\sffamily\color{chapblue}#1}\hspace{0.8em}%
  {\Large\bfseries\sffamily\MakeUppercase{#2}}\par
  \nobreak\vspace{0.6em}\nobreak
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
