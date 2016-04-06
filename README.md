This site uses Jekyll and is served by GitHub Pages.

For local development, use bundler:

    bundle install
    jekyll serve --incremental

It has been observed that the "--incremental" option doesn't play well with changes in the structure. If you add new chapters or change the name of the existing ones, you may have to start without the incremental option.

PDF generation on at least mac can run into issues with creating too many open files. On OS X you must temporarily increase the soft maxfiles limit, e.g.:

    sudo launchctl limit maxfiles 512 unlimited
    ulimit -n 512
    ./make-pdf.sh
