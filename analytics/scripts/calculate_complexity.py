#!/usr/bin/env python
import re
import psycopg2
conn = psycopg2.connect("dbname=panic")

def complexity(p):
  res = 0
  if re.search(r'[a-z]', p):
    res += 1
  if re.search(r'[A-Z]', p):
    res += 1
  if re.search(r'[0-9]', p):
    res += 1
  if re.search(r'[~!@#$%^&*()_+-={}\[\]\\;:\'",./<>?`]', p):
    res += 1
  if re.search(r'\s', p):
    res += 1
  return res

def main():
  fetch_cur = conn.cursor()
  update_cur = conn.cursor()
  query = "update credentials set complexity=%s where id=%s;"
  fetch_cur.execute("SELECT id, password FROM credentials")
  for i, passwd in fetch_cur:
    comp = complexity(passwd)
    update_cur.execute(query, (comp, i))
    print query % (comp, i)
  conn.commit()
  update_cur.close()
  fetch_cur.close()
  print "done"

if __name__ == '__main__':
  main()
