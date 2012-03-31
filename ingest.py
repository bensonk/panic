#!/usr/bin/env python
import psycopg2
conn = psycopg2.connect("dbname=panic")

def ingest(fname):
  print "Ingesting {}...".format(fname),
  query = """INSERT INTO credentials(source, password, email) VALUES(%s, %s, %s);"""
  cur = conn.cursor()
  with open(fname) as f:
    for line in f:
      try:
        email, password = [ x.strip() for x in line.split(",", 1) ]
        cur.execute(query, (fname, email, password))
      except ValueError as e:
        print "Failed to parse '{}', skipping...".format(line.strip())
  cur.close()
  conn.commit()
  print "done"

if __name__ == '__main__':
  from sys import argv
  for fname in argv[1:]:
    ingest(fname)
