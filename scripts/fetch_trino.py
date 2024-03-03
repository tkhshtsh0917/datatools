from trino.dbapi import Connection  # type: ignore


QUERY: str = r"""
SELECT
    p.name,
    p.age
FROM
    embulk_people AS p
WHERE
    p.age >= 30
"""


def main() -> None:
    with Connection(
        host="localhost",
        port=8080,
        user="user",
        catalog="mysql",
        schema="example",
        timezone="Asia/Tokyo",
    ) as conn:
        cur = conn.cursor()
        rows = cur.execute(QUERY).fetchall()

    print(rows)


if __name__ == "__main__":
    main()
