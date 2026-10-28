"""
init_db.py — Création de la base de données SQLite Singué
Usage : python init_db.py
"""
import sqlite3
import os

SQL_FILE = "singue.sql"
DB_FILE  = "singue.db"

# Lecture du schéma SQL
with open(SQL_FILE, "r", encoding="utf-8") as f:
    schema = f.read()

# Création / connexion à la base
conn = sqlite3.connect(DB_FILE)
conn.executescript(schema)
conn.commit()

# Vérification
cur = conn.cursor()
cur.execute("SELECT name, type FROM sqlite_master WHERE type IN ('table','view') ORDER BY type, name")
rows = cur.fetchall()

print("=" * 45)
print(" SINGUÉ — Base de données initialisée")
print("=" * 45)
print("\nObjets créés :")
for r in rows:
    print(f"  [{r[1].upper():5}] {r[0]}")

cur.execute("SELECT COUNT(*) FROM registre")
nb = cur.fetchone()[0]
print(f"\nLignes dans 'registre' : {nb}")

cur.execute("SELECT id, nom, type, date, heure, total, moyenne FROM v_registre_resume LIMIT 4")
colonnes = [d[0] for d in cur.description]
print("\nAperçu vue v_registre_resume :")
print("  " + " | ".join(f"{c:<16}" for c in colonnes))
print("  " + "-" * (18 * len(colonnes)))
for row in cur.fetchall():
    print("  " + " | ".join(f"{str(v):<16}" for v in row))

conn.close()

size = os.path.getsize(DB_FILE)
print(f"\nFichier créé : {DB_FILE}  ({size:,} octets)")
print("=" * 45)
