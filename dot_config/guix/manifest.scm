;; manifest.scm
;; Research / writing / programming environment

(specifications->manifest
 (list

  ;; =========================
  ;; Core CLI utilities
  ;; =========================

  "ripgrep"
  "fd"
  "tree"
  "htop"

  ;; =========================
  ;; Shell / editors
  ;; =========================

  "emacs"
  "neovim"

  ;; =========================
  ;; Programming languages
  ;; =========================

  "python"
  "python-pip"
  "openjdk"

  ;; =========================
  ;; Python data stack
  ;; =========================

  "python-notebook"

  "python-pandas"
  "python-polars"

  "python-matplotlib"
  "python-seaborn"

  ;; plotnine (ggplot-style plotting)
  "python-plotnine"

  ;; Math & Science
  "python-numpy"
  "python-scipy"

  ;; =========================
  ;; Databases
  ;; =========================

  "sqlite"
  "duckdb"

  ;; =========================
  ;; Document / publishing
  ;; =========================

  ;; "texlive"
  ;; "pandoc"
  ;; best to use pacman or something for these 

  ;; Quarto may or may not exist
  ;; in your current Guix channel.
  ;; If unavailable:
  ;; install manually OR via flatpak.

  ;; "quarto"
  ;; use the cli-bin version

  ;; =========================
  ;; Diagramming / graphics
  ;; =========================

  "graphviz"
  "plantuml"
  "gnuplot"
  "inkscape"

  ;; =========================
  ;; PDF / document tools
  ;; =========================

  "zathura"
  "poppler"

  ;; =========================
  ;; Image utilities
  ;; =========================

  "imagemagick"
  "nsxiv"

  ;; =========================
  ;; Citation / bibliography
  ;; =========================

  "zotero"

  ;; =========================
  ;; Misc workflow tools
  ;; =========================

  
  ))
