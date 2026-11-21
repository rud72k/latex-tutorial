% mybook.cls
% A basic bare-bones class based on the book class.
% Fill in the sections below as you go.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mybook}[2026/11/21 v0.1 My custom book class]

% ------------------------------------------------------------
% 1. BASE CLASS
% Build on the book class. Options not recognized here
% are passed through to book.
% ------------------------------------------------------------
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass[11pt]{book}

% ------------------------------------------------------------
% 2. REQUIRED PACKAGES
% Add \RequirePackage commands for anything you need.
% ------------------------------------------------------------
% \RequirePackage{amsmath}
% \RequirePackage{graphicx}

% ------------------------------------------------------------
% 3. PAGE LAYOUT
% Margins, spacing, text block size.
% ------------------------------------------------------------
% \RequirePackage[margin=1in]{geometry}

% ------------------------------------------------------------
% 4. FONTS
% Font encoding and font packages.
% ------------------------------------------------------------
% \RequirePackage[T1]{fontenc}
% \RequirePackage{lmodern}

% ------------------------------------------------------------
% 5. COLORS
% Color definitions used throughout the book.
% ------------------------------------------------------------
% \RequirePackage{xcolor}
% \definecolor{accent}{RGB}{0,102,204}

% ------------------------------------------------------------
% 6. CHAPTER AND SECTION STYLE
% Customize \chapter, \section, etc. (titlesec works well here).
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
% Hyperlinks, bibliography, index, lists, etc.
% ------------------------------------------------------------
% \RequirePackage{hyperref}

\endinput