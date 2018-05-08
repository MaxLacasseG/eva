<?php  
class Controleur {
	protected $modele;
	protected $controleur;
	protected $action;
	protected $gabarit;

	function __construct($modele, $controleur, $action) {
		$this -> modele = new $modele();
		$this -> controleur = $controleur;
		$this -> action = $action;
		$this -> gabarit = new Gabarit($controleur, $action);
		$this -> affecter('page', $controleur);
	}

	protected function affecter($nom, $valeur) {
		$this -> gabarit -> affecter($nom, $valeur);
	}

	// function __destruct() {
	// 	$this -> gabarit -> creerVue();
	// }
}
?>