#source: "https://pkg.go.dev/github.com/gokcehan/lf?utm_source=godoc#hdr-Syntax"

# My custom commands

#make a dir
cmd mkdir ${{
    printf "Dir Name: "
    read ans
    mkdir $ans
}}

#make a file
cmd touch ${{
    printf "File Name: "
    read ans
    touch $ans
}}

#open file based on type
cmd open ${{
    test -L $f && f=$(readlink -f $f)
    case $(file --mime-type $f -b) in
        text/*) nvim $fx;;
        *) for f in $fx; do xdg-open $f > /dev/null 2> /dev/null & done;;
    esac
}}

#remove a file/dir
cmd rm ${{
    set -f
    printf "$fx\n"
    printf "delete?[y/n]"
    read ans
    [ $ans = "y" ] && rm -rf $fx
}}

#ex(tract) an archive
cmd ex ${{
  case "$f" in
    *.tar.bz2) tar xjf "$f"   ;;
    *.tar.gz)  tar xzf "$f"   ;;
    *.bz2)     bunzip2 "$f"   ;;
    *.rar)     unrar x "$f"   ;;
    *.gz)      gunzip "$f"    ;;
    *.tar)     tar xf "$f"    ;;
    *.tbz2)    tar xjf "$f"   ;;
    *.tgz)     tar xzf "$f"   ;;
    *.zip)     unzip "$f"     ;;
    *.Z)       uncompress "$f";;
    *.7z)      7z x "$f"      ;;
    *)         printf "Unsupported format." ;;
  esac
}}
