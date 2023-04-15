PSQL_CMD ?= psql -U postgres
TESTS = generated adjacency connectedness other

clean:
	rm -f test/*.out
	rm -f test/generated.sql
	$(PSQL_CMD) -f test/setup/down.sql

setup-test: clean
	$(PSQL_CMD) -f test/setup/up.sql
	$(PSQL_CMD) -f test/setup/generate.sql --tuples-only | sed -e 's/\\n/\n/g' | tail --bytes=+2 > test/generated.sql

test: setup-test
	for t in $(TESTS); \
	do \
		$(PSQL_CMD) -f test/$$t.sql --output test/$$t.out || exit; \
		diff --ignore-trailing-space --ignore-blank-lines test/$$t.out test/$$t.out.expected || exit; \
	done

enable-debug:
	$(PSQL_CMD) -f dev/enable-debug.sql

disable-debug:
	$(PSQL_CMD) -f dev/disable-debug.sql
