"""
    Modul bd nam služi da definišemo bazu koju koristimo,
    kao i za pomoćne funkcije za povezivanje 
    Ovde se importuje sqlite3 modul koji predstavlja API 
    za rad sa SQLite bazom, kao i rečnik g za čuvanje
    globalnih promenljivih (u našem slučaju konekcija _db_conn)
"""
import sqlite3
from flask import g

DATABASE = 'baza.db'  # koja se baza koristi

# funkcija za proveru ili kreiranje konekcije
def get_db():
    if not "_db_conn" in g:
        g._db_conn = sqlite3.connect(DATABASE) 
    return g._db_conn

# funkcija za čitanje podataka kojoj prosleđujemo SQL upit i opcione argumente
def query_db(query, args=(), one=False):
    kursor = get_db().execute(query, args)  # pribavljamo konenciju i izvršavamo upit
    rezultat = kursor.fetchall()            # svi redovi se smeštaju u rezultat
    kursor.close()                          
    if one:
        return rezultat[0] if rezultat else None   # ako se traži samo jedan rezultat, šalje se prvi element liste rezultat (ako postoji)
    else:
        return rezultat                            # šalje se lista sa rezultatima upita