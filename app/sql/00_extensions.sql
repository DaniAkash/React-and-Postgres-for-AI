-- Extensions: the platform's public API in action.
--
-- pgvector adds a `vector` type plus two new index access methods
-- (HNSW, IVFFlat). pg_trgm adds trigram similarity for fuzzy matches.
-- pgcrypto gives us gen_random_uuid() without bespoke functions.

create extension if not exists vector;
create extension if not exists pg_trgm;
create extension if not exists pgcrypto;
