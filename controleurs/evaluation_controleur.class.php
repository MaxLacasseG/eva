<?php
class EvaluationControleur extends Controleur {
	public function index() {
		return $this -> lireQuestionsCours();
	}

	public function lireQuestionsCours() {
		$idUtil = $_SESSION["utilisateur"] -> utl_id;
		$date = getdate(); // Date courante
		$annee = $date["year"];
		$session = ($date["mon"]<7)?"H":"A";

		$cours = $this -> modele -> listeCours($idUtil, $annee, $session);
		$questions = $this -> modele -> listeQuestions();

		return json_encode(
					array(
						"cours" => $cours, 
						"questions" => $questions
					)
				);
	}
}
?>