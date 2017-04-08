install_re_search() {
    git clone https://github.com/jbonjean/re-search /tmp
    make -C /tmp/re-search
    cp /tmp/re-search/re-search /usr/local/bin
}