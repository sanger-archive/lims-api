.PHONY: migrate_test serve
migrate_test_n:
	mysql -uroot -p -e "DROP DATABASE IF EXISTS test_lims_api; CREATE DATABASE test_lims_api DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;"
	bundle exec sequel -m db/migrations -e test config/database.yml
migrate_dev_n:
	mysql -uroot -p -e "DROP DATABASE IF EXISTS development; CREATE DATABASE development DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;"
	bundle exec sequel -m db/migrations -e development config/database.yml
migrate_test:
	bundle exec sequel -m db/migrations -e test config/database.yml
migrate_dev:
	bundle exec sequel -m db/migrations -e development config/database.yml
serve:
	bundle exec rackup
dserve:
	bundle exec rackup -d

