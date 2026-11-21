%% ==========================================================================
%%  prodimat.cls  (v2)
%%  Kelas dokumen untuk Artikel Ilmiah 
%%  Program Studi Matematika FST Universitas Terbuka, 
%%  berdasarkan Template-Artikel-Ilmiah-Prodi-Matematika-2025.docx
%%
%%  Opsi:
%%    nonumsec   : judul bagian (section/subsection) tidak diberi nomor
%%
%%  Penomoran:
%%    Definisi/Lema/Teorema/Akibat/Contoh  satu penghitung bersama,
%%                                        tidak direset per bagian (1, 2, 3, ...)
%%    Persamaan     (1), (2), ...         tidak direset per bagian
%%    Gambar        1, 2, ...             penghitung sendiri
%%    Tabel         1, 2, ...             penghitung sendiri
%%    Daftar Pustaka dan Abstrak          tanpa nomor (\section*)
%% ==========================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{prodimat}[2025/01/01 v2 Artikel Ilmiah Prodi Matematika UT]

\newif\if@prodimat@nonumsec
\@prodimat@nonumsecfalse
\DeclareOption{nonumsec}{\@prodimat@nonumsectrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[12pt,a4paper,oneside]{article}

%% ---------- Halaman: A4, margin 2,5 cm, tanpa header ----------
\RequirePackage[a4paper,top=2.5cm,bottom=2.5cm,left=2.5cm,right=2.5cm,%
  headheight=0pt,headsep=0pt,footskip=1.27cm]{geometry}

%% ---------- Huruf: Times New Roman (Times) ----------
\RequirePackage[T1]{fontenc}
\RequirePackage{mathptmx}

%% ---------- Bahasa ----------
%% Nama Gambar/Tabel/Daftar Pustaka dipaksa di bawah (AtBeginDocument),
%% sehingga tetap benar walaupun babel 'indonesian' tidak tersedia.
\IfFileExists{indonesian.ldf}{\RequirePackage[indonesian]{babel}}{%
  \PackageWarning{prodimat}{Bahasa 'indonesian' untuk babel tidak ditemukan; pemenggalan kata memakai default}}

%% ---------- Spasi dan paragraf ----------
\RequirePackage{setspace}
\RequirePackage{etoolbox}
\onehalfspacing                        % spasi 1,5 untuk badan teks
\setlength{\parindent}{1.27cm}         % indentasi baris pertama 1,27 cm (720 twip)
\setlength{\parskip}{0pt}
\@afterindenttrue                      % paragraf pertama setelah judul juga diindentasi

%% ---------- Matematika, teorema, gambar, tabel ----------
\RequirePackage{amsmath,amssymb,amsthm}
\RequirePackage{graphicx}
\RequirePackage{booktabs}
\RequirePackage{caption}

%% ---------- Sitasi dan referensi ----------
\RequirePackage[authoryear,round,sort&compress]{natbib}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage[noabbrev]{cleveref}

%% ==========================================================================
%%  Halaman: nomor halaman di kanan bawah, 10 pt; tanpa header/footer lain
%% ==========================================================================
\makeatletter
\def\ps@prodimat{%
  \let\@mkboth\@gobbletwo
  \def\@oddhead{}\def\@evenhead{}%
  \def\@oddfoot{\hfill{\fontsize{10}{12}\selectfont\thepage}}%
  \let\@evenfoot\@oddfoot}
\pagestyle{prodimat}
\renewcommand*{\ps@plain}{\ps@prodimat}
\makeatother

%% ==========================================================================
%%  Judul bagian: 12 pt tebal; satu baris spasi sebelum sub-judul baru
%% ==========================================================================
\makeatletter
\renewcommand\section{\@startsection{section}{1}{\z@}%
  {21pt plus 2pt minus 2pt}{1pt}%
  {\normalfont\normalsize\bfseries}}
\makeatother
\renewcommand\thesection{\arabic{section}}
\renewcommand\thesubsection{\thesection.\arabic{subsection}}
\makeatletter
\if@prodimat@nonumsec
  \setcounter{secnumdepth}{0}
\else
  \setcounter{secnumdepth}{0}
\fi
\makeatother

%% ==========================================================================
%%  Persamaan: bernomor berurutan di margin kanan, tidak direset per bagian.
%%  Gunakan equation untuk rumus yang diacu; equation* untuk rumus tanpa nomor.
%%  Rujukan: \eqref{label} menghasilkan (1)
%% ==========================================================================
\makeatletter\@removefromreset{equation}{section}\makeatother
\renewcommand\theequation{\arabic{equation}}
\setlength{\abovedisplayskip}{12pt plus 2pt minus 2pt}
\setlength{\belowdisplayskip}{12pt plus 2pt minus 2pt}

%% ==========================================================================
%%  Definisi, Lema, Teorema, Akibat, Contoh: satu penghitung bersama.
%%  Judul (kepala) tebal pada baris sendiri, isi miring, rata kiri-kanan.
%% ==========================================================================
\newtheoremstyle{prodimat}%
  {6pt}{6pt}%                 spasi atas dan bawah
  {\itshape}{0pt}%            font isi (miring), indentasi isi
  {\bfseries}{}%              font kepala (tebal), tanpa tanda baca
  {\newline}%                 isi dimulai pada baris baru
  {\thmname{#1}\thmnumber{ #2}\thmnote{ (#3)}}
\theoremstyle{prodimat}
\newtheorem{definisi}{Definisi}
\newtheorem{lema}[definisi]{Lema}
\newtheorem{teorema}[definisi]{Teorema}
\newtheorem{akibat}[definisi]{Akibat}
\newtheorem{contoh}[definisi]{Contoh}

%% Bukti: "Bukti" tebal, titik miring, isi tegak; diakhiri dengan □
\renewcommand{\qedsymbol}{$\square$}
\renewenvironment{proof}{%
  \par\noindent\textbf{Bukti}\textit{.}\ \ignorespaces}{%
  \ \qedsymbol\par}

%% ==========================================================================
%%  Gambar dan tabel
%%  Judul tabel di atas tabel, judul gambar di bawah gambar; 11 pt; spasi 1,0
%%  Teks di dalam tabel 10 pt
%% ==========================================================================
\DeclareCaptionFont{tnr11}{\fontsize{11}{13}\selectfont}
\captionsetup{font={tnr11,stretch=1},labelfont=normal,textfont=normal,%
  labelsep=period,justification=centering,skip=6pt}
\captionsetup[table]{position=top}
\captionsetup[figure]{position=bottom}
\AtBeginEnvironment{figure}{\singlespacing}
\AtBeginEnvironment{tabular}{\fontsize{10}{12}\selectfont}

%% Sumber gambar: diletakkan di bawah judul gambar, rata tengah.
%% Untuk tabel, tulis sumber di dalam judul: \caption{Judul (Sumber : ...)}
\newcommand{\sumber}[1]{%
  \par\nopagebreak\begingroup\singlespacing\centering
  {\fontsize{11}{13}\selectfont Sumber : #1\par}\endgroup}

%% ==========================================================================
%%  Sampul: judul, penulis, afiliasi, email
%% ==========================================================================
\makeatletter
\newcommand{\judul}[1]{\gdef\@judul{#1}}
\newcommand{\penulis}[1]{\gdef\@penulis{#1}}
\newcommand{\afiliasi}[2]{\g@addto@macro\@afiliasi{\par\textsuperscript{#1}\ #2}}
\newcommand{\email}[2]{\g@addto@macro\@email{\par\textsuperscript{#1}\ \textit{Email: #2}}}
\gdef\@afiliasi{}
\gdef\@email{}
\renewcommand{\maketitle}{%
  \begin{center}\begin{singlespace}
    {\fontsize{14}{17}\selectfont\bfseries\@judul\par}
    \vspace{12pt}
    {\fontsize{12}{14.5}\selectfont\bfseries\@penulis\par}
    \vspace{6pt}
    {\fontsize{12}{14.5}\selectfont\@afiliasi\par\@email\par}
  \end{singlespace}\end{center}
  \vspace{12pt}}
\makeatother

%% ==========================================================================
%%  Abstrak (12 pt, miring, spasi 1,0, rata kiri-kanan) dan Kata Kunci (10 pt)
%% ==========================================================================
\newenvironment{abstrak}{%
  \begin{center}\normalfont\normalsize\bfseries Abstrak\end{center}\par
  \begin{singlespace}\noindent\itshape\ignorespaces}{%
  \end{singlespace}\par}

\newcommand{\katakunci}[1]{%
  \par\begingroup\singlespacing\noindent
  \fontsize{10}{12}\selectfont\textbf{Kata Kunci}: #1\par\endgroup}

%% ==========================================================================
%%  Daftar Pustaka: APA (6th ed.), spasi 1,0, menggantung 1 cm, tanpa jarak antar entri
%% ==========================================================================
\setlength{\bibhang}{1cm}
\setlength{\bibsep}{0pt}
\AtBeginEnvironment{thebibliography}{\singlespacing}

%% ==========================================================================
%%  Nama-nama dalam Bahasa Indonesia
%% ==========================================================================
\AtBeginDocument{%
  \renewcommand{\figurename}{Gambar}%
  \renewcommand{\tablename}{Tabel}%
  \renewcommand{\refname}{Daftar Pustaka}}

%% Nama untuk \cref (menghasilkan "Teorema 3", "Tabel 1 dan Gambar 1")
\crefname{section}{Bagian}{Bagian}
\crefname{subsection}{Subbagian}{Subbagian}
\crefname{figure}{Gambar}{Gambar}
\crefname{table}{Tabel}{Tabel}
\crefname{definisi}{Definisi}{Definisi}
\crefname{lema}{Lema}{Lema}
\crefname{teorema}{Teorema}{Teorema}
\crefname{akibat}{Akibat}{Akibat}
\crefname{contoh}{Contoh}{Contoh}
%% cleveref hanya mendefinisikan penghubung ini untuk bahasa tertentu; definisikan langsung
\def\crefpairconjunction{ dan }
\def\creflastconjunction{ dan }
\def\crefmiddleconjunction{, }

\endinput
