migrate_test:
	bundle exec sequel -m db/migrations -e test config/database.yml
