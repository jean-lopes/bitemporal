PSQL_CMD ?= psql -U postgres

SAVE_TESTS = generated adjacency connectedness other

clean:
	rm -f test/save/*.out
	rm -f test/save/generated.sql

	rm -f test/remove/*.out
	rm -f test/remove/generated.sql

	$(PSQL_CMD) --file test/setup/down.sql

setup-test: clean
	$(PSQL_CMD) --file test/setup/up.sql

	$(PSQL_CMD) --file test/setup/generate-save.sql --tuples-only \
		| sed -e 's/\\n/\n/g' \
		| tail --bytes=+2 \
		> test/save/generated.sql

	$(PSQL_CMD) --file test/setup/generate-remove.sql --tuples-only \
		| sed -e 's/\\n/\n/g' \
		| tail --bytes=+2 \
		> test/remove/generated.sql

test: setup-test
	for t in $(SAVE_TESTS); \
	do \
		$(PSQL_CMD) --file test/save/$$t.sql --output test/save/$$t.out || exit; \
		diff --ignore-trailing-space --ignore-blank-lines test/save/$$t.out test/save/$$t.out.expected || exit; \
	done

enable-debug:
	$(PSQL_CMD) --file dev/enable-debug.sql

disable-debug:
	$(PSQL_CMD) --file dev/disable-debug.sql
