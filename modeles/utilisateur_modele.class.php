<?php 
class UtilisateurModele extends Sql {
	public function ouvrirConnexion($p) {
		$code = $this -> assainir($p["code"]);
		$mdpClair = $p["mdp"];

		// Chercher l'entropie correspondant à cet utilisateur.
		$reqEntropie = "SELECT * FROM utilisateur WHERE utl_code='$code'";
		$resultatEntropie = $this -> lire($reqEntropie);
		if(count($resultatEntropie) > 0) {
			$utilisateur = $resultatEntropie[0];
			$entropie = $utilisateur -> utl_entropie;
			$mdpEncrypte = hash("sha512", $mdpClair.$entropie);
			if($mdpEncrypte == strtolower($utilisateur -> utl_mdp)) {
				return $utilisateur;
			}
			else {
				return false;
			}
		}
		else {
			return false;
		}

	}
}
?>