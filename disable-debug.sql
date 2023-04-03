ALTER SYSTEM SET client_min_messages = 'ERROR';
ALTER SYSTEM SET log_min_messages = 'ERROR';
SELECT pg_reload_conf();
