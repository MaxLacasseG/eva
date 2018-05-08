<?php
class CoordonnateurControleur extends Controleur {
	public function index() {
		return;
	}

	/**
	 * Fonction servant à appeler le modèle qui affiche la liste des enseignants
	 * @param  int $param 0 = inactif, 1 = actif, 2 = tous
	 * @return string $aListe  Un tableau numérique contenant plusieurs objets enseignants encodé en chaine de caractère
	 */
	public function afficherListeEnseignants($param){
		sleep(1);
		$actif = $param[0];
		$aListe = $this -> modele -> lireEnseignants($actif);

		return json_encode($aListe);
	}

	/**
	 * Fonction servant à appeler le modèle qui crée un nouvel enseignant/coordonnateur dont les infos sont dans $_POST
	 * @return string $res Le id de l'enseignant créé encodé sous forme de chaine
	 */
	public function creerNouvelEnseignant (){
		$res = $this -> modele -> ajouterEnseignant($_POST);
		return json_encode($res);
	}

	/**
	 * Fonction servant à appeler le modèle qui modifie un enseignant dont les infos sont dans $_POST
	 * @return string  $res Le nb de lignes affectées par la modification
	 */
	public function modifierEnseignant(){
		$res = $this -> modele -> modifierEnseignant($_POST);
		return json_encode($res);
	}

	/**
	 * Fonction servant à appeler le modèle qui efface le mdp d'un enseignant dont les infos sont dans $_POST
	 * @return string  $res Le nb de lignes affectées par la modification
	 */
	public function rendreInactif(){
		$res = $this -> modele -> rendreInactif($_POST);
		return json_encode($res);
	}
}
?>