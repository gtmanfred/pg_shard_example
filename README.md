deploy postgresql with pg_shard and a replicated streaming slave
with failover.

There is also a .json file that can be input as data to play with
the jsonb type.

http://blog.2ndquadrant.com/jsonb-type-performance-postgresql-9-4/

http://www.databasesoup.com/2014/12/sqlnosql-pgshard-and-jsonb-part-1.html

https://github.com/citusdata/pg_shard

To convert it to be able to do inserts.

    gunzip -c customer_reviews_nested_1998.json.gz |
      awk -v n=1 '{str = $0; gsub(/\047/, "\047\047", str); print sprintf("insert into reviews values (%s, \047%s\047);", n, str); n++}' > customer_reviews

then run the following with the here string to import the example
customer data

    psql -q <<HERE
    CREATE TABLE reviews(id integer not null unique, review jsonb);
    CREATE INDEX on reviews USING GIN (review jsonb_path_ops);
    SELECT master_create_distributed_table('reviews', 'id');
    SELECT master_create_worker_shards('reviews', 16, 2);
    \i customer_reviews
    HERE
