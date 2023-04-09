PSQL ?= psql
PSQL_FLAGS ?= -U postgres
PSQL_CMD ?= $(PSQL) $(PSQL_FLAGS)

clean:
	rm -f test/generated.sql

test: clean
	$(PSQL_CMD) -f test/ddl.sql
	$(PSQL_CMD) -f test/oracle.sql
	$(PSQL_CMD) -f test/generate.sql -t -q | sed -e 's/\\n/\n/g' | tail --bytes=+2 > test/generated.sql
	$(PSQL_CMD) -f test/generated.sql
#	$(PSQL_CMD) -f test/manual.sql --output test/manual.out

	$(PSQL_CMD) -f test/adjacency.sql --output test/adjacency.out
	diff --ignore-trailing-space --ignore-blank-lines test/adjacency.out test/adjacency.out.expected

	$(PSQL_CMD) -f test/connectedness.sql --output test/connectedness.out
	diff --ignore-trailing-space --ignore-blank-lines test/connectedness.out test/connectedness.out.expected

enable-debug:
	$(PSQL_CMD) -f dev/enable-debug.sql

disable-debug:
	$(PSQL_CMD) -f dev/disable-debug.sql
