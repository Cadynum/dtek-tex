\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dtekprotokoll}[2013/04/07 Datateknologsektionen Chalmers]

\newif\iftwojust
\twojustfalse
\DeclareOption{twojust}{\twojusttrue}

\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{dtek}
}

\ProcessOptions\relax

\LoadClass{dtek}

\DeclareDocumentCommand \motesnummer {m} {%
  \DeclareDocumentCommand \@motesnummer {}{#1}
}
\DeclareDocumentCommand \verksamhetsar {m} {%
  \DeclareDocumentCommand \@verksamhetsar {}{#1}
}
\DeclareDocumentCommand \start {m} {%
  \DeclareDocumentCommand \@start {}{#1}
}
\DeclareDocumentCommand \plats {m} {%
  \DeclareDocumentCommand \@plats {}{#1}
}

\NewDocumentCommand \funktionar {ommm} {%
  \IfNoValueTF {#1}
  {}
  {\global\expandafter\def\csname #1\endcsname{#3}}
  #2 & #3 & #4\\
}

\DeclareDocumentEnvironment {funktionarer} {} {%
  Närvarande:
  
  \begin{tabular}{l l l}
    \itshape Funktion & \itshape Namn & \itshape E-mail\\
}{%
  \end{tabular}
}

\DeclareDocumentCommand \beslut {} {%
  \begin{flushright}
    \textbf{[Beslut]}
  \end{flushright}
}

\DeclareDocumentCommand \maketitle {} {%
  {\centering \bf{\LARGE{\@title\ \@date}}\par}
  
  Kl: \@start\\
  Mötesnummer: \@motesnummer\ - \@verksamhetsar\\
  Plats: \@plats
}

\DeclareDocumentCommand \makesigns {m m o o} {%
  \parbox{\textwidth}{%
    \makesign{Sekreterare #1}
    
    \makesign{Mötesordförande #2}

    \IfValueTF{#3}{%
      \makesign{Justerare #3}
    }{}

    \IfValueTF{#4}{%
      \makesign{Justerare #4}
    }{}
  }
}

\RenewDocumentCommand \makeheadfoot {}{%
  \@makehf

  \cfoot{%
    \vspace{0.55cm}
    \parbox{26pt}{%
      \centering
      \rule{25pt}{0.5pt}\\
      Sekr.
    }
    \hspace{1pt}
    \parbox{26pt}{%
      \centering
      \rule{25pt}{0.5pt}\\
      Ordf.
    }
    \hspace{1pt}
    \iftwojust
      \parbox{54pt}{%
        \centering
        \rule{25pt}{0.5pt}\hspace{4pt}\rule{25pt}{0.5pt}\\
        Justerare
      }
    \else
      \parbox{26pt}{%
        \centering
        \rule{25pt}{0.5pt}\\
        Just.
      }
    \fi
  }
  \rhead{%
    Sidan \thepage\ av \pageref{LastPage}\\
    \@date \\
    Mötesnr. \@motesnummer\ - \@verksamhetsar
  }
}

\endinput