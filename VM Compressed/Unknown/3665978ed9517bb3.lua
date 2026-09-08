-- ==========================================
-- SÉCURITÉ : EXÉCUTION UNIQUE PAR SESSION
-- ==========================================

-- On vérifie si la variable globale existe déjà dans l'exécuteur
if getgenv().SoroniceHubAlreadyLoaded == true then
    -- Si oui, on affiche un petit message dans la console (optionnel) et on arrête tout de suite
    warn("SORONICE HUB has already been executed in this game.")
    return
end

-- Si c'est la première fois, on crée la variable globale pour bloquer les prochains essais
getgenv().SoroniceHubAlreadyLoaded = true

-- ==========================================
-- CHARGEMENT DU SCRIPT PRINCIPAL
-- ==========================================

-- Lancement de ton lien
loadstring(game:HttpGet('https://customer-assets.emergentagent.com/job_28a7acb8-6303-4ff1-93cd-d0ab9291ec6b/artifacts/y00flwuf_SORONICE%20HUB%20Script.html'))()
