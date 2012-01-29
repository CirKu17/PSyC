### PSyC ####

PSYCPATH=psyc_dir_path
PSYCHOPATH=gpg_key_user_ID

function psyc-copy() {
    if [ -z "$1" ]; then
        echo "[!] Missing parameter"
        echo "usage $0 <target id of pwstorage db>"
    else
        echo "[*] Copying to clipboard.."
        xml_grep "target[@id=\"$1\"]/passphrase" PSYCPATH/pwstorage_db.xml --text_only | xclip
    fi
}

alias psyc-add='$PSYCPATH && perl pwstorage.pl && gpg -e -R $PSYCHOPATH pwstorage_db.xml && $OLDPWD'
alias psyc-see='gpg -d $PSYCPATH/pwstorage_db.xml.gpg | less '
alias psyc-mod='gpg -o /tmp/pwstorage_db.xml -d $PSYCPATH/pwstorage_db.xml.gpg && nano /tmp/pwstorage_db.xml && gpg -o $PSYCPATH/pwstorage_db.xml.gpg -e -R $PSYCHOPATH /tmp/pwstorage_db.xml '
alias psyc-sync='cp -R $PSYCPATH/pwstorage_db.xml.gpg ~/Dropbox/Backup/pwstorage_db.xml.gpg'
