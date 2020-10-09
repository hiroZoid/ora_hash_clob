# ora_hash_clob

Simple PL/SQL function to generate a hash from CLOB in Oracle Database.

It cuts the CLOB in 4k blocks, hashes each block and then join the blocks using an algorithm that Java's hashCode method usually does.

Inspired by https://dbaora.com/ora_hash-and-clob-problem/
