# Singué ðŸš€

**Plateforme web multipage â€” HTML5 & CSS3 â€” DÃ©ployÃ©e sur Vercel**

---

## ðŸ“‹ PrÃ©sentation

Singué est un projet Ã©ducatif de dÃ©veloppement web frontend illustrant la conception d'une plateforme multipage professionnelle et responsive avec HTML5 et CSS3 pur.

Il comprend trois pages principales :
- **Page d'accueil** (`index.html`) â€” PrÃ©sentation de la plateforme
- **Page de connexion** (`pages/connexion.html`) â€” Interface d'authentification statique
- **Tableau de bord** (`pages/dashboard.html`) â€” Espace utilisateur de dÃ©monstration

---

## ðŸ—‚ï¸ Structure du projet

```
Singué/
â”œâ”€â”€ index.html              â† Page d'accueil
â”œâ”€â”€ pages/
â”‚   â”œâ”€â”€ connexion.html      â† Page de connexion
â”‚   â””â”€â”€ dashboard.html      â† Tableau de bord
â”œâ”€â”€ css/
â”‚   â”œâ”€â”€ style.css           â† Styles communs + accueil
â”‚   â”œâ”€â”€ auth.css            â† Styles page de connexion
â”‚   â””â”€â”€ dashboard.css       â† Styles tableau de bord
â”œâ”€â”€ assets/
â”‚   â”œâ”€â”€ images/             â† Images du projet
â”‚   â””â”€â”€ icons/              â† IcÃ´nes SVG
â”œâ”€â”€ README.md
â””â”€â”€ .gitignore
```

---

## ðŸŽ¨ Design System

| Ã‰lÃ©ment            | Couleur     | Code hex  |
|--------------------|-------------|-----------|
| Couleur principale | Bleu        | `#2563EB` |
| Couleur secondaire | Bleu foncÃ©  | `#1E3A8A` |
| ArriÃ¨re-plan       | Gris clair  | `#F8FAFC` |
| Surface cartes     | Blanc       | `#FFFFFF` |
| Texte principal    | Gris foncÃ©  | `#1F2937` |
| Texte secondaire   | Gris        | `#64748B` |
| Bordures           | Gris clair  | `#E2E8F0` |
| SuccÃ¨s             | Vert        | `#16A34A` |
| Avertissement      | Orange      | `#EA580C` |

**Police** : Inter (Google Fonts) â†’ Arial, Helvetica (fallback systÃ¨me)

---

## ðŸš€ Lancer le projet en local

Aucune installation requise. Ouvrez simplement `index.html` dans votre navigateur :

```bash
# Avec VS Code (recommandÃ©)
# Installez l'extension "Live Server" et cliquez sur "Go Live"

# Ou naviguez directement vers le fichier
# index.html â†’ Clic droit â†’ Ouvrir avec â†’ Chrome / Firefox / Edge
```

### Chemins de navigation

| Page              | Chemin local             |
|-------------------|--------------------------|
| Accueil           | `index.html`             |
| Connexion         | `pages/connexion.html`   |
| Tableau de bord   | `pages/dashboard.html`   |

---

## ðŸ“¦ DÃ©ploiement sur Vercel

### Ã‰tape 1 â€” Initialiser Git

```bash
git init
git add .
git commit -m "feat: initial release Singué v1.0"
```

### Ã‰tape 2 â€” CrÃ©er un dÃ©pÃ´t GitHub

1. Allez sur [github.com](https://github.com) â†’ **New repository**
2. Nommez-le `Singué` (public)
3. **Ne cochez pas** "Add README" (il existe dÃ©jÃ )

### Ã‰tape 3 â€” Pousser le code

```bash
git remote add origin https://github.com/VOTRE_NOM/Singué.git
git branch -M main
git push -u origin main
```

### Ã‰tape 4 â€” DÃ©ployer sur Vercel

1. Connectez-vous sur [vercel.com](https://vercel.com) avec GitHub
2. Cliquez **Add New â†’ Project**
3. Importez le dÃ©pÃ´t `Singué`
4. Laissez les paramÃ¨tres par dÃ©faut (aucune commande de build nÃ©cessaire)
5. Cliquez **Deploy**

### Ã‰tape 5 â€” VÃ©rifier l'URL publique

AprÃ¨s dÃ©ploiement, vÃ©rifiez les trois pages :

| Page            | URL Vercel                                   |
|-----------------|----------------------------------------------|
| Accueil         | `https://Singué.vercel.app/`              |
| Connexion       | `https://Singué.vercel.app/pages/connexion.html` |
| Tableau de bord | `https://Singué.vercel.app/pages/dashboard.html` |

### Mise Ã  jour du site

```bash
# Modifier les fichiers localement, puis :
git add .
git commit -m "fix: description de la modification"
git push
# â†’ Vercel redÃ©ploie automatiquement
```

---

## âš ï¸ Limitations â€” Version 1.0

Cette version est **statique** (HTML + CSS uniquement) :
- âœ— Aucune authentification rÃ©elle â€” les identifiants ne sont pas vÃ©rifiÃ©s
- âœ— Aucune donnÃ©e persistante â€” toutes les donnÃ©es sont fictives
- âœ— Aucune variable JavaScript cÃ´tÃ© serveur
- âœ“ Interface fonctionnelle et navigation entre les pages opÃ©rationnelle

---

## ðŸ—ºï¸ Feuille de route

| Version | Contenu                                      |
|---------|----------------------------------------------|
| **1.0** | Site statique HTML/CSS â€” DÃ©ployÃ© sur Vercel  |
| 2.0     | JavaScript â€” Formulaires dynamiques          |
| 3.0     | Authentification rÃ©elle â€” Sessions           |
| 4.0     | Backend â€” API â€” Base de donnÃ©es              |

---

## ðŸ§ª Tests de validation

| ID  | Test                             | RÃ©sultat attendu                     |
|-----|----------------------------------|--------------------------------------|
| T01 | Ouverture `index.html`           | Page d'accueil s'affiche             |
| T02 | Clic "Se connecter"              | Page de connexion s'ouvre            |
| T03 | Affichage du formulaire          | Champs visibles et correctement stylÃ©s |
| T04 | Lien retour Ã  l'accueil          | Fonctionne correctement              |
| T05 | AccÃ¨s `dashboard.html`           | Tableau de bord s'affiche            |
| T06 | Affichage des cartes stats       | 4 cartes correctement alignÃ©es       |
| T07 | Affichage mobile (< 768px)       | Contenu adaptÃ©, pas de dÃ©bordement   |
| T08 | Liens internes                   | Aucun lien mort                      |
| T09 | DÃ©ploiement Vercel               | Site accessible en ligne             |
| T10 | 3 pages sur URL publique         | Toutes accessibles                   |

---

## ðŸ› ï¸ Technologies

![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=flat&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=flat&logo=css3&logoColor=white)
![Git](https://img.shields.io/badge/Git-F05032?style=flat&logo=git&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat&logo=github&logoColor=white)
![Vercel](https://img.shields.io/badge/Vercel-000000?style=flat&logo=vercel&logoColor=white)

---

*Projet Ã©ducatif â€” SÃ©minaire Fintech â€” Â© 2026 Singué*

