# Ajoute un compte dans la base locale du système 
# à partir de la saisie du nom et de la description

$local=[ADSI]"WinNT://."

$nom=Read-Host -Prompt "Saisir un nom"
$description=Read-Host -Prompt "Saisir une description"

$compte=[ADSI]"WinNT://./$nom"
if (!$compte.path){
    $utilisateur=$local.create("user", $nom)
    $utilisateur.InvokeSet("FullName", $nomComplet)
    $utilisateur.InvokeSet("Description", $description)
    $utilisateur.CommitChanges()
    Write-Host "$nom ajouté"
}
else {
    Write-Host "$nom éxiste déjà"
}