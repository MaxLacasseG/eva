<?php  
class CoordonnateurModele extends Sql {

	/**
	 * Fonction retournant les enseignants enregistrés dans la base de données
	 * @param  string 	$actif 	Permet de sélectionner si l'on doit retourner les enseignants actif ou non, si NULL, retourne tous les enseignants actifs et inactifs
	 * @return  Tableau numérique associatif 	$oTabEnseignants 	Contient le jeu d'enregistrement contenant les enseignants et leurs propriétés
	 */
	function lireEnseignants($actif){
		//Initialisation de l'année et la session actuelle. Sera employée dans la requête plus bas
		$annee = Date('Y');
		Date('n')<=7? $session = "H" : $session = "A";

		//Condition pour l'affichage de la liste (0=inactif, 1=actif, 2=tous);
		$condition;
		switch($actif[0]){
			case "1":
				$condition = " AND u.utl_mdp != ''";
				break;
			case "0":
				$condition = "AND u.utl_mdp = ''";
				break;
			default:
				$condition = "";		
		}
		
		//Requête à la BDD
		$req = "SELECT u.utl_id, u.utl_nom, u.utl_type, u.utl_code FROM utilisateur AS u WHERE (u.utl_type = 'enseignant' || u.utl_type = 'coordonnateur')".$condition;
		$oTabEnseignant = $this -> lire($req);

		//2e requête pour afficher la liste des cours enseignés lors de la session/année en cours
		foreach ($oTabEnseignant as $enseignant) {
			//Tableau qui contiendra la liste des cours enseignés par un enseignant
			$listeCours = array();
			$id = $enseignant -> utl_id;

			//2e requête
			$reqCours = "SELECT DISTINCT c.crs_code FROM cours AS c 
						JOIN groupe AS g ON g.grp_crs_id_ce = c.crs_id 
						WHERE g.grp_utl_id_ce = '$id' AND (g.grp_annee = '$annee' AND g.grp_session = '$session')";
			
			$resCours = $this -> lire($reqCours);

			//Enregistre le tout dans un tableau numérique pour pouvoir utiliser le join plus facilement ensuite en JS
			foreach($resCours as $cours){
				$listeCours[] = $cours -> crs_code;
			}
			
			//Ajoute le tableau dans une propriété de l'enseignant
			$enseignant -> cours = $listeCours;

			//Vide la liste de la mémoire
			unset($listeCours);
		}
		//Retourne le jeu d'enregistrement contenant les enseignants trouvés
		return $oTabEnseignant;
	}

	/**
	 * Fonction servant à enregistrer un nouvel enseignant dans la BDD
	 * @param  objet $p Tableau associatif contenant les informations d'un enseignant passé via $_POST
	 * @return int $resultat Retourne le id de la dernière ligne enregistrée
	 */
	function ajouterEnseignant($p){
		//Évite les injections SQL
		$nom = $this -> assainir($p['utl_nom']);
		$code = $this -> assainir($p['utl_code']);
		$type = $this -> assainir($p['utl_type']);

		//Date de la création de l'utilisateur
		$date_ajout = Date('Y'."-".'m'."-".'d');

		//Ajoute l'entropie pour le mot de passe
		$entropie = uniqid("", true);

		//Requête SQL à la BDD
		$req = "INSERT INTO utilisateur (utl_nom, utl_type, utl_code, utl_entropie, utl_date) VALUES ('$nom', '$type', '$code', '$entropie', '$date_ajout')";
		$resultat = $this -> inserer($req);

		return $resultat;
	}

	/**
	 * Fonction servant à modifier les informations d'un enseignant
	 * @param  objet $p Tableau associatif contenant les informations d'un enseignant passé via $_POST
	 * @return int $resultat Retourne le nb d'enregistrements effectués, 0 si la requête a échouée
	 */
	function modifierEnseignant($p){
		//Évite les injections SQL
		$id = $this -> assainir($p['utl_id']);
		$nom = $this -> assainir($p['utl_nom']);
		$code = $this -> assainir($p['utl_code']);
		$type = $this -> assainir($p['utl_type']);
		
		//Requête SQL à la BDD
		$req = "UPDATE utilisateur SET utl_nom = '$nom', utl_type = '$type', utl_code = '$code' WHERE utl_id = '$id'";
		$resultat = $this -> modifier($req);

		return $resultat;
	}

	/**
	 * Fonction servant à effacer le champ utl_mdp d'un enseignant dans la BDD
	 * @param  objet $p Tableau associatif contenant les informations d'un enseignant passé via $_POST
	 * @return int $resultat Retourne le nb d'enregistrements effectués, 0 si la requête a échouée
	 */
	function rendreInactif($p){
		//Évite les injections SQL
		$id = $this -> assainir($p["utl_id"]);

		//Requête SQL à la BDD
		$req = "UPDATE utilisateur SET utl_mdp = '' WHERE utl_id = '$id'";
		$resultat = $this -> modifier($req);

		return $resultat;
	}
}
?>