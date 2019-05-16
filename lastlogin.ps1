# Affiche la date de dernière connexion
# d'un compte local système
$nom=Read-Host -Promt "Saisir un nom de compte local"
$compte=[ADSI] "WinNT://./$nom"
if ($compte.path){
    write-Host $compte.LastLogin
    Write-Host $compte.Description
    Write-Host $compte.Fullname
}
else {
    Write-Host "$nom non trouvé"
    
}