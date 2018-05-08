<?php  
class Gabarit {
	protected $variables = array();
	protected $controleur;
	protected $action;

	function __construct($controleur, $action) {
		$this -> controleur = $controleur;
		$this -> action = $action;	
	}

	public function affecter($nom, $valeur) {
		$this -> variables[$nom] = $valeur;
	}

	public function creerVue() {
		extract($this -> variables); // Voir la documentation PHP
		require_once('vues/entete.php');
		require_once('vues/'.$this -> controleur.'.php');
		require_once('vues/pieddepage.php');
	}
}

?>