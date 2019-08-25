# A lambda function to interact with AWS RDS MySQL

import pymysql
import sys

REGION = 'us-east-1'

rds_host  = "konfiodb.cklpdzvncjnq.us-east-1.rds.amazonaws.com"
name = "konfio"
password = "a1b2c3d4e5"
db_name = "konfiodb"

def save_events(event):
    """
    This function fetches content from mysql RDS instance
    """
    result = []
    conn = pymysql.connect(rds_host, user=name, passwd=password, db=db_name, connect_timeout=5)
    with conn.cursor() as cur:
        cur.execute("""insert into test (UUID, RFC) values( %s, '%s')""" % (event['UUID'], event['RFC']))
        cur.execute("""select * from test""")
        conn.commit()
        cur.close()
        for row in cur:
            result.append(list(row))
        print "Data from RDS..."
        print result

def main(event, context):
    save_events(event)
        

