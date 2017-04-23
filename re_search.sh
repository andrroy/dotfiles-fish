install_re_search() {
	  mkdir /tmp/re-search
    git clone https://github.com/jbonjean/re-search /tmp/re-search
    make -C /tmp/re-search
    cp /tmp/re-search/re-search /usr/local/bin
		chmod +x /usr/local/bin/re-search
}
