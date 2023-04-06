clean:
	rm -f test/generated.sql

setup-example:
	psql -U postgres -f dev/ddl.sql

setup-test-oracle:
	psql -U postgres -f test/oracle.sql

generate-tests:
	psql -U postgres -f test/generate.sql -t -q | sed -e 's/\\n/\n/g' > test/generated.sql

test: clean setup-test-oracle generate-tests
	psql -U postgres -f test/generated.sql

enable-debug:
	psql -U postgres -f enable-debug.sql

disable-debug:
	psql -U postgres -f disable-debug.sql
