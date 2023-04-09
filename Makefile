PSQL_CMD ?= psql -U postgres

clean:
	rm -f test/generated.sql

test: clean
	$(PSQL_CMD) -f test/ddl.sql
	$(PSQL_CMD) -f test/oracle.sql
	$(PSQL_CMD) -f test/generate.sql --tuples-only | sed -e 's/\\n/\n/g' | tail --bytes=+2 > test/generated.sql

	$(PSQL_CMD) -f test/generated.sql --output test/generated.out
	diff --ignore-trailing-space --ignore-blank-lines test/other.out test/other.out.expected

	$(PSQL_CMD) -f test/other.sql --output test/other.out > test/other.out
	diff --ignore-trailing-space --ignore-blank-lines test/other.out test/other.out.expected

	$(PSQL_CMD) -f test/adjacency.sql --output test/adjacency.out
	diff --ignore-trailing-space --ignore-blank-lines test/adjacency.out test/adjacency.out.expected

	$(PSQL_CMD) -f test/connectedness.sql --output test/connectedness.out
	diff --ignore-trailing-space --ignore-blank-lines test/connectedness.out test/connectedness.out.expected

enable-debug:
	$(PSQL_CMD) -f dev/enable-debug.sql

disable-debug:
	$(PSQL_CMD) -f dev/disable-debug.sql
