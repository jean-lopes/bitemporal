ALTER SYSTEM SET client_min_messages = 'DEBUG1';
ALTER SYSTEM SET log_min_messages = 'DEBUG1';
SELECT pg_reload_conf();
