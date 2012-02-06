_PSyC_ (Passphrases Synchronization CLI) is meant to store an XML password database protected with a PGP key and synchronize it with Dropbox.

Is written in perl (using the Template Toolkit) and the CLI is managed by zsh.

Initialize
----------

To start adding elements to the db, encrypt the empty pwstorage_db.xml in pwstorage_db.xml.gpg
Needs xml_grep and xclip (may need to be aliased to xclip -selection clipboard).

Aliases
-------

```
    psyc-add :       adds an element to the db
    psyc-see :       opens the db with less (read-only)
    psyc-copy <id> : copies the passphrase relative to <id> in the clipboard
    psyc-mod :       opens the db with nano (read/write)
    psyc-sync :      copies the db in local Dropbox-synchronized directory
```