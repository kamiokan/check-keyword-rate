# ダウンロード
http://taku910.github.io/mecab/#download

# インストール
## MeCab

$ tar zxfv mecab-0.996.tar
$ cd mecab-0.996
$ ./configure 
$ make
$ make check
$ sudo make install

## IPA 辞書
$ tar zxfv mecab-ipadic-2.7.0-20070801.tar
$ cd mecab-ipadic-2.7.0-20070801
$ ./configure --with-charset=utf8
$ make
$ sudo make install


