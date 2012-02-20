### PSyC ####

PSYCPATH=psyc_dir_path
PSYCHOPATH=gpg_key_user_ID

function psyc-copy() {

    if [ -z "$1" ]; then
        echo "[!] Missing parameter"
        echo "usage $0 <target id of pwstorage db>"
    else
        echo "[*] Copying to clipboard.."
        gpg --yes -o /tmp/pwstorage_db.xml -d $PSYCPATH/pwstorage_db.xml.gpg
        xml_grep "target[@id=\"$1\"]/passphrase" /tmp/pwstorage_db.xml --strict --text_only | xclip
    fi

    shred -u /tmp/pwstorage_db.xml
}

function psyc-add() {

    gpg --yes -o /tmp/pwstorage_db.xml -d $PSYCPATH/pwstorage_db.xml.gpg
    $PSYCPATH
    perl pwstorage.pl
    gpg --yes -o $PSYCPATH/pwstorage_db.xml.gpg -e -R $PSYCHOPATH /tmp/pwstorage_db.xml
    $OLDPWD
    shred -u /tmp/pwstorage_db.xml
}

function psyc-mod() {

    gpg --yes -o /tmp/pwstorage_db.xml -d $PSYCPATH/pwstorage_db.xml.gpg
    nano /tmp/pwstorage_db.xml
    gpg --yes -o $PSYCPATH/pwstorage_db.xml.gpg -e -R $PSYCHOPATH /tmp/pwstorage_db.xml
    shred -u /tmp/pwstorage_db.xml
}

alias psyc-see='gpg -d $PSYCPATH/pwstorage_db.xml.gpg | less '
alias psyc-sync='cp -R $PSYCPATH/pwstorage_db.xml.gpg ~/Dropbox/Backup/pwstorage_db.xml.gpg'
