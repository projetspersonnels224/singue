-- ============================================================
--  SINGUÉ — Base de données SQLite
--  Fichier  : singue.sql
--  Créé le  : 2026-10-28
--  Encodage : UTF-8
-- ============================================================

PRAGMA journal_mode = WAL;
PRAGMA foreign_keys = ON;

-- ------------------------------------------------------------
--  TABLE PRINCIPALE : registre
--  Correspond aux colonnes du tableau de bord :
--  Nom | Type | Date | Heure | N1 | N2 | N3 | N4 | N5 | N6 | N7
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS registre (
    id        INTEGER PRIMARY KEY AUTOINCREMENT,
    nom       TEXT    NOT NULL,
    type      TEXT    NOT NULL,
    date      TEXT    NOT NULL,   -- format ISO : YYYY-MM-DD
    heure     TEXT    NOT NULL,   -- format HH:MM
    n1        REAL    DEFAULT 0,
    n2        REAL    DEFAULT 0,
    n3        REAL    DEFAULT 0,
    n4        REAL    DEFAULT 0,
    n5        REAL    DEFAULT 0,
    n6        REAL    DEFAULT 0,
    n7        REAL    DEFAULT 0,
    cree_le   TEXT    DEFAULT (datetime('now', 'localtime')),
    modif_le  TEXT    DEFAULT (datetime('now', 'localtime'))
);

-- ------------------------------------------------------------
--  TABLE : utilisateurs
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS utilisateurs (
    id          INTEGER PRIMARY KEY AUTOINCREMENT,
    nom_complet TEXT    NOT NULL,
    email       TEXT    NOT NULL UNIQUE,
    type_compte TEXT    NOT NULL DEFAULT 'Standard',
    cree_le     TEXT    DEFAULT (datetime('now', 'localtime'))
);

-- ------------------------------------------------------------
--  TABLE : types_compte (référentiel)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS types_compte (
    id   INTEGER PRIMARY KEY AUTOINCREMENT,
    nom  TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS noms_registre (
    id  INTEGER PRIMARY KEY AUTOINCREMENT,
    nom TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS heures_ref (
    id    INTEGER PRIMARY KEY AUTOINCREMENT,
    heure TEXT NOT NULL UNIQUE
);

-- ------------------------------------------------------------
--  DONNÉES DE RÉFÉRENCE
-- ------------------------------------------------------------

INSERT OR IGNORE INTO types_compte (nom) VALUES
    ('SIMPLE'),
    ('DOUBLE CHANCE');

INSERT OR IGNORE INTO noms_registre (nom) VALUES
    ('YIGUI'),
    ('BOGNESSA'),
    ('KHERY'),
    ('MOUNANFANGNI'),
    ('BANNAYA'),
    ('SEWE'),
    ('KHOUNAKELI'),
    ('FERE'),
    ('SABOUI'),
    ('NAFOULI');

INSERT OR IGNORE INTO heures_ref (heure) VALUES
    ('08:00'), ('09:00'), ('10:00'), ('10:30'), ('11:00'),
    ('12:00'), ('13:00'), ('14:00'), ('15:00'), ('15:30'),
    ('16:00'), ('17:00'), ('18:00'), ('19:00'), ('20:00');

INSERT OR IGNORE INTO utilisateurs (nom_complet, email, type_compte) VALUES
    ('Alice Dupont', 'alice@singue.io', 'Administrateur');

-- ------------------------------------------------------------
--  DONNÉES D'EXEMPLE dans le registre
-- ------------------------------------------------------------
INSERT INTO registre (nom, type, date, heure, n1, n2, n3, n4, n5, n6, n7) VALUES
    ('YIGUI',        'SIMPLE',        '2026-10-28', '09:00', 12, 5,  8,  3,  7,  2,  9),
    ('BOGNESSA',     'DOUBLE CHANCE', '2026-10-27', '10:00', 4,  6,  11, 2,  9,  1,  5),
    ('KHERY',        'SIMPLE',        '2026-10-26', '14:00', 7,  3,  2,  8,  4,  6,  1),
    ('MOUNANFANGNI', 'DOUBLE CHANCE', '2026-10-25', '11:00', 9,  1,  4,  5,  3,  8,  7),
    ('BANNAYA',      'SIMPLE',        '2026-10-24', '15:00', 2,  8,  6,  4,  5,  3,  10),
    ('SEWE',         'DOUBLE CHANCE', '2026-10-23', '16:00', 6,  4,  3,  7,  1,  9,  2),
    ('KHOUNAKELI',   'SIMPLE',        '2026-10-22', '08:00', 3,  7,  9,  1,  6,  4,  8),
    ('FERE',         'DOUBLE CHANCE', '2026-10-21', '13:00', 8,  2,  5,  9,  2,  7,  3),
    ('SABOUI',       'SIMPLE',        '2026-10-20', '10:30', 5,  9,  1,  6,  4,  3,  7),
    ('NAFOULI',      'DOUBLE CHANCE', '2026-10-19', '15:30', 1,  4,  7,  2,  8,  5,  6);

-- ------------------------------------------------------------
--  VUE : résumé du registre
-- ------------------------------------------------------------
CREATE VIEW IF NOT EXISTS v_registre_resume AS
SELECT
    id,
    nom,
    type,
    date,
    heure,
    n1, n2, n3, n4, n5, n6, n7,
    (n1 + n2 + n3 + n4 + n5 + n6 + n7) AS total,
    ROUND((n1 + n2 + n3 + n4 + n5 + n6 + n7) / 7.0, 2) AS moyenne
FROM registre;
