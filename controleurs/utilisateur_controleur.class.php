<?php
class UtilisateurControleur extends Controleur {
	public function index() {
		return $this -> verifier();
	}

	public function verifier() {
		if(isset($_SESSION["utilisateur"])) {
			return json_encode($_SESSION["utilisateur"]);
		}
		return json_encode(false);
	}

	public function connexion() {
		$res = $this -> modele -> ouvrirConnexion($_POST);
		// Si un objet "utilisateur" est retourné
		if($res) {
			// Stocker l'information dans la "session d'utilisateur"
			$_SESSION["utilisateur"] = $res;
		}
		return json_encode($res);
	}

	public function deconnexion() {
		// Supprimer la variable de session "utilisateur"
		unset($_SESSION["utilisateur"]);
		return json_encode("Vous avez été déconnecté");
	}
}
?>