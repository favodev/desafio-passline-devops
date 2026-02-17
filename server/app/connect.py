import os
import time
import psycopg2
import logging
from urllib.parse import urlparse
from sqlalchemy import create_engine
from sqlalchemy.orm import scoped_session, sessionmaker

def wait_for_db(db_url, max_retries=10, wait_time=1):
    logging.basicConfig(level=logging.INFO)
    logger = logging.getLogger(__name__)

    result = urlparse(db_url)
    dbname = result.path[1:]
    user = result.username
    password = result.password
    host = result.hostname
    port = result.port
    retries = 0

    logger.info(f"Trying to connect to {host}:{port} as {user}...")

    while retries < max_retries:
        try:
            conn = psycopg2.connect(
                dbname=dbname, user=user, password=password, host=host, port=port
            )
            conn.close()
            logger.info("Connection successful!")
            return
        except Exception as e:
            logger.warning(f"Postgres is not ready yet. Waiting... {str(e)}")
            time.sleep(wait_time)
            retries += 1

    logger.error("Max retries reached. Unable to connect to the database.")


def build_engine(database_url: str):
    if database_url.startswith("sqlite"):
        return create_engine(database_url, connect_args={"check_same_thread": False})
    return create_engine(database_url)


DATABASE_URL = os.getenv("DOCKER_DATABASE_URL", "sqlite:///./bookstore.db")

if DATABASE_URL.startswith("postgresql"):
    wait_for_db(DATABASE_URL)

engine = build_engine(DATABASE_URL)
db_session = scoped_session(
    sessionmaker(autocommit=False, autoflush=False, bind=engine)
)