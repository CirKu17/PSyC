### PSyC ####

PSYCPATH=~/scripts/psyc


alias psyc-add='$PSYCPATH && perl pwstorage.pl && gpg -e pwstorage_db.xml && rm -f pwstorage_db.xml && $OLDPWD'
alias psyc-see='gpg -d $PSYCPATH/pwstorage_db.xml.gpg | less '
alias psyc-mod='gpg -o /tmp/pwstorage_db.xml -d $PSYCPATH/pwstorage_db.xml.gpg && nano /tmp/pwstorage_db.xml && gpg -o $PSYCPATH/pwstorage_db.xml.gpg -e /tmp/pwstorage_db.xml '
alias psyc-sync='cp -R $PSYCPATH/pwstorage_db.xml.gpg ~/Dropbox/Backup/pwstorage_db.xml.gpg'
