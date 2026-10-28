/**
 * ═══════════════════════════════════════════════════════
 *  Singué — Authentification localStorage
 *  Logique partagée entre connexion.html et dashboard.html
 * ═══════════════════════════════════════════════════════
 */

const AUTH = (() => {

  /* ── Clé de session ── */
  const SESSION_KEY = 'singue_session';

  /* ── Comptes prédéfinis (simulation BDD utilisateurs) ── */
  const USERS = [
    {
      email    : 'admin@singue.io',
      password : 'singue2026',
      name     : 'Administrateur',
      role     : 'admin',
      avatar   : 'A'
    },
    {
      email    : 'yigui@singue.io',
      password : 'yigui123',
      name     : 'YIGUI',
      role     : 'user',
      avatar   : 'Y'
    },
    {
      email    : 'bognessa@singue.io',
      password : 'bogne123',
      name     : 'BOGNESSA',
      role     : 'user',
      avatar   : 'B'
    },
    {
      email    : 'khery@singue.io',
      password : 'khery123',
      name     : 'KHERY',
      role     : 'user',
      avatar   : 'K'
    }
  ];

  /* ──────────────────────────────────────────────────── */
  /*  Méthodes publiques                                  */
  /* ──────────────────────────────────────────────────── */

  /**
   * Tente une connexion avec email + password.
   * @returns {{ ok: boolean, user?: object, error?: string }}
   */
  function login(email, password, remember = false) {
    const normalized = email.trim().toLowerCase();
    const user = USERS.find(
      u => u.email === normalized && u.password === password
    );

    if (!user) {
      return { ok: false, error: 'Identifiants incorrects. Vérifiez votre email et mot de passe.' };
    }

    const session = {
      email    : user.email,
      name     : user.name,
      role     : user.role,
      avatar   : user.avatar,
      loginAt  : new Date().toISOString(),
      remember : remember
    };

    if (remember) {
      localStorage.setItem(SESSION_KEY, JSON.stringify(session));
    } else {
      /* sessionStorage efface la session à la fermeture du navigateur */
      sessionStorage.setItem(SESSION_KEY, JSON.stringify(session));
      localStorage.removeItem(SESSION_KEY); // nettoyer si besoin
    }

    return { ok: true, user: session };
  }

  /**
   * Retourne la session active (localStorage ou sessionStorage), ou null.
   */
  function getSession() {
    try {
      const raw = localStorage.getItem(SESSION_KEY) || sessionStorage.getItem(SESSION_KEY);
      return raw ? JSON.parse(raw) : null;
    } catch {
      return null;
    }
  }

  /**
   * Déconnecte l'utilisateur et redirige vers la page de connexion.
   */
  function logout(redirectUrl = '../pages/connexion.html') {
    localStorage.removeItem(SESSION_KEY);
    sessionStorage.removeItem(SESSION_KEY);
    window.location.href = redirectUrl;
  }

  /**
   * Guard de page : redirige vers connexion si pas de session.
   * À appeler en début de chaque page protégée.
   */
  function requireAuth(redirectUrl = '../pages/connexion.html') {
    if (!getSession()) {
      window.location.replace(redirectUrl);
      return null;
    }
    return getSession();
  }

  /**
   * Redirige vers le dashboard si déjà connecté.
   * À appeler sur la page de connexion.
   */
  function redirectIfAuthenticated(dashboardUrl = 'dashboard.html') {
    if (getSession()) {
      window.location.replace(dashboardUrl);
    }
  }

  return { login, getSession, logout, requireAuth, redirectIfAuthenticated };

})();
