<!-- vim: spell:spelllang=en tw=80
Yard markup
# @markup markdown
# @title README
-->

Overview 
========
This gem provides the server side of the API for the new LIMS.

Database Migration
==================
Ideally the database schema should match the schema needed by the core.
Therefore, we should use the same migrations.
However, the core is not tied to any type of persistence and the API might use
some tables from Sequencescape or an external system. It is easier then, to have
to separate migrations for both system as long as they have compatible schema.  

The integration test should anyway test the core *against* the API schema.  

Test and database
=================
Test are currently run against the test.db which is configured in
`config/database.yml`. To run migrations if needed, `make migrate_test`.

