(function() {
	$(function() {
		// GESTIONNAIRES D'ÉVÉNEMENTS DIRECTS
		// ===================================
		// Section Login
		// ===================================
		// Basculer l'affichage du champs "mot de passe oublié"
		//
		// Affichage du spinner
		$(document).ajaxStart(function(){
			$("body").addClass("chargement");
		});

		// Cache le spinner
		$(document).ajaxStop(function(){
			$("body").removeClass("chargement");
		}); 
		
		$('.mdp-oublie').on('click',function(){$('.mdp-oublie-courriel').val('').toggle();});

		// Gérer le chargement de la page
		$.ajax("utilisateur/verifier").done(gererConnexion);

		// Gérer le click sur le bouton "connexion"
		$("input[name='connexion']").on("click",connexion);

		// Gérer la déconnexion
		$("#btnDeconnexion").on("click",function() {
			$.ajax("utilisateur/deconnexion").done(function(reponse) {
				$(".erreur-connexion").html(reponse);
				console.log("deconnexion");
				window.location.reload(true);
			});
		});


		// Section Coordonnateur
		// ===================================
		// Création de la boite de dialogue pour la création d'un nouvel enseignant
		$(".ajouter-nouveau").on("click", function(){
			var boiteModale = $(".boite-frm.gabarit").clone().removeClass("gabarit");
			$(".nouvel-enseignant").show().append(boiteModale);
		});

		//Écouteur d'événements sur les boutons servant à afficher la liste des enseignants
		$("#statutEnseignant .btn").on("click", function(){
			//console.log($("#statutEnseignant button"));
			$("#statutEnseignant button").attr("aria-pressed", false);
			$(this).attr("aria-pressed", true);
			mettreAJourListe();
		});



		// GESTIONNAIRES D'ÉVÉNEMENTS DÉLÉGUÉS 
		// ===================================
		// Section Étudiant
		// ===================================
		$("#listeCours").on("click", ".zone-reponse .note span", function() {
			var ceci = $(this);
			// Enlever la classe "choisi" sur tous les "span" de note
			$("span", ceci.parent()).removeClass("choisi");
			// L'ajouter uniquement à celui qui a été cliqué.
			ceci.addClass("choisi");
		});
		
		// Section Coordonnateur
		// ===================================
		// Écouteur d'événement pour création d'un nouvel enseignant
		// Bouton annuler
		$(".nouvel-enseignant").on("click", ".btn-annuler", function(){
			$(".boite-frm", ".nouvel-enseignant").remove();
			$(".nouvel-enseignant").hide();
		});

		// Écouteur d'événement pour création/modification d'un enseignant
		// ========
		// Bouton sauvegarder
		$(".nouvel-enseignant").on("click", ".btn-sauvegarder", function(){
	 		
			$recherche = $(".boite-contenu");
			$id = $("#champ_utl_id", $recherche).val();
		
			if($id == "0"){
				creerNouvelEnseignant();
			}else{
				modifierEnseignant();
			}
			
			$(".boite-frm", ".nouvel-enseignant").remove();
			$(".nouvel-enseignant").hide();
		});

		// Icone modifier
		$(".liste-articles").on("click", ".btn-modifier", function(){
			$this = $(this);
			$recherche = $this.parent().parent();
			
			$id = $(".ens-id",$recherche).text();
			$nom =  $(".ens-nom", $recherche).text();
			$code =  $(".ens-courriel", $recherche).text();
			$type =  $(".ens-type", $recherche).text();
			
			var boiteModale = $(".boite-frm.gabarit").clone().removeClass("gabarit");
			$(".titre-article", boiteModale).text("Modifier enseignant");
			$("#champ_utl_id", boiteModale).val($id);
			$("#champ_utl_nom", boiteModale).val($nom);
			$("#champ_utl_courriel", boiteModale).val($code);
			$("#champ_utl_type", boiteModale).val($type);			

			$(".nouvel-enseignant").show().append(boiteModale);
		});

		// Icone rendre inactif
		$(".liste-articles").on("click", ".btn-statut", function(){
			$id = $(".ens-id", $(this).parent().parent()).text();
			rendreInactif($id);
		});	
	});

	//================================
	// FONCTIONS
	// 
	// CONNEXION
	function connexion(e) {
		// Ne pas soumettre le formulaire
		e.preventDefault();
		// Faire la requête AJAX pour vérifier l'utilisateur
		$.ajax({
			method: "POST",
			url: "utilisateur/connexion",
			data: $(this).closest("form").serialize()
		}).done(gererConnexion);
	}

	function gererConnexion(utilisateur) {
		// Si l'authentification est bonne
		if(utilisateur) {
			//console.log(utilisateur);
			$(".profile .utilisateur-nom").html(utilisateur.utl_nom);
			$("#pageConnexion").hide();
			// Afficher la section selon le type d'utilisateur
			switch(utilisateur.utl_type) {
				case "etudiant":
					// Générer les questions/cours à évaluer
					$.ajax({
						"url": "evaluation/lireQuestionsCours",
						"method": "POST",
						"data": "utilisateur=" + utilisateur.utl_id
					}).done(gererEvaluation);

					// ... et afficher la section correspondante
					$("#pageEvaluation").show();
					break;
				case "enseignant": 
					// Générer les résultats des évaluations (prof connecté)

					// ... et afficher la section correspondante
					$("#pageEnseignant").show();
					break;
				case "coordonnateur":
					// Générer les résultats des évaluations (tous les profs)

					// ... et afficher la section correspondante
					$("#pageCoordonateur").show();
					listerEnseignants("1");
					break;
			}
			$(".profile").show();
			// Réinitialiser le formulaire de connexion
			document.getElementById("frmUtilisateur").reset();
		}
		else {
			// On bouge pas : on affiche le message d'erreur
			$(".erreur-connexion").html("On ne vous reconnaît pas !");
		}
	}

	//SECTION ÉTUDIANT
	//=================================
	function gererEvaluation(reponse) {
		var $gabaritCours;
		var cours = reponse.cours;
		for (var i = 0; i < cours.length; i++) {
			// 1 : cloner le gabarit d'un cours
			$gabaritCours = $(".reponse.template").clone().removeClass("template");
			// 2 : insérer le contenu (et attributs) dans le gabarit
			$("span.cours", $gabaritCours).text(cours[i].crs_nom + " (" + cours[i].nom_prof + ")");
			$gabaritCours.attr("data-eleve-id", cours[i].elv_id);
			// 3 : Injecter le gabarit cloné dans la page.
			$("#listeCours").append($gabaritCours);
		}
		gererQuestions(reponse.questions);
	}

	var lesQuestions = null;
	
	function gererQuestions(questions) {
		lesQuestions = questions;
		afficherQuestion(0);
	}

	function afficherQuestion(positionQuestion) {
		var question = lesQuestions[positionQuestion];
		$(".titre-section").text(question.sct_titre);
		$(".instructions").text(question.sct_instructions);
		$(".texte-question dt > span").text(question.qst_numero);
		$(".qstTexte").text(question.qst_texte);
		$("article.question").attr("data-id", question.qst_id);
		$("article.question").attr("data-pos", positionQuestion);
		$(".zone-reponse .note, .zone-reponse .commentaire").hide();
		$(".zone-reponse ." + question.qst_type).show();
	}

	//SECTION COORDONNATEUR
	//=================================
	/**
	 * Fonction servant à lister tous les enseignants, actif, non ou tous
	 * @param  {int} $actif Entier entre 0 et 2 indiquant l'état des enseignants à rechercher. 0=inactif, 1=actif, 2=tous
	 * @return {void}      
	 */
	function listerEnseignants($actif){

		$.ajax({
			method: "POST",
			url: "coordonnateur/afficherListeEnseignants/" + $actif,
		}).done(afficherListeEnseignants);
	}

	/**
	 * Réponse de la requête AJAX listerEnseignants. Ajoute les données à la liste
	 * @param  {objet} oListeEnseignants Tableau numérique contenant des objets contenant les données
	 * @return {void}                  
	 */
	function afficherListeEnseignants(oListeEnseignants){
		$(".article-enseignant:not('.gabarit')").remove();
		var enseignant;
		var nbEnseignants = oListeEnseignants.length;

		for(i=0; i<nbEnseignants; i++){
			listeCours = "";
			enseignant = $(".article-enseignant.gabarit").clone().removeClass("gabarit");
			$("span.ens-id", enseignant).text(oListeEnseignants[i].utl_id);
			$("span.ens-nom", enseignant).text(oListeEnseignants[i].utl_nom);
			$("span.ens-courriel", enseignant).text(oListeEnseignants[i].utl_code);
			$("span.ens-type", enseignant).text(oListeEnseignants[i].utl_type);
			$("span.ens-cours", enseignant).text(oListeEnseignants[i].cours.join(", "));
			$(".liste-articles").append(enseignant);
		}
	}

	/**
	 * Fonction servant à rafraîchir la liste des enseignants via AJAX
	 * @return {void}
	 */
	function mettreAJourListe(){
		var $actif = $(".enseignants-controle button[aria-pressed = \"true\"]").attr("data-value");
		listerEnseignants($actif);
	}

	/**
	 * Fonction servant à créer un nouvel enseignant via AJAX
	 * @return {void} 
	 */
	function creerNouvelEnseignant(){
		$.ajax({
			method: "POST",
			url: "coordonnateur/creerNouvelEnseignant",
			data: $(".nouvel-enseignant form:not('.gabarit')").serialize()
		}).done(reponseCreationEnseignant);
	}

	/**
	 * Réponse suite à la fonction création de l'enseignant. Met à jour à liste affichée
	 * @param  {int} reponse le id du nouvel enseignant créé
	 * @return {void}   
	 */
	function reponseCreationEnseignant(reponse){
		$(".toast").slideUp(400).text(reponse);
		// instancier gabarit
		// timer
		// destroy();
		mettreAJourListe();
	}

	/**
	 * [modifierEnseignant Fonction servant à modifier un enseignant via AJAX]
	 * @return {void}
	 */
	function modifierEnseignant(){
		$.ajax({
			method: "POST",
			url: "coordonnateur/modifierEnseignant",
			data: $(".nouvel-enseignant form:not('.gabarit')").serialize()
		}).done(reponseModificationEnseignant);
	}

	/**
	 * Fonction gérant la réponse suite à la fonction modifierEnseignant. Met à jour à liste affichée
	 * @param  {int} reponse  Contient le nombre de lignes modifiées
	 
	 */

	function reponseModificationEnseignant(reponse){
		mettreAJourListe();
	}

	/**
	 * Fonction servant à désactiver le mdp d'un utilisateur via AJAX
	 * @param  {int} $id Le id de l'utilisateur désactiver
	 * @return {void}   
	 */
	function rendreInactif($id){
		var utl = {utl_id:$id};
		$.ajax({
			method: "POST",
			url: "coordonnateur/rendreInactif",
			data: utl
		}).done(reponseInactif);
	}

	/**
	 * Fonction gérant la réponse suite à la fonction rendreInactif. Met à jour la liste affichée
	 * @param  {int} reponse  Contient le nombre de lignes modifiée
	 * @return {void}   
	 */
	function reponseInactif(reponse){
		mettreAJourListe();
	}
}());