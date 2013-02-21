 _PSyC_ (Passphrases Synchronization CLI) is meant to store an XML password database protected with a PGP key and synchronize it with your preferred backup solution (e.g. dropbox).

Is written in perl (using the Template Toolkit) and the CLI is managed by zsh/bash.

Initialize
----------

To start adding elements to the db, encrypt the empty pwstorage_db.xml in pwstorage_db.xml.gpg .

xclip may need to be aliased to xclip -selection clipboard in your zshrc/bashrc .

Dependencies
------------

    * gpg
    * xml_grep
    * xclip
    * shred
    * perl and the Template module (Template Toolkit)

Aliases
-------

```
    psyc-add :       adds an element to the db
    psyc-see :       opens the db with less (read-only)
    psyc-copy <id> : copies the passphrase relative to <id> in the clipboard
    psyc-mod :       opens the db with nano (read/write)
    psyc-sync :      copies the db in the preferred backup location
```

TODO
----

* test bash compatibility
