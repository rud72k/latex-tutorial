% myclass.cls
% A basic bare-bones LaTeX class.
% Fill in the sections below as you go.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{basic}[2026/11/21 v0.1 My custom document class]

% ------------------------------------------------------------
% 1. BASE CLASS
% Build on an existing class (article, report, book, etc.).
% Any options not recognized here are passed to the base class.
% ------------------------------------------------------------
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[11pt]{article}

% ------------------------------------------------------------
% 2. REQUIRED PACKAGES
% Add \usepackage commands for anything you need.
% ------------------------------------------------------------
% \RequirePackage{amsmath}
% \RequirePackage{graphicx}

% ------------------------------------------------------------
% 3. PAGE LAYOUT
% Margins, spacing, headers and footers.
% ------------------------------------------------------------
% \RequirePackage[margin=1in]{geometry}

% ------------------------------------------------------------
% 4. FONTS
% Font packages and font settings.
% ------------------------------------------------------------
% \RequirePackage[T1]{fontenc}
% \RequirePackage{lmodern}

% ------------------------------------------------------------
% 5. COLORS
% Color definitions used throughout the document.
% ------------------------------------------------------------
% \RequirePackage{xcolor}
% \definecolor{accent}{RGB}{0,102,204}

% ------------------------------------------------------------
% 6. HEADINGS AND SECTION STYLE
% Customize how \section, \subsection, etc. look.
% ------------------------------------------------------------
% \RequirePackage{titlesec}

% ------------------------------------------------------------
% 7. CUSTOM COMMANDS AND ENVIRONMENTS
% Shortcuts and reusable macros you define yourself.
% ------------------------------------------------------------
% \newcommand{\myname}{Your Name}

% ------------------------------------------------------------
% 8. TITLE PAGE
% Customize \maketitle or define your own title block.
% ------------------------------------------------------------
% \renewcommand{\maketitle}{...}

% ------------------------------------------------------------
% 9. HEADERS, FOOTERS, AND PAGE STYLE
% ------------------------------------------------------------
% \RequirePackage{fancyhdr}
% \pagestyle{fancy}

% ------------------------------------------------------------
% 10. MISC SETTINGS
% Anything else: hyperlinks, bibliography, lists, etc.
% ------------------------------------------------------------
% \RequirePackage{hyperref}

\endinput