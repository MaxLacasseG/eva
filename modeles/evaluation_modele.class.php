<?php  
class EvaluationModele extends Sql {
	/**
	 * Obtenir la liste des questions du formulaire d'évaluation par programme
	 * @param  string $codeProgramme Le code ministériel du programme
	 * @return array|false  Tableau contenant les résultats sous forme d'objet PHP
	 *                      Ou la valeur booléenne false s'il n'y a pas de résultat
	 */
	function listeQuestions($codeProgramme="582.A1") {
		$codeProgramme = $this -> assainir($codeProgramme);
		
		$resultat = $this -> lire("
				SELECT sct_titre,sct_instructions,qst_id,qst_numero,qst_texte,qst_type FROM question
					JOIN section ON sct_id = qst_sct_id_ce
					JOIN formulaire ON frm_id = sct_frm_id_ce
				WHERE frm_code = '$codeProgramme'	
				ORDER BY sct_numero,qst_numero ASC
		");
		if(count($resultat) > 0) {
			return $resultat;
		}
		else {
			return false;
		}
	}

	/**
	 * Obtenir la liste des cours à évaluer par étudiant connecté
	 * @param  string $idUtil  Identifiant de l'utilisateur connecté
	 * @param  string $annee   Année scolaire
	 * @param  string $session Session scolaire (A ou H)
	 * @return array|false  Tableau contenant les résultats ou false si aucun résultat
	 */
	function listeCours($idUtil,$annee,$session) {
		$idUtil = $this -> assainir($idUtil);
		$annee = $this -> assainir($annee);
		$session = $this -> assainir($session);
	
		$resultat = $this -> lire("
				SELECT elv_id,crs_nom,p.utl_nom AS nom_prof 
					FROM utilisateur AS e
					JOIN eleve ON e.utl_id = elv_utl_id_ce
					JOIN groupe ON grp_id = elv_grp_id_ce
					JOIN cours ON crs_id = grp_crs_id_ce
        	JOIN utilisateur AS p ON p.utl_id = grp_utl_id_ce
				WHERE e.utl_id = $idUtil
					AND grp_annee = $annee
					AND grp_session = '$session'
		");
		if(count($resultat) > 0) {
			return $resultat;
		}
		else {
			return false;
		}
	}
}
?>