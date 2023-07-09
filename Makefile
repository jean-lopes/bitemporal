PSQL_CMD ?= psql -U postgres

.PHONY: clean reset test enable-debug disable-debug

clean:
	rm -f test/*.out
	$(PSQL_CMD) --file test/setup/down.sql

reset: clean
	$(PSQL_CMD) --file test/setup/up.sql

test: reset
	$(PSQL_CMD) --no-psqlrc --file test/save.sql --output test/save.sql.out
	diff --ignore-trailing-space --ignore-blank-lines test/save.sql.out test/save.sql.out.expected

	$(PSQL_CMD) --no-psqlrc --file test/remove.sql --output test/remove.sql.out
	diff --ignore-trailing-space --ignore-blank-lines test/remove.sql.out test/remove.sql.out.expected

	$(PSQL_CMD) --no-psqlrc --file test/save-with-foreign-key.sql --output test/save-with-foreign-key.sql.out
	diff --ignore-trailing-space --ignore-blank-lines test/save-with-foreign-key.sql.out test/save-with-foreign-key.sql.out.expected

	$(PSQL_CMD) --no-psqlrc --file test/remove-with-foreign-key.sql --output test/remove-with-foreign-key.sql.out
	diff --ignore-trailing-space --ignore-blank-lines test/remove-with-foreign-key.sql.out test/remove-with-foreign-key.sql.out.expected

	$(PSQL_CMD) --no-psqlrc --file test/validate-overlap-constraint.sql --output test/validate-overlap-constraint.sql.out
	diff --ignore-trailing-space --ignore-blank-lines test/validate-overlap-constraint.sql.out test/validate-overlap-constraint.sql.out.expected

	$(PSQL_CMD) --no-psqlrc --file test/validate-adjacency-constraint.sql --output test/validate-adjacency-constraint.sql.out
	diff --ignore-trailing-space --ignore-blank-lines test/validate-adjacency-constraint.sql.out test/validate-adjacency-constraint.sql.out.expected

	$(PSQL_CMD) --no-psqlrc --file test/history-relation-errors.sql --output test/history-relation-errors.sql.out
	diff --ignore-trailing-space --ignore-blank-lines test/history-relation-errors.sql.out test/history-relation-errors.sql.out.expected

	$(PSQL_CMD) --no-psqlrc --file test/primary-key-errors.sql --output test/primary-key-errors.sql.out
	diff --ignore-trailing-space --ignore-blank-lines test/primary-key-errors.sql.out test/primary-key-errors.sql.out.expected

enable-debug:
	$(PSQL_CMD) --file dev/enable-debug.sql

disable-debug:
	$(PSQL_CMD) --file dev/disable-debug.sql
