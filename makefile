.PHONY: migrate_test serve
migrate_test:
	bundle exec sequel -m db/migrations -e test config/database.yml
migrate_dev:
	bundle exec sequel -m db/migrations -e development config/database.yml

serve:
	bundle exec rackup


