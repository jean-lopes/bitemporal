PSQL_CMD ?= psql -U postgres

.PHONY: clean test enable-debug disable-debug

clean:
	rm -f test/*.out
	$(PSQL_CMD) --file test/setup/down.sql

generate-tests:
	$(PSQL_CMD) --file test/setup/generate-save.sql --tuples-only \
		| sed -e 's/\\n/\n/g' \
		| tail --bytes=+2 \
		> test/generated-save.sql

	$(PSQL_CMD) --file test/setup/generate-remove.sql --tuples-only \
		| sed -e 's/\\n/\n/g' \
		| tail --bytes=+2 \
		> test/generated-remove.sql

test: clean
	$(PSQL_CMD) --file test/setup/up.sql

	$(PSQL_CMD) --file test/save.sql --output test/save.sql.out
	diff --ignore-trailing-space --ignore-blank-lines test/save.sql.out test/save.sql.out.expected

	$(PSQL_CMD) --file test/remove.sql --output test/remove.sql.out
	diff --ignore-trailing-space --ignore-blank-lines test/remove.sql.out test/remove.sql.out.expected

	$(PSQL_CMD) --file test/save-with-foreign-key.sql --output test/save-with-foreign-key.sql.out
	diff --ignore-trailing-space --ignore-blank-lines test/save-with-foreign-key.sql.out test/save-with-foreign-key.sql.out.expected

enable-debug:
	$(PSQL_CMD) --file dev/enable-debug.sql

disable-debug:
	$(PSQL_CMD) --file dev/disable-debug.sql
