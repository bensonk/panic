PANIC Leak Fetcher
==================

The leak fetcher codebase is the PANIC component that watches the internet for
leaked password lists and fetches them.  It will make an automatic best-effort
to import them into the PANIC database, but failing that it will notify the
admins that a manual effort needs to be made to process the leak. 
