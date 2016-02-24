This site uses Jekyll and is served by GitHub Pages.

For local development:

    jekyll serve --watch --incremental

PDF generation on at least mac can run into issues with creating too many open files. On OS X the solution is to temporarily increase the soft maxfiles limit, e.g.:

    sudo launchctl limit maxfiles 512 unlimited
    ulimit -n 512
    ./make-pdf.sh
