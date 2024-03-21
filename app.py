"""
    Jednostavna aplikacija koja obuhvata sve što smo
    radili ove i prethodne školske godine (+/-) na 
    primeru sajta za kafanu/restoran ... 
    + Kreiranje serverske aplikacije pomoću python/flask-a
    + Povezivanje aplikacije sa SQLite bazom i čitanje iz nje
    + Korišćenje HTML-a i CSS-a za rad sa šablonima
    + JS skripta za proveru podataka u formi pre slanja ...
    
"""

from flask import Flask, render_template, url_for, g
from datetime import datetime, timedelta   # uvozimo modul za rad sa datumima 
import db  # uvozimo modul sa bazom i potrebnim funkcijama


app=Flask(__name__)


@app.route("/")
def index():
    return render_template('index.html')

# poziv stranice koja koristi bazu i kreirane funkcije za čitanje podataka iz baze
@app.route("/meni")
def menu():
    hrana=db.query_db("SELECT items.naziv,cenovnik.kolicina as porcija,cenovnik.cena FROM items,cenovnik WHERE cenovnik.stavkamenija==items.id and items.vrsta=='hrana'")
    pica=db.query_db("SELECT items.naziv,cenovnik.kolicina as 'količina' ,cenovnik.cena FROM items,cenovnik WHERE cenovnik.stavkamenija==items.id and items.vrsta=='piće'")
    return render_template('menu.html',hrana=hrana,pica=pica)

# poziv stranice sa formom
@app.route("/rezervacija")
def reserve():
    date = datetime.now()+timedelta(days=1) # sutrašnji datum koji prosleđujemo u formu
    return render_template('reserve.html',datum=date.strftime("%Y-%m-%d"))

# zatvaramo konekciju sa bazom (ako je kreirana) kada applikacija prestaje sa radom
@app.teardown_appcontext
def close_db(exception):
    if "_db_conn" in g:
        g._db_conn.close()