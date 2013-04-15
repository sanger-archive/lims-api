.PHONY: migrate_test serve
CORE_PATH = `bundle show lims-core | grep lims-core`
migrate_test_n:
	mysql -uroot -p -e "DROP DATABASE IF EXISTS test_lims_api; CREATE DATABASE test_lims_api DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;"
	bundle exec sequel -m $(CORE_PATH)/db/migrations -e test config/database.yml
migrate_dev_n:
	mysql -uroot -p -e "DROP DATABASE IF EXISTS development; CREATE DATABASE development DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;"
	bundle exec sequel -m $(CORE_PATH)/db/migrations -e development config/database.yml
migrate_test:
	bundle exec sequel -m $(CORE_PATH)/db/migrations -e test config/database.yml
migrate_dev:
	bundle exec sequel -m $(CORE_PATH)/db/migrations -e development config/database.yml
serve:
	rabbitmq-server | bundle exec rackup
dserve:
	bundle exec rackup -d


%: %.erb
	erb < $< > $@

APIARY_SOURCE_DIR= spec/requests/apiary
APIARY_SOURCES= $(shell find $(APIARY_SOURCE_DIR) )
APIARY_JSON_SOURCES= ${patsubst %.erb,%, ${APIARY_SOURCES}}

apiary.apib: script/generate_apiary.rb $(APIARY_SOURCE_DIR) $(APIARY_JSON_SOURCES)
	ruby script/generate_apiary.rb > $@

RSPEC_JSON_DIR = spec/requests
RSPEC_JSON_SOURCES = $(shell find $(RSPEC_JSON_DIR) -name '*.json')
generate_specs: script/generate_rspec.rb $(RSPEC_JSON_SOURCES)
	ruby script/generate_rspec.rb

