clean:
	rm -f test/generated.sql

test: clean
	psql -U postgres -f test/ddl.sql
	psql -U postgres -f test/oracle.sql
	psql -U postgres -f test/generate.sql -t -q | sed -e 's/\\n/\n/g' > test/generated.sql
	psql -U postgres -f test/generated.sql
	psql -U postgres -f test/manual.sql --output test/manual.out
	diff --ignore-trailing-space --ignore-blank-lines test/manual.out test/manual.out.expected

enable-debug:
	psql -U postgres -f dev/enable-debug.sql

disable-debug:
	psql -U postgres -f dev/disable-debug.sql
