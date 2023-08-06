PSQL_CMD ?= psql -U postgres --no-psqlrc

.PHONY: clean reset test enable-debug disable-debug

clean:
	rm -f test/**/*.out
	$(PSQL_CMD) --file test/down.sql

reset: clean
	$(PSQL_CMD) --file bitemporal.sql
	$(PSQL_CMD) --file test/up.sql

tests := $(wildcard test/**/*.sql)

$(tests): reset
	echo $@
	$(PSQL_CMD) --file $@ --output $@.out
	diff --ignore-trailing-space --ignore-blank-lines $@.out $@.out.expected

test: $(tests)

enable-debug:
	$(PSQL_CMD) --file dev/enable-debug.sql

disable-debug:
	$(PSQL_CMD) --file dev/disable-debug.sql
