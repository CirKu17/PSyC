### PSyC ####

PSYCPATH=psyc_dir_path
PSYCHOPATH=gpg_key_user_ID
MENTALBACKUP=dropbox_or_w/e_path

function psyc-copy() {

    if [ -z "$1" ]; then
        echo "[!] Missing parameter"
        echo "usage $0 <target id of pwstorage db>"
    else
        echo "[*] Copying to clipboard.."
        gpg --quiet --yes -o /tmp/pwstorage_db.xml -d $PSYCPATH/pwstorage_db.xml.gpg
        xml_grep "target[@id=\"$1\"]/passphrase" /tmp/pwstorage_db.xml --strict --text_only | xclip
    fi

    shred /tmp/pwstorage_db.xml && rm /tmp/pwstorage_db.xml
}

function psyc-add() {

    gpg --yes -o /tmp/pwstorage_db.xml -d $PSYCPATH/pwstorage_db.xml.gpg
    cd $PSYCPATH
    perl pwstorage.pl
    gpg --yes -o $PSYCPATH/pwstorage_db.xml.gpg -e -R $PSYCHOPATH /tmp/pwstorage_db.xml
    cd $OLDPWD
    shred /tmp/pwstorage_db.xml && rm /tmp/pwstorage_db.xml
}

function psyc-mod() {

    gpg --yes -o /tmp/pwstorage_db.xml -d $PSYCPATH/pwstorage_db.xml.gpg
    $EDITOR /tmp/pwstorage_db.xml
    gpg --yes -o $PSYCPATH/pwstorage_db.xml.gpg -e -R $PSYCHOPATH /tmp/pwstorage_db.xml
    shred /tmp/pwstorage_db.xml && rm /tmp/pwstorage_db.xml
}

alias psyc-see='gpg -d $PSYCPATH/pwstorage_db.xml.gpg | less '
alias psyc-sync='cp -R $PSYCPATH/pwstorage_db.xml.gpg $MENTALBACKUP '
