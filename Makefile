PSQL ?= psql
PSQL_FLAGS ?= -U postgres

clean:
	rm -f test/generated.sql

test: clean
	$(PSQL) $(PSQL_FLAGS) -f test/ddl.sql
	$(PSQL) $(PSQL_FLAGS) -f test/oracle.sql
	$(PSQL) $(PSQL_FLAGS) -f test/generate.sql -t -q | sed -e 's/\\n/\n/g' | tail --bytes=+2 > test/generated.sql
	$(PSQL) $(PSQL_FLAGS) -f test/generated.sql
	$(PSQL) $(PSQL_FLAGS) -f test/manual.sql --output test/manual.out
	diff --ignore-trailing-space --ignore-blank-lines test/manual.out test/manual.out.expected

enable-debug:
	$(PSQL) $(PSQL_FLAGS) -f dev/enable-debug.sql

disable-debug:
	$(PSQL) $(PSQL_FLAGS) -f dev/disable-debug.sql
