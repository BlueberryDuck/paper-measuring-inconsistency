%*******************************************************************************
%  AIGthesis.cls
%
%  LaTeX document class for seminar papers, research lab reports, and proposals 
%  written at the Artificial Intelligence Group.
%
% Adopted from the WeSTThesis.cls template.
%
%*******************************************************************************


%--- Identification ------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{AIGpaper}[2022/09/05 v1.0 Document class for seminar papers, research lab reports, and proposals written at the Artificial Intelligence Group, FernUniversität in Hagen.]


%--- Declaration of variables --------------------------------------------------

\newif\ifenglish

\newif\iffemalemale
\newif\iffemale
\newif\ifmale

\newif\ifgroup

\newif\ifseminar
\newif\ifproposal
\newif\ifresearchlab

\newif\ifscrreprt

\newif\ifdate

\newif\iftimes
\newif\ifpalatino

\newif\ifframes


%--- Initialization of variables -----------------------------------------------

%TODO make this depending on \languagename?
\DeclareOption{english}{\englishtrue}

\DeclareOption{fm}{\femalemaletrue}
\DeclareOption{f}{\femaletrue}
\DeclareOption{m}{\maletrue}

\DeclareOption{group}{\grouptrue}

\DeclareOption{seminar}{\seminartrue}
\DeclareOption{proposal}{\proposaltrue}
\DeclareOption{researchlab}{\researchlabtrue}

\DeclareOption{scrreprt}{\scrreprttrue}

\DeclareOption{date}{\datetrue}

\DeclareOption{times}{\timestrue}

\DeclareOption{palatino}{\palatinotrue}

\DeclareOption{frames}{\framestrue}


%--- Execution of options ------------------------------------------------------

\ProcessOptions

%--- Loading of packages -------------------------------------------------------

\ifscrreprt%
    \LoadClass[a4paper,11pt,titlepage]{scrreprt}
\else
    \LoadClass[a4paper,11pt,titlepage]{scrartcl}
\fi

\RequirePackage{titling}
\RequirePackage{ifoddpage}

% Default: Computer Modern (TeX-Standard)
\iftimes%
    \RequirePackage{times}				% font type Times New Roman
\fi
\ifpalatino%
    \RequirePackage{palatino}			% font type Book Antiqua/Palatino
\fi

\ifframes%
    % showframe option for testing the layout
    \RequirePackage[showframe]{geometry}
\else
    \RequirePackage[]{geometry}
\fi


%--- Code ----------------------------------------------------------------------

\newcommand{\degreecourse}[1]{\def\degreecourse{#1}}

\newcommand{\firstreviewer}[1]{\def\firstreviewer{#1}}
\newcommand{\firstreviewerinfo}[1]{\def\firstreviewerinfo{#1}}

\newcommand{\advisor}[1]{\def\advisor{#1}}
\newcommand{\advisorinfo}[1]{\def\advisorinfo{#1}}

\renewcommand{\abstract}[1]{\def\abstract{#1}}

\newcommand{\monthword}{%
    \ifenglish%
        \ifcase\month%
        \or January\or February\or March\or April\or May\or June\or July
        \or August\or September\or Oktober\or November\or December\fi
    \else
        \ifcase\month%
        \or Januar\or Februar\or M\"arz\or April\or Mai\or Juni\or Juli%
        \or August\or September\or Oktober\or November\or Dezember%
        \fi
    \fi
}

% redefine \maketitle
\renewcommand{\maketitle}{
    \ifenglish%
        \selectlanguage{english}
    \else
        \selectlanguage{ngerman}
    \fi

    % ----- titlepage ------
    \begin{center}
        \renewcommand{\arraystretch}{0.8}
        \begin{minipage}{.5\textwidth}
            \includegraphics[height=1.0cm]{figures/Uni_hagen_logo.png}\\
            \begin{footnotesize}
                \ifenglish%
                    Faculty of Mathematics and Computer Science
                \else
                    Fakultät für Mathematik und Informatik
                \fi
            \end{footnotesize}
        \end{minipage}%
        \hfill%
        \begin{minipage}{.5\textwidth}
            \raggedleft
            \includegraphics[height=1.0cm]{figures/logo_aig_transparent_bg.png} \\
            \begin{footnotesize}
                Artificial Intelligence Group%   
            \end{footnotesize}
        \end{minipage}\\
        \renewcommand{\arraystretch}{1.0} %reset arraystretch to default
        \vspace*{0.9cm}
        \begin{LARGE}
            \textbf{\thetitle}\\[0.5cm]
            \ifseminar%
                \ifenglish%
                    Seminar Paper
                \else
                    Seminararbeit
                \fi
            \else
                \ifproposal%
                    \ifenglish%
                        Thesis Proposal
                    \else
                        % Proposal
                        Exposé
                    \fi
                \else
                    \ifresearchlab%
                        \ifenglish%
                            Research Lab Report
                        \else
                            Fachpraktikumsbericht
                        \fi
                    \else
                        >>SET TYPE (seminar, proposal, researchlab) IN DOCUMENTCLASS OPTIONS<<
                    \fi
                \fi
            \fi
            \\[.1cm]
        \end{LARGE}
        \begin{large}
            \ifenglish%
                submitted by\\
            \else
                vorgelegt von\\
            \fi
        \end{large}
        \begin{Large}
            \theauthor\\[0.5cm]
        \end{Large}
    \end{center}

    % ---- Abstract ------
    \ifenglish
        \selectlanguage{english}
        \begin{center}
            \begin{large}
                \bfseries{Abstract}
            \end{large}
        \end{center}
        \begin{center}
            \begin{minipage}[c]{0.85\textwidth}
                \begin{small}
                    \abstract
                \end{small}
            \end{minipage}
        \end{center}
    \else
        \selectlanguage{ngerman}
        \begin{center}
            \begin{large}
                \bfseries{Zusammenfassung}
            \end{large}
        \end{center}
        \begin{center}
            \begin{minipage}[c]{0.85\textwidth}
                \begin{small}
                    \abstract
                \end{small}
            \end{minipage}
        \end{center}
    \fi

    % --- reset language ---
    \ifenglish
        \selectlanguage{english}
    \else
        \selectlanguage{ngerman}
    \fi
}


\newcommand{\makestatement}[1]{
    \vfill
    % \pagestyle{empty}
    \ifenglish
        \section*{Statement}
        I declare that I have written this seminar paper independently and without
        the unauthorized use of third parties. I have only used the sources and aids
        indicated and have marked the passages taken from them literally or analogously
        as such. The assurance of independent work also applies to any drawings, sketches
        or graphic representations included. The paper has not previously been submitted
        in the same or a similar form to the same or any other examining authority,
        nor has it been published. By submitting the electronic version of the final
        version of the seminar paper, I acknowledge that it can be checked for plagiarism with
        the help of a plagiarism detection service and will be stored exclusively
        for examination purposes.

    \else
        \selectlanguage{ngerman}
        \section*{Erklärung}
        Ich erkläre, dass ich die schriftliche Ausarbeitung zum Seminar selbstständig
        und ohne unzulässige Inanspruchnahme Dritter verfasst habe. Ich habe dabei nur
        die angegebenen Quellen und Hilfsmittel verwendet und die aus diesen wörtlich
        oder sinngemäß entnommenen Stellen als solche kenntlich gemacht. Die Versicherung
        selbstständiger Arbeit gilt auch für enthaltene Zeichnungen, Skizzen oder
        graphische Darstellungen. Die Ausarbeitung wurde bisher in gleicher oder ähnlicher
        Form weder derselben noch einer anderen Prüfungsbehörde vorgelegt und auch nicht
        veröffentlicht. Mit der Abgabe der elektronischen Fassung der endgültigen Version
        der Ausarbeitung nehme ich zur Kenntnis, dass diese mit Hilfe eines
        Plagiatserkennungsdienstes auf enthaltene Plagiate geprüft werden kann und
        ausschließlich für Prüfungszwecke gespeichert wird.
    \fi

    \ifresearchlab
        \vspace{1.5cm}
        \noindent
        \multido{}{#1}{\printauthorline}
    \else
        \vspace{0.5cm}
        \noindent
        \myCity, \today
        \hfill
        % signature is excluded from repo for privacy reasons
        \includegraphics[width=6cm]{figures/signature.png}
        \noindent\makebox[\linewidth]{\dotfill}
        \begin{small}
            \noindent\hfill
            \ifdefined\ifenglish
                (Place, Date)\hfill(Signature)
            \else
                (Ort, Datum)\hfill(Unterschrift)
            \fi
        \end{small}
    \fi
}

\newcommand{\printauthorline}{
    \vspace{1.0cm}
    \\\
    \vspace{0.01cm}
    \noindent
    \dotfill\\
    \begin{small}
        \ifenglish
            (Place, Date)\hfill(Signature)\\
        \else
            (Ort, Datum)\hfill(Unterschrift)\\
        \fi
    \end{small}
}
