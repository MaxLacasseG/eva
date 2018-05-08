SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

CREATE DATABASE eva;
USE eva;

--
-- Structure de la table cours
--

DROP TABLE IF EXISTS cours;
CREATE TABLE IF NOT EXISTS cours (
  crs_id tinyint(4) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant généré automatiquement.',
  crs_code char(10) CHARACTER SET utf8 NOT NULL COMMENT 'Code du cours sous la forme 582-XXX-MA.',
  crs_nom varchar(50) CHARACTER SET utf8 NOT NULL COMMENT 'Nom du cours.',
  PRIMARY KEY (crs_id),
  UNIQUE KEY crs_code (crs_code),
  UNIQUE KEY crs_nom (crs_nom)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=30 ;

--
-- Contenu de la table cours
--

INSERT INTO cours (crs_id, crs_code, crs_nom) VALUES
(1, '582-111-MA', 'Environnement professionnel'),
(2, '582-121-MA', 'Animation'),
(3, '582-122-MA', 'Image numérique 1'),
(4, '582-131-MA', 'Design graphique 1'),
(5, '582-151-MA', 'Création Web'),
(6, '582-223-MA', 'Image numérique 2'),
(7, '582-232-MA', 'Design graphique 2'),
(8, '582-242-MA', 'Programmation d''animation 1'),
(9, '582-243-MA', 'Programmation Web 1'),
(10, '582-324-MA', 'Création 3D 1'),
(11, '582-325-MA', 'Création vidéo 1'),
(12, '582-333-MA', 'Design d''interfaces'),
(13, '582-344-MA', 'Éléments médiatiques et bases de données'),
(14, '582-345-MA', 'Programmation d''animation 2'),
(15, '582-346-MA', 'Programmation Web 2'),
(16, '582-426-MA', 'Création 3D 2'),
(17, '582-427-MA', 'Conception sonore'),
(18, '582-434-MA', 'Scénarisation'),
(19, '582-447-MA', 'Assemblage de jeu'),
(20, '582-448-MA', 'Programmation d''animation 3'),
(21, '582-449-MA', 'Programmation Web 3'),
(22, '582-528-MA', 'Création 3D 3'),
(23, '582-535-MA', 'Gestion d''un projet multimédia'),
(24, '582-552-MA', 'Développement de jeu'),
(25, '582-554-MA', 'Production Web'),
(26, '582-629-MA', 'Création vidéo 2'),
(27, '582-636-MA', 'Projet de fin d''études'),
(28, '582-640-MA', 'Programmation et veille technologique'),
(29, '582-655-MA', 'Stage en milieu de travail');

-- --------------------------------------------------------

--
-- Structure de la table eleve
--

DROP TABLE IF EXISTS eleve;
CREATE TABLE IF NOT EXISTS eleve (
  elv_id mediumint(9) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant généré automatiquement.',
  elv_complet tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Évaluation complétée (1) ou non (0).',
  elv_grp_id_ce mediumint(9) NOT NULL COMMENT 'Identifiant du groupe de cours auquel appartient cet élève.',
  elv_utl_id_ce mediumint(9) NOT NULL COMMENT 'Identifiant de l''utilisateur correspondant à cet élève.',
  PRIMARY KEY (elv_id),
  UNIQUE KEY elv_grp_id_ce_2 (elv_grp_id_ce,elv_utl_id_ce),
  KEY elv_utl_id_ce (elv_utl_id_ce),
  KEY elv_grp_id_ce (elv_grp_id_ce)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Élève participant au processus d''évaluation.' AUTO_INCREMENT=89 ;

--
-- Contenu de la table eleve
--

INSERT INTO eleve (elv_id, elv_complet, elv_grp_id_ce, elv_utl_id_ce) VALUES
(1, 0, 1, 3),
(2, 0, 1, 4),
(3, 0, 1, 5),
(4, 0, 1, 6),
(5, 0, 1, 7),
(6, 0, 1, 8),
(7, 0, 1, 9),
(8, 0, 1, 10),
(9, 0, 1, 11),
(10, 0, 1, 12),
(11, 0, 1, 13),
(12, 0, 1, 14),
(13, 0, 1, 15),
(14, 0, 1, 16),
(15, 0, 1, 17),
(16, 0, 1, 18),
(17, 0, 1, 19),
(18, 0, 2, 20),
(19, 0, 2, 21),
(20, 0, 2, 22),
(21, 0, 2, 23),
(22, 0, 2, 24),
(23, 0, 2, 25),
(24, 0, 2, 26),
(25, 0, 2, 27),
(26, 0, 2, 28),
(27, 0, 2, 29),
(28, 0, 2, 30),
(29, 0, 2, 31),
(30, 0, 2, 32),
(31, 0, 2, 33),
(32, 0, 2, 34),
(33, 0, 2, 35),
(34, 0, 2, 36),
(35, 0, 2, 37),
(36, 0, 2, 38),
(55, 0, 4, 3),
(56, 0, 4, 22),
(57, 0, 4, 23),
(58, 0, 4, 24),
(59, 0, 4, 25),
(60, 0, 4, 26),
(61, 0, 4, 27),
(62, 0, 4, 28),
(63, 0, 4, 29),
(64, 0, 4, 30),
(65, 0, 4, 31),
(66, 0, 4, 32),
(67, 0, 4, 33),
(68, 0, 4, 34),
(69, 0, 4, 35),
(70, 0, 4, 36),
(71, 0, 4, 37),
(72, 0, 4, 38),
(73, 0, 5, 4),
(74, 0, 5, 5),
(75, 0, 5, 6),
(76, 0, 5, 7),
(77, 0, 5, 8),
(78, 0, 5, 9),
(79, 0, 5, 10),
(80, 0, 5, 11),
(81, 0, 5, 12),
(82, 0, 5, 13),
(83, 0, 5, 14),
(84, 0, 5, 15),
(85, 0, 5, 16),
(86, 0, 5, 17),
(87, 0, 5, 18),
(88, 0, 5, 19);

-- --------------------------------------------------------

--
-- Structure de la table formulaire
--

DROP TABLE IF EXISTS formulaire;
CREATE TABLE IF NOT EXISTS formulaire (
  frm_id smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant généré automatiquement.',
  frm_code char(6) CHARACTER SET utf8 NOT NULL COMMENT 'Code du programme auquel appartient ce formulaire d''évaluati',
  frm_nom varchar(150) CHARACTER SET utf8 NOT NULL COMMENT 'Nom du programme auquel appartient ce formulaire.',
  frm_date date NOT NULL COMMENT 'Date d''ajout de ce formulaire d''évaluation.',
  frm_actif tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Ce formulaire est actif (1) ou non (0). Un seul formulaire a',
  PRIMARY KEY (frm_id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Questionnaire d''évaluation.' AUTO_INCREMENT=2 ;

--
-- Contenu de la table formulaire
--

INSERT INTO formulaire (frm_id, frm_code, frm_nom, frm_date, frm_actif) VALUES
(1, '582.A1', 'Techniques d’intégration multimédia', '2017-02-15', 1);

-- --------------------------------------------------------

--
-- Structure de la table groupe
--

DROP TABLE IF EXISTS groupe;
CREATE TABLE IF NOT EXISTS groupe (
  grp_id mediumint(9) NOT NULL AUTO_INCREMENT,
  grp_session enum('A','H','E') CHARACTER SET utf8 NOT NULL COMMENT 'Session académique du groupe.',
  grp_annee year(4) NOT NULL COMMENT 'Année académique correspondante.',
  grp_numero tinyint(4) NOT NULL COMMENT 'Numéro du groupe, sans 0 à gauche.',
  grp_crs_id_ce tinyint(4) NOT NULL COMMENT 'Identifiant du cours associé à ce groupe.',
  grp_utl_id_ce mediumint(9) NOT NULL COMMENT 'Identifiant de l''enseignant associé à ce groupe.',
  PRIMARY KEY (grp_id),
  UNIQUE KEY grp_session (grp_session,grp_annee,grp_numero,grp_crs_id_ce),
  KEY grp_crs_id_ce (grp_crs_id_ce),
  KEY grp_utl_id_ce (grp_utl_id_ce)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=6 ;

--
-- Contenu de la table groupe
--

INSERT INTO groupe (grp_id, grp_session, grp_annee, grp_numero, grp_crs_id_ce, grp_utl_id_ce) VALUES
(1, 'H', 2017, 2, 20, 1),
(2, 'H', 2017, 1, 20, 1),
(4, 'H', 2017, 1, 19, 2),
(5, 'H', 2017, 2, 19, 2);

-- --------------------------------------------------------

--
-- Structure de la table question
--

DROP TABLE IF EXISTS question;
CREATE TABLE IF NOT EXISTS question (
  qst_id mediumint(9) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant généré automatiquement.',
  qst_numero tinyint(4) NOT NULL COMMENT 'Numéro de la question dans la section du formulaire d''évalua',
  qst_texte varchar(255) CHARACTER SET utf8 NOT NULL COMMENT 'Texte de la question d''évaluation.',
  qst_type enum('note','commentaire') CHARACTER SET utf8 NOT NULL DEFAULT 'note',
  qst_sct_id_ce smallint(6) NOT NULL COMMENT 'Identifiant de la section à laquelle appartient cette questi',
  PRIMARY KEY (qst_id),
  UNIQUE KEY qst_numero (qst_numero,qst_sct_id_ce),
  KEY qst_sct_id_ce (qst_sct_id_ce)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Question du formulaire d''évaluation.' AUTO_INCREMENT=24 ;

--
-- Contenu de la table question
--

INSERT INTO question (qst_id, qst_numero, qst_texte, qst_type, qst_sct_id_ce) VALUES
(1, 1, 'Les objectifs et le contenu du cours ont été clairement établis dès le début', 'note', 1),
(2, 2, 'La matière vue au cours correspond à ce qui est inscrit dans le plan de cours', 'note', 1),
(3, 3, 'Le cours ne répète pas indûment ce qui a été vu dans les autres cours du programme', 'note', 1),
(4, 4, 'La somme de travail (lectures, travaux, etc.) est conforme à la pondération', 'note', 1),
(5, 5, 'Les examens, travaux et exercices sont cohérents avec la matière vue en classe', 'note', 1),
(6, 6, 'Les objectifs annoncés au plan de cours ont été atteints', 'note', 1),
(7, 7, 'Le matériel pédagogique (cahier, notes de cours, documents, etc.) est en quantité suffisante', 'note', 1),
(8, 8, 'Le matériel pédagogique (cahier, notes de cours, documents, etc.) est pertinent et utile à l’apprentissage', 'note', 1),
(9, 9, 'Les équipements des salles de cours et des laboratoires sont adéquats pour répondre aux besoins du cours.', 'note', 1),
(10, 1, 'Le professeur maîtrise bien sa matière', 'note', 2),
(11, 2, 'Le professeur communique la matière de façon claire et cohérente', 'note', 2),
(12, 3, 'Les méthodes d’enseignement utilisées favorisent la compréhension de la matière', 'note', 2),
(13, 4, 'Le professeur fournit des exemples pertinents d’application de la matière', 'note', 2),
(14, 5, 'Le professeur manifeste de l’intérêt pour son enseignement', 'note', 2),
(15, 6, 'Les étudiants sont à l’aise pour poser des questions', 'note', 2),
(16, 7, 'Le professeur répond de façon satisfaisante aux questions des étudiants', 'note', 2),
(17, 8, 'Le professeur donne régulièrement du «feedback» écrit ou oral sur les apprentissages', 'note', 2),
(18, 9, 'Le professeur respecte les modalités d’évaluation prévues au plan de cours', 'note', 2),
(19, 10, 'Le professeur communique les résultats des travaux et des examens dans les délais prévus', 'note', 2),
(20, 11, 'Le professeur respecte l’horaire et la durée des cours', 'note', 2),
(21, 12, 'En dehors des heures de cours, le professeur est disponible aux heures convenues', 'note', 2),
(22, 13, 'J’ai apprécié l’enseignement du professeur', 'note', 2),
(23, 1, 'Quelles sont vos opinions, commentaires et suggestions concernant le contenu du cours, la qualité de la prestation de l’enseignant ou tout autre élément entourant le cours ?', 'commentaire', 3);

-- --------------------------------------------------------

--
-- Structure de la table reponse
--

DROP TABLE IF EXISTS reponse;
CREATE TABLE IF NOT EXISTS reponse (
  rep_id int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant généré automatiquement.',
  rep_note tinyint(4) NOT NULL COMMENT 'Note associée à cette réponse si la question est de type ''no',
  rep_commentaire mediumtext CHARACTER SET utf8 NOT NULL COMMENT 'Texte associé à cette réponse si la question est de type ''co',
  rep_elv_id_ce mediumint(9) NOT NULL COMMENT 'Identifiant de l''élève auquel appartient cette réponse d''éva',
  rep_qst_id_ce mediumint(9) NOT NULL COMMENT 'Identifiant de la question d''évaluation à laquelle correspon',
  PRIMARY KEY (rep_id),
  UNIQUE KEY rep_elv_id_ce_2 (rep_elv_id_ce,rep_qst_id_ce),
  KEY rep_elv_id_ce (rep_elv_id_ce),
  KEY rep_qst_id_ce (rep_qst_id_ce)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Réponse à une question du formulaire d''évaluation.' AUTO_INCREMENT=1 ;

--
-- Contenu de la table reponse
--


-- --------------------------------------------------------

--
-- Structure de la table section
--

DROP TABLE IF EXISTS section;
CREATE TABLE IF NOT EXISTS section (
  sct_id smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant généré automatiquement.',
  sct_numero tinyint(4) NOT NULL COMMENT 'Numéro de la section dans le formulaire d''évaluation.',
  sct_titre varchar(255) CHARACTER SET utf8 NOT NULL COMMENT 'Titre de la section du formulaire d''évaluation.',
  sct_instructions varchar(255) CHARACTER SET utf8 NOT NULL COMMENT 'Instructions particulières de la section du formulaire d''éva',
  sct_frm_id_ce smallint(6) NOT NULL COMMENT 'Identifiant du formulaire auquel appartient la section.',
  PRIMARY KEY (sct_id),
  UNIQUE KEY sct_numero (sct_numero,sct_frm_id_ce),
  KEY sct_frm_id_ce (sct_frm_id_ce)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Section du formulaire d''évaluation.' AUTO_INCREMENT=5 ;

--
-- Contenu de la table section
--

INSERT INTO section (sct_id, sct_numero, sct_titre, sct_instructions, sct_frm_id_ce) VALUES
(1, 1, 'Partie I – Contenu du cours , matériel pédagogique et environnement.', '', 1),
(2, 2, 'Partie II – Prestation de l’enseignement.', '', 1),
(3, 3, 'Partie III - Commentaires.', '', 1),
(4, 4, 'hgdfhgfghjgfh', '', 1);

-- --------------------------------------------------------

--
-- Structure de la table utilisateur
--

DROP TABLE IF EXISTS utilisateur;
CREATE TABLE IF NOT EXISTS utilisateur (
  utl_id mediumint(9) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant généré automatiquement.',
  utl_nom varchar(50) CHARACTER SET utf8 NOT NULL COMMENT 'Nom complet de l''utilisateur.',
  utl_code varchar(50) CHARACTER SET utf8 NOT NULL COMMENT 'Code de l''utilisateur. Pour les étudiants, il s''agit toujour',
  utl_mdp char(128) CHARACTER SET utf8 NOT NULL COMMENT 'Le mot de passe encrypté de l''utilisateur. Les mots de passe',
  utl_entropie varchar(255) CHARACTER SET utf8 NOT NULL COMMENT 'Chaîne de caractères aléatoire unique à chaque utilisateur e',
  utl_type enum('etudiant','enseignant','coordonnateur') CHARACTER SET utf8 NOT NULL DEFAULT 'etudiant' COMMENT 'Type d''utilisateur. Le type détermine les privilèges d''accès',
  utl_date date NOT NULL COMMENT 'Date d''ouverture du compte dans le système.',
  utl_connexion tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Une session est déjà ouverte pour cet utilisateur (1) ou non',
  PRIMARY KEY (utl_id),
  UNIQUE KEY utl_code (utl_code)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=39 ;

--
-- Contenu de la table utilisateur
--

INSERT INTO utilisateur (utl_id, utl_nom, utl_code, utl_mdp, utl_entropie, utl_type, utl_date, utl_connexion) VALUES
(1, 'Mathieu Dionne', 'mdionne@cmaisonneuve.qc.ca', '7b48449a13b0e9dff0c3ca6b14511d0475ec2dac24f994541243e7a365705e508e4055be4535ce9dc3543fc231579df20cbf04ac1d33eab44df728b8571dbbec', '533b103fe4cb91.72912241', 'enseignant', '2001-09-10', 0),
(2, 'Johanne Massé', 'jmasse@cmaisonneuve.qc.ca', '7b48449a13b0e9dff0c3ca6b14511d0475ec2dac24f994541243e7a365705e508e4055be4535ce9dc3543fc231579df20cbf04ac1d33eab44df728b8571dbbec', '533b103fe4cb91.72912241', 'coordonnateur', '2001-03-12', 0),
(3, 'Monica  Ayala', 'e9999901', '7b48449a13b0e9dff0c3ca6b14511d0475ec2dac24f994541243e7a365705e508e4055be4535ce9dc3543fc231579df20cbf04ac1d33eab44df728b8571dbbec', '533b103fe4cb91.72912241', 'etudiant', '2016-04-01', 0),
(4, 'Alex  Battista', 'e9999902', 'd7b3462850c3481eec9a5c48b6c079034d40052daf376e91435e300cc3549309b6f5159f3bda9d316441e4122468ade03233d0ad3b333419c1696ff5c17ffa44', '533b103fe54aa5.21239310', 'etudiant', '2016-04-01', 0),
(5, 'Raphaël  Charette-Bérubé', 'e9999903', '8f8f9826b745e22e125b0b42e78a206c953a191b1539f44bc4aeb51200bffeedd08edeb85a4a58f43678b9eb2c96bd93f32a74b682f43996b9ed35eea90294e9', '533b103fe5af27.51793286', 'etudiant', '2016-04-01', 0),
(6, 'François  Chiasson', 'e9999904', 'cab94ee8055f2bb68378267e668ce66d779a125985acb8a2c0863bdeef0b3d0e469ee688142449d0ea4bc471272f8d7ddbffdf9c019ad185ffe13bb25bf45b12', '533b103fe61352.87015730', 'etudiant', '2016-04-01', 0),
(7, 'Nicolas  Crevier', 'e9999905', '302d35ee039ed88c7f537c5027fe599f9f4e6ce697a0138fb0e3a8fa49e50830aa39927165b6e4a6dd2ea3c4dab8ef7961021a663a6594f9a208e7d95fa95ab6', '533b103fe677c0.31649551', 'etudiant', '2016-04-01', 0),
(8, 'Thomas  Desjardins', 'e9999906', '8a13059679211a5270692854852ef73e3843c40ad50d1c1e4790533150697673d17b505a3a6c0647153ab1fc089786e1414f8e90786c775521ca679496b2c17f', '533b103fe6e377.25308551', 'etudiant', '2016-04-01', 0),
(9, 'Olivier  Dewyse-Vergados', 'e9999907', 'c96685507fc66878f2cb57829f741b6fccab6e7ca9d91d993f42adc576851c8a775f4b978eacfe8ff9048151546e6785eca818c229a0ae10119f73f4222ba3fb', '533b103fe75d76.50125386', 'etudiant', '2016-04-01', 0),
(10, 'Kévin  Duguay', 'e9999908', 'b6a0d4c2ee386c779041f6a9a46d8a68e34556ad407c7babee1de591414674b0cfc58fcb8ae137931e1e26d5c32a1aba47390c78ce42d7b87c114a32f208e2bb', '533b103fe7f1a7.49988944', 'etudiant', '2016-04-01', 0),
(11, 'Jonathan  Lanteigne-Le Clair', 'e9999909', '3372ff69815ab3693d1bd3513c35ca48175d327d02ade1f12ed70d63693d201ef1da28a8d6ff88c211e43d1cf3b382cdcf647eb6a3c26513fcf700d2d69b0f21', '533b103fe85fd1.13926910', 'etudiant', '2016-04-01', 0),
(12, 'Simon  Marcoux', 'e9999910', 'c0c4d0f9feab703c35d708a215284812df07f765fcf6b0edb021c3d486266872ca3285a47341f265580ea3cb963a28c8efa46844071164cdc0321fd7bf65b098', '533b103fe8c615.13445977', 'etudiant', '2016-04-01', 0),
(13, 'Xavier  Martel-Lachance', 'e9999911', 'f18de6fae0d93bd8dfc04a7aa098f21fa9de45619ae46e4b36290474f94eed52f5a0f2d48615d3ba21f58985efc523e19aed67a0b44189f86ff6e922a77487ad', '533b103fe92ef3.69660912', 'etudiant', '2016-04-01', 0),
(14, 'Jérémie (S)  Morales Chaurette', 'e9999912', '9f85fcbaa941572eb30b84c641380ab5e51b83538fae5d9a60f82b4ebba6e3c5aa8c087d0f410542adaf4cad853cdd7872048c7b10888cc354e686b5851deedf', '533b103fe996f8.42872727', 'etudiant', '2016-04-01', 0),
(15, 'Ngoc Toan  Nguyen', 'e9999913', '3d9937615998d00b6cbd7d383c724e1d5261d9a4f01ad21a09ef4779989e67b1f6a64480b30621751ce4ba2698a69025df8a64a9f4a55cc04eb74d128c5274ed', '533b103fe9fca9.22383617', 'etudiant', '2016-04-01', 0),
(16, 'Maxime  Paquette', 'e9999914', 'ae08168226a156cfa22893168b32389b95ddf8e69dda10749d8da3ea55421240bb720bf7beaf649be2506771532831f4bbc0b4e03019e367dedafca1b9903191', '533b103fea6198.57981086', 'etudiant', '2016-04-01', 0),
(17, 'Louis  Raymond-Poirier', 'e9999915', '40755c22dd06db72931599927998940b66ab7f364d19c2e49e430a6d2d08a509ee8ac1c61ca78dd27e35c05136322c1281366630c6cc45d673a4ae30689732a9', '533b103feac971.25894099', 'etudiant', '2016-04-01', 0),
(18, 'Alexandre  Tessier', 'e9999916', 'b86d0589172bf48bd0b9cd4d390c07d94b16ba0e52ee607a5bb520b440e0bad65f4164f762544f99603d2ed4842b639aec9c3291b7bfb71ce2e2975055fa9256', '533b103feb3173.61051986', 'etudiant', '2016-04-01', 0),
(19, 'Henry  Valdez Gil', 'e9999917', 'baf585a35eb18a42c0383eac4ffd5f52ad7b8dc951a2f7281ba0f39b469382bf6f647f8457235d4cdc5f404005fdd80e89a842ae7e41eba3677ef0247c863cc2', '533b103feba7c9.57867835', 'etudiant', '2016-04-01', 0),
(20, 'Marc-Étienne  Assunçao-Denis', 'e9999920', 'e16f42481d936eaab9e73f9de66035efda8bb4bb0a8a75a1023168f432e68ed28195e64b8abd920cc73948d7d28d4487fd81a1ca0060ab68e9135902c240ddeb', '533b105a8c6371.44011355', 'etudiant', '2016-04-01', 0),
(21, 'Gabriel  Bélanger', 'e9999921', 'e18a10feea163cfdaa83dd8e0e0d754e937481c24b756514f217e19154e8d6ed074e085976cc1634bb51113d85777d09a361a7a9ad06a97de5346da2edee6e22', '533b105a8cf6e1.97592310', 'etudiant', '2016-04-01', 0),
(22, 'Lahcen  Bilachi', 'e9999922', '6ed456603a42181befcfaa686ec1ee42d574182006008f5c9e66af601c5ccd94b8a0e34d78cd47ee3e7477fca9ddbcedf2a1e199993b53b068cc842728d62c13', '533b105a8d5ff6.68655087', 'etudiant', '2016-04-01', 0),
(23, 'Maxime  Brassard', 'e9999923', 'fe2ca0e01fe8453c073cfb796d0ce29c12e2b6cb124c4aa20af5ca75f92078631d3b74363f35770d37c6ba55d031db31499375de50ca81339c1b2c3d6d6ea6a1', '533b105a8de8b0.54643940', 'etudiant', '2016-04-01', 0),
(24, 'Sothearavy  Chan', 'e9999924', '77bee1b90f94820b77fa90299f72b6486735b059514fcab139db25992eb716e6f04bac876c4fe2f7d5c14900062f2c544316df2c7318616cbfe8abe64cd6d3d4', '533b105a8e5130.39872687', 'etudiant', '2016-04-01', 0),
(25, 'Etienne  Denis', 'e9999925', '514d983a4128b6f616cc6d39120c8f5c77a87ba6ef025ac479fecac5b96c2d3ee03a7ed882545a005d25911184c942e32fad974d64889796679e20ff7034fc7f', '533b105a8eb879.96333839', 'etudiant', '2016-04-01', 0),
(26, 'Christophe  Dupuis', 'e9999926', '6ef0c3a3bc56ba202eb58bedd7e0b77b722c75bec3b1d1ed29fa4f357004ca863e48784b1d23f88376a341f64fa8267428ce94a19ddec8ac6ca865d53913a353', '533b105a8f1e21.21119950', 'etudiant', '2016-04-01', 0),
(27, 'Youssef  Farhi', 'e9999927', '3fa4f1aeec8483fbe73ee7084081b3d3b2df47557a77c16b89a249d0bb2036acbb3a12686e1b50ff9b5d6b62096ef31ae6885a82444d65dfb448965e64bcfdc8', '533b105a8f8664.88478736', 'etudiant', '2016-04-01', 0),
(28, 'Thomas  Forest', 'e9999928', 'eaf0b30f9346f58756addcbed42cfa538e80b70d908c6534afa8e512478a8bdbd74a08faf8e6a003fd4410cb54607c9022f18a4dbffd82da6b0f5836e70088a6', '533b105a8fee18.83699648', 'etudiant', '2016-04-01', 0),
(29, 'Marie-Élisabeth  Fouquet-Bouchard', 'e9999929', 'fb0882c11f778106e2267c08f426d4b54a3ea42dd5b49e5b1bf23e613274099e18ab293adb3d8808372f78a7ad08f6430cbea961768f203ce3d486c3c43a50b7', '533b105a9057e9.05113742', 'etudiant', '2016-04-01', 0),
(30, 'Olivier  Grandmont', 'e9999930', 'acf21f297d8a3d4b5a194945bb156260ae01763163ce9312f525817bf812a76e2b34ac8728686ebb18bb88769f11beb295d36c2f916b5e484f217ca8dbc7ddf5', '533b105a90bf29.16006621', 'etudiant', '2016-04-01', 0),
(31, 'Musana  Heligon', 'e9999931', '815c869bc49d79045c9c66d3d28a3b293b1c1076628612733f52622b82ec088b4f6845b19d7297dde1fb345145dd7e9e2d6834cca56a357fdba0ba47f4946e85', '533b105a913166.44542704', 'etudiant', '2016-04-01', 0),
(32, 'Alexandre  Jean', 'e9999932', 'fafa79b0a81acb4dba9a85eb583d74f6bd0c4d750d3ec7c62f834d5bbe80095c92867ec6d2200e92ea60d9922a88add876054cb24ea333f510e738091eecfed1', '533b105a91d509.65894485', 'etudiant', '2016-04-01', 0),
(33, 'Benjamin  Lauzon-Garceau', 'e9999933', '261648d046c8929063d64a18a514a9eede9fecab3c23853f729a65a3bdacbefac5f3a6107dd981ee58590db9541364181904346f855c71bc08a42dc57fa635d4', '533b105a92fee5.37962437', 'etudiant', '2016-04-01', 0),
(34, 'Simon  Marcotte', 'e9999934', 'd41788eaec43b2f756ce176f1282697432d838d127ad85ed6af592b4e54deeecb320c81d8aa206d6dc596eea555b2bfe4df5edf45f59c3571a1175f8d173017c', '533b105a9375b5.12174307', 'etudiant', '2016-04-01', 0),
(35, 'Yves  Morin', 'e9999935', '9a4c003646ff5c0ae78297c91a79fd009bad5540765f9231c807035cf35f16d49803f93971aae94a9f0e6c088438630926ff7ea5b92bf574eb5ff936413c746b', '533b105a952153.40347005', 'etudiant', '2016-04-01', 0),
(36, 'Jean-Simon  Paquette-Perrault', 'e9999936', '6810f7ad19f190f40bfb72e23ef6e6d469042486db3ddae822af57cb7b9cb662ab34c5cebcf9bbda81e86d50b58ebd2aa5e0b2feb545b839eac84b58bbf93b63', '533b105a965fe9.95709398', 'etudiant', '2016-04-01', 0),
(37, 'Loïc  Rodrigue-Gauthier', 'e9999937', 'c79fafd9df995db1966a016ac6da81f7d67d6807775c6044805ce4d9531b47107cce9f1ff12b41f1bc1e903590efdf6bd36e26faf01c4f9b9a52abbcbeca4e73', '533b105a96f706.31857067', 'etudiant', '2016-04-01', 0),
(38, 'Maxime  Tremblay', 'e9999938', '9ea12b3850233d4c4780236c06e4d5c5eae49010b8da03cd8889af275416978e0a1089d3447997216ea769f36dd2f12faac8cc6c778f3fcd9808a56eaf53ca51', '533b105a975f92.60873808', 'etudiant', '2016-04-01', 0);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table eleve
--
ALTER TABLE eleve
  ADD CONSTRAINT eleve_ibfk_1 FOREIGN KEY (elv_grp_id_ce) REFERENCES groupe (grp_id),
  ADD CONSTRAINT eleve_ibfk_2 FOREIGN KEY (elv_utl_id_ce) REFERENCES utilisateur (utl_id);

--
-- Contraintes pour la table groupe
--
ALTER TABLE groupe
  ADD CONSTRAINT groupe_ibfk_1 FOREIGN KEY (grp_crs_id_ce) REFERENCES cours (crs_id),
  ADD CONSTRAINT groupe_ibfk_2 FOREIGN KEY (grp_utl_id_ce) REFERENCES utilisateur (utl_id);

--
-- Contraintes pour la table question
--
ALTER TABLE question
  ADD CONSTRAINT question_ibfk_1 FOREIGN KEY (qst_sct_id_ce) REFERENCES section (sct_id);

--
-- Contraintes pour la table reponse
--
ALTER TABLE reponse
  ADD CONSTRAINT reponse_ibfk_1 FOREIGN KEY (rep_elv_id_ce) REFERENCES eleve (elv_id),
  ADD CONSTRAINT reponse_ibfk_2 FOREIGN KEY (rep_qst_id_ce) REFERENCES question (qst_id);

--
-- Contraintes pour la table section
--
ALTER TABLE section
  ADD CONSTRAINT section_ibfk_1 FOREIGN KEY (sct_frm_id_ce) REFERENCES formulaire (frm_id);
SET FOREIGN_KEY_CHECKS=1;
