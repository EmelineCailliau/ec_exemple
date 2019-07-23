
<h1 style="color:indigo;text-decoration:underline;text-align:center"> Présentation de l'outil "Looker" </h1>
<br/>
<br/>



<h2 style="color:indigo"> Introduction </h2>
<p> Ce document a pour but de découvrir et d’apprendre à utiliser Looker, un outil de visualisation et d’accès aux données.
L’outil est introduit par la présentation de ses points forts et de ses points faibles et par la définition des termes techniques. Un exemple d’utilisation ainsi que quelques exemples de fonctionnalités sont expliqués afin de guider son utilisation. </p>
<br/>
<br/>
<br/>



<h2 style="color:indigo"> 1. Documents utiles </h2>
<h3 style="color:purple"> 1.1. Documentation générale </h3>
<p> Toute la documentation est disponible directement sur looker, on y trouve des liens un peu partout. On peut y accéder directement en passant par ce lien : <a href='https://docs.looker.com/' > https://docs.looker.com/ </a>.
Looker propose des cours en lignes gratuits : <a hrf='https://training.looker.com/'> https://training.looker.com/ </a>. </p>
<br/>
<br/>




<h3 style="color:purple"> 1.2. Base de données de l’exemple </h3>
<p> Diagramme de la base de données « snowlooker » utilisée pour le projet qui sert de modèle sur Looker (« Welcome to looker »), c’est cette connexion qui sera utilisée dans l’exemple de démonstration de ce rapport : </p>
<img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/Schema.png"/>
<i> Source <a href='https://dbdiagram.io/d/5cc6e504f7c5bb70c72fcb4d'> https://dbdiagram.io/d/5cc6e504f7c5bb70c72fcb4d </a>. </i>
<br/>
<br/>
<br/>

<h2 style="color:indigo"> 2. Introduction à Looker </h2>
<h3 style="color:purple">   2.1. Points forts et points faibles </h3>
<p> Liste non exhaustive des points forts et des points faibles de Looker : </p>

<table>
  <tr> <th style="color:green;text-align:center"> + </th> <th style="color:red;text-align:center"> - </th> </tr>
  <tr> <td> L’utilisation de <b style="color:green"> Git </b> permet à plusieurs développeurs de travailler en même temps sur le même projet. Les modifications apportées par chacun des développeurs au projet sont combinées. De plus, cela permet de garder une sauvegarde des versions du projet. </td> <td> On ne peut pas utiliser les données provenant d’un fichier <b style="color:red"> Excel </b> (ni csv, txt...) mais seulement celles provenant de bases de données (beaucoup de dialectes possibles).
  On peut quand même inclure une table provenant d’Excel en « bricolant » mais cela n’est possible que pour des tableaux avec peu de lignes et de colonnes : <br/>
  <ul>
  <li> En utilisant la fonction Excel « concatenate » : <a href='https://discourse.looker.com/t/uploading-spreadsheet-excel-google-sheets-data-into-looker/8529'> https://discourse.looker.com/t/uploading-spreadsheet-excel-google-sheets-data-into-looker/8529 </a> </li>
  <li> Ou en passant par GoogleSheet et une connexion BigQuery : <a href='https://discourse.looker.com/t/import-excel-data-into-looker/958/7'> https://discourse.looker.com/t/import-excel-data-into-looker/958/7 </a> </li>
  </ul>
 </td> </tr>
  <tr> <td> Le <b style="color:green"> self-service </b> : La création, modification et exploration des visualisations est simple donc les utilisateurs métiers peuvent s’en servir sans l’aide d’un analyste. De plus, la couche de modélisation de Looker (lookML) garantie la cohérence des analyses. </td> <td> Il y a <b style="color:red"> moins de graphiques et moins d’options </b> que sur d’autres outils (comme Tableau). On remarque entre autres qu’on ne peut pas représenter les données sur une carte lorsqu’on travaille sur les régions françaises, les villes… Il est seulement possible de faire des cartes pour les pays, les états, comtés et zip-code des Etats-Unis, les codes postaux d’Angleterre ainsi que les coordonnées GPS. Si on veut vraiment travailler sur les régions par exemple, il faut créer ou télécharger un fichier de données spatiales au format TopoJSON: https://docs.looker.com/reference/model-params/map_layer.  </td> </tr>
  <tr> <td> On peut <b style="color:green"> explorer les données </b> (naviguer, zoomer) de manière assez complète contrairement aux outils habituels. </td> <td> Il est impossible de modifier les infobulles. </td> </tr>
  <tr> <td> On peut <b style="color:green"> limiter l’accès aux données et les rôles </b> des utilisateurs. </td> <td>  </td> </tr>
  <tr> <td> On peut partager les liens de contenus (graphique, Dashboard…) avec d’autres utilisateurs ainsi que <b style="color:green"> planifier l’envoi </b> (ponctuel ou régulier) de ces contenus par mail. </td> <td>  </td> </tr>
  <tr> <td> Looker <b style="color:green"> interroge directement la base de données </b>  à chaque requête sans jamais importer/copier les données. </td> <td>  </td> </tr>
  <tr> <td> Il y a beaucoup de <b style="color:green"> documentation </b> ainsi que des cours (vidéos) pour apprendre à utiliser Looker. Donc il est possible de se former à Looker seul. </td> <td>  </td> </tr>
</table>

<br/>
<br/>




<h3 style="color:purple">   2.2. Termes techniques </h3>
<p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/Termes.png"/> </p>

<ul>
  <li> <b>LookML Project :</b> Un dossier contenant des fichiers LookML. Chaque projet correspond à un dépôt Git et à une connexion à une base de données. </li>
  <li> <b>Model :</b> Une collection d’explores. Il peut y avoir plusieurs modèles dans le même projet et des modèles peuvent se partager des fichiers « Views ». </li>
  <li> <b>Explore :</b> Un environnement de création de requêtes (qui permettra de créer des visualisations) isolé qui apparaît dans la liste déroulante « Explore » de Looker. Un explore est composé d’une vue de base et éventuellement de plusieurs autres vues jointes. </li>
  <li> <b>Join :</b> Permet de combiner des vues dans un explore. </li>
  <li> <b>Views :</b> Une table de données. Un fichier de vue pointe directement vers une table (matérielle) de la base de données ou vers une table dérivée et contient les définitions de toutes les colonnes qu’elle contient (sous forme de dimensions). Un fichier de vue contient aussi les définitions des mesures (agrégats) construites à partir de ces dimensions. </li>
  <li> <b>Dimension :</b> Un attribut (colonne) par lequel il est possible de grouper ou découper les données. Une dimension peut être matérielle ou dérivée. </li>
  <li> <b>Measure :</b> Une agrégation sur les données, qui peut être groupée par une dimension ou un ensemble de dimensions. Exemples : SUM, COUNT, MIN, AVG…  </li>
  <li> <b>Field Set :</b> Liste de champs qui seront utilisés ensemble. </li>
</ul>

<p> Pour plus de détails, consulter la page suivante : <a href="https://docs.Looker.com/data-modeling/learning-lookml/lookml-terms-and- concepts"> https://docs.Looker.com/data-modeling/learning-lookml/lookml-terms-and- concepts </a> </p>
<br/>
<br/>




<h3 style="color:purple">   2.3. Prise en main </h3>
<p> En fonction de ses droits, un utilisateur a accès aux onglets suivants : </p>
<p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/Onglet.png"/> </p>
<p> Pour exemple, un administrateur a accès à ces 4 onglets, un développeur a accès à tous les onglets sauf « Admin » et ainsi de suite. </p>
<br/>
<br/>
<br/>



<h2 style="color:indigo"> 3. Exemple d'utilisation simple avec la base SnowLooker </h2>
<p> Le modèle et le Dashboard que nous allons créer n’est qu’un simple exemple, Looker permet de faire plus de choses et certaines choses peuvent être faites de plusieurs façons. </p>
<p> Les résultats de cet exemple sont présents sur Looker : </p>

<ul>
  <li>  Nom du projet : ec_exemple </li>
  <li>  Emplacement du Dashboard et des visualisations : « Browse » → « Shared Space » → « Exemple Rapport ». </li>
</ul>

<p> Les résultats que vous obtiendrez si vous réaliser cet exemple ne seront sûrement pas les mêmes que sur les captures d’écran de ce rapport puisque la base de données est mise à jour quotidiennement. </p>
<br/>
<br/>




<h3 style="color:purple">   3.1. Ajout d'une connexion </h3>
<p> Avant d’établir une connexion, il faut configurer sa base de données pour Looker.
Documentation : <a href="https://docs.Looker.com/setup-and-management/Looker-hosted-install"> https://docs.Looker.com/setup-and-management/Looker-hosted-install </a> </p>
<p> Ici, on n’ajoutera pas de connexion puisqu’on va travailler avec une connexion déjà existante. </p>
<p> Pour la suite, il faut activer le mode développement : dans le menu du haut, cliquer sur « Develop » → « Development Mode ». </p>
<br/>
<br/>




<h3 style="color:purple">   3.2. Création d'un projet </h3>

<ul>
  <li>  Ajouter un projet : « Develop » → « Manage LookML Projects ». Cliquer sur « New LookML Project » en haut à gauche de la page. </li>
  <li>  Nommer le projet. </li>
  <li>  Choisir la connexion « snowLooker » c’est-à-dire la base de données sur laquelle on souhaite travailler. </li>
  <li>  Choisir « Single Table » et entrer le nom de la table que l’on veut utiliser : « order_items ». On aurait pu choisir « All Tables » si on a besoin de toutes les tables (déconseillé si plus de 25 tables). </li>
<p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex1.png"/> </p>
  <li>  Cliquer sur « Create Project » pour valider la création. </li>
</ul>

<br/>
<br/>




<h3 style="color:purple">   3.3. Création du modèle et des vues </h3>
<p> Une fois le projet créé, une vue est automatiquement créée pour la table « order_items ». Si on avait choisi « All Tables », une vue aurait été créé pour chacune des tables de la base. </p>
<p> On va améliorer cette vue, en ajouter une nouvelle et créer le modèle. </p>
<p> <i> <b style="text-decoration:underline">Remarque :</b> Au fur et à mesure qu’on écrit le code des vues et du modèle, on le test en cliquant sur « Validate Again » sur la gauche de l’écran. S’il y a des erreurs, on les corrige avant de continuer. </i> </p>


<h4 style="color:plum">   3.3.1. Création et modifications des vues </h4>
<p> On veut aussi travailler avec la table « users » donc on va créer une vue pour cette table : </p>

<ul>
<li>  Cliquer sur « Add » → « Create view from table » : </li>
<p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex2.PNG"/> </p>
<li>  Cocher la table « users » puis cliquer sur « Create View. </li>
</ul>

<p> On a maintenant 2 vues qui contiennent chacune une dimension pour chacun des champs de la table ainsi qu’une mesure (agrégat) permettant de compter les lignes de la table. </p>
<p> On peut ajouter d’autres dimensions et mesures à ces vues. </p>
<p> <b> Ajouter un champ (dimension ou mesure) dans une vue : </b> </p>

<ul>
  <li>  Ajout de dimensions dans la vue « users » : </li>
  <table> <tr> <td>
  dimension: majeur {   <i style="color:dodgerblue"> # dimension qui indique si l’utilisateur est majeur ou non </i> <br/>
    &nbsp;&nbsp;type: yesno     <i style="color:dodgerblue"> # boolean (il y a aussi « number »,  « time » …) </i> <br/>
    &nbsp;&nbsp;sql: ${age} >= 18 ;;      <i style="color:dodgerblue">  # condition pour que le booléen vaut « yes » </i> <br/>
  }
  </td> </tr> </table>
  <table> <tr> <td>
  dimension: name {   <i style="color:dodgerblue"> # dimension concaténation du prénom et du nom </i> <br/>
    &nbsp;&nbsp;label : "Nom" <br/>
    &nbsp;&nbsp;sql: CONCAT(${first_name}, ‘ ‘, ${last_name}) ;; <br/>
  }
  </td> </tr> </table>
  <li>  Ajout d’une mesure qui applique une fonction dans la vue « order_items » : </li>
  <table> <tr> <td>
  measure: prix_vente_total { <br/>
    &nbsp;&nbsp;hidden: yes     <i style="color:dodgerblue"> # ce champ ne sera pas utilisable dans l’Explore (ne pourra pas être utilisé dans une visualisation) </i> <br/>
    &nbsp;&nbsp;type: sum     <i style="color:dodgerblue"> # fonction à appliquer </i> <br/>
    &nbsp;&nbsp;sql: ${sale_price} ;;   <i style="color:dodgerblue">  # mesure ou dimension sur laquelle appliquer la fonction </i> <br/>
    &nbsp;&nbsp;value_format_name: usd    <i style="color:dodgerblue"> # résultat en dollars US </i> <br/>
  }
  </td> </tr> </table>
  <li> On peut aussi créer des vues dérivées d’une table : <a href="https://docs.Looker.com/data-modeling/learning-lookml/creating-ndts"> https://docs.Looker.com/data-modeling/learning-lookml/creating-ndts </a> <br/> Pour cela, cliquer sur « Add » → « Create View », nommer la vue « user_order_facts », la définir grâce à une requête sql puis déclarer les dimensions : <br/>
<p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex3.PNG"/> </p>

<table> <tr> <td>
view: user_order_facts { <br/>
  &nbsp;&nbsp;derived_table: { <br/>
    &nbsp;&nbsp;&nbsp;&nbsp;sql: <br/>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SELECT user_id as utilisateur, COUNT(*) as lifetime_order <br/>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;FROM orders <br/>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;GROUP BY user_id;; <br/>
  &nbsp;&nbsp;} <br/> <br/>
  <i style="color:dodgerblue"> #Créer des dimensions pour les champs sélectionnés dans la requête </i> <br/>
  &nbsp;&nbsp;dimension: utilisateur { <br/>
    &nbsp;&nbsp;&nbsp;&nbsp;primary_key: yes <br/>
    &nbsp;&nbsp;&nbsp;&nbsp;hidden: yes <br/>
    &nbsp;&nbsp;&nbsp;&nbsp;type: number <br/>
    &nbsp;&nbsp;&nbsp;&nbsp;sql: ${TABLE}.utilisateur ;; <br/>
  &nbsp;&nbsp;} <br/>
  &nbsp;&nbsp;dimension: lifetime_order { <br/>
    &nbsp;&nbsp;&nbsp;&nbsp;label: "Nombre d’items commandés" <br/>
    &nbsp;&nbsp;&nbsp;&nbsp;type: number <br/>
    &nbsp;&nbsp;&nbsp;&nbsp;sql: ${TABLE}.lifetime_orders ;; <br/>
&nbsp;&nbsp;} <br/>
}
</td> </tr> </table>

Cette table dérivée reliant chaque client à ces commandes permettra de connaitre des informations sur les commandes de chaque client. Par exemple, on pourra calculer le nombre de commande du client, la date de sa première commande…  </li>
</ul>


<h4 style="color:plum">   3.3.2. Création du modèle </h4>
<p> Dans le modèle, on joint les vues pour créer un Explore (si le modèle contient déjà des explore prédéfinis, on peut les effacer car ils ne nous seront pas utiles pour la suite) : </p>

<table> <tr> <td>
connection: "snowLooker" <br/>
include: "*.view" <br/> <br/>
explore: order_items {       <i style="color:dodgerblue"> # vue inclue dans l’Explore </i> <br/>
  &nbsp;&nbsp;label: "Commandes et utilisateurs"    <i style="color:dodgerblue"> # nom affiché dans le menu Explore </i> <br/>
  &nbsp;&nbsp;view_label: "Commandes"           <i style="color:dodgerblue"> # optionnel : nom de la vue qui apparaitra dans l’Explore </i> <br/>
  &nbsp;&nbsp;join: users {         <i style="color:dodgerblue">  # vue inclue dans l’Explore </i> <br/>
    &nbsp;&nbsp;&nbsp;&nbsp;view_label: "Utilisateurs" <br/>
    &nbsp;&nbsp;&nbsp;&nbsp;type: left_outer <br/>
    &nbsp;&nbsp;&nbsp;&nbsp;sql_on: ${order_items.user_id} = ${users.id} ;; <br/>
    &nbsp;&nbsp;&nbsp;&nbsp;relationship: many_to_one <br/>
  &nbsp;&nbsp;} <br/>
  &nbsp;&nbsp;join: user_order_facts {  <br/>
    &nbsp;&nbsp;&nbsp;&nbsp;view_label: "Utilisateurs" <br/>
    &nbsp;&nbsp;&nbsp;&nbsp;relationship: many_to_one <br/>
    &nbsp;&nbsp;&nbsp;&nbsp;sql_on: ${user_order_facts.utilisateur} = ${order_items.user_id} ;; <br/>
  &nbsp;&nbsp;} <br/>
  }
</td> </tr> </table>

<p> On peut ensuite se rendre dans l’explore « Commandes et utilisateurs » pour mieux voir à quoi ressemble notre explore. Pour cela, aller dans l’onglet « Explore » → « Commandes et utilisateurs » (sous le nom du projet) et observer l’organisation des champs sur la gauche. On retrouve bien nos 2 labels pour les vues et on constate que les champs des vues « users » et « users_order_fact » sont sous le même label. </p>
<br/>
<br/>



<h3 style="color:purple">   3.4. Partager le projet sur Git </h3>
<p> Cette partie permet de passer le projet en production pour qu’il soit accessible à d’autres utilisateurs. Il est possible de continuer sans partager le projet sur Git mais tant que ce n’est pas fait, personne d’autre que vous n’y aura accès donc vous serez le seul à pouvoir créer, modifier et voir les visualisations. </p>
<p> <b> Nouveau dépôt sur Git (pour un nouveau projet) : </b> </p>

<ul>
  <li>  Aller sur le site de GitHub (https://github.com/) et se connecter (ou créer un compte). </li>
  <li>  Cliquer sur « New » (en haut à gauche) pour créer un nouveau dépôt puis nommer le et cocher la case « private » (ou « public » si on a un compte gratuit, sachant que les projets publics sont visibles par tout le monde). </li>
  <li>  Copier l’adresse SSH de ce dépôt. </li>
  <li>  Aller sur Looker (en mode développement) dans l’onglet Develop → Nom du projet. </li>
  <li>  Cliquer sur « Configure Git » en haut à gauche puis coller l’adresse SSH. </li>
  <li>  Copier la clé que donne Looker. </li>
  <li>  Sur le site de Git, aller dans Settings → Deploy Key, cliquer sur « Add New Key » puis coller la clé et cocher « Allow write access ». </li>
  <li>  Retourner sur Looker et cliquer sur « Continue Setup » puis en haut à gauche de la page sur « Validate LookML » puis « Commit Changes » puis « Pull and Merge other Changes » et enfin « Deploy to Production ». </li>
</ul>

<p> <b> Mettre à jour Git avec les changements qu’on a fait sur le projet : </b> </p>
<ul>
  <li>  Cliquer sur « Commit Changes » puis éventuellement sur « Pull and merge other Changes » permet de partager les changements qu’on a effectué sur le projet avec les autres développeurs (qui sont en mode développement). </li>
  <li> Cliquer sur « Deploy to Production » permet de partager le projet avec les utilisateurs non développeurs (qui ne sont pas en mode développement). Cela leur permettra, en fonction de leurs droits, d’explorer les données, de créer des contenus (Looks et Dashboards) ainsi que de visualiser les contenus que les développeurs ont créés.</li>

</ul>
<p> Une fois que le projet est partagé avec la production, on peut quitter le mode développement (sauf si on veut continuer à développer). </p>
<br/>
<br/>



<h3 style="color:purple">   3.5. Création de visualisations dans un Dashboard </h3>

<h4 style="color:plum">   3.5.1. Une valeur </h4>
<p> Nous allons représenter le nombre d’utilisateurs majeurs : </p>

<ul>
  <li>  Dans le menu, aller sur « Explore » → « Commandes et utilisateurs » (sous le nom du projet). </li>
  <li>  Sélectionner les dimensions et les mesures que l’on souhaite représenter c’est-à-dire « Majeur » et « Count » dans le sous-groupe « Utilisateurs ». </li>
  <li>  Sélectionner le type de visualisation « Single value ». </li>
  <li>  Cliquer sur « Run » en haut à droite. </li>
  <li>  Ajouter un texte sous la valeur en allant dans « EDIT ». </li>
  <p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex4.png"/> </p>
  <li>  Ajouter cette visualisation dans un Dashboard : </li>
  <p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex5.PNG"/> </p>
  <li>  On n’a pas encore de Dashboard donc on en créé un nouveau dans son espace personnel en cliquant sur « New Dashboard » en bas à gauche de la fenêtre. Puis on nomme ce Dashboard. </li>
  <li>  Ajouter un titre à la visualisation et sélectionner le Dashboard dans lequel on veut l’ajouter. </li>
  <p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex6.png"/> </p>
  <li>  Cliquer sur « Save to Dashboard ». La visualisation a donc été ajouté au Dashboard. </li>
</ul>


<h4 style="color:plum">   3.5.2. Un graphique </h4>
<p> Nous allons représenter l’évolution du nombre d’items vendus par mois : </p>

<ul>
  <li>  Pour créer une nouvelle visualisation, on désélectionne tous les champs que l’on avait ajouté à la visualisation précédente en allant dans les paramètres en haut à droite (roue dentée) et cliquer sur « Remove Fields & Filters ». </li>
  <li>  Sélectionner les dimensions et les mesures que l’on souhaite représenter c’est-à-dire « Created Month » (se trouve dans « Created Date » → « Month ») et « Count » sous le label « Commandes ». </li>
  <li>  Sélectionner la visualisation « line ». </li>
  <li>  Ajouter un filtre afin de ne voir l’évolution que pour les 12 mois précédents (en excluant le mois en cours). Pour cela cliquer sur « FILTER » à côté de « Month » dans la liste des champs sur la gauche de l’écran puis choisir le type de filtre « is in the past » et indiquer 12 « complete months ». </li>
  <li>  Ensuite cliquer sur « Run » pour lancer la requête et appliquer le filtre. </li>
  <li>  Aller dans « EDIT » pour modifier le nom de l’axe des ordonnées dans l’onglet « X ». Aussi, dans l’onglet « Series », modifier le type de points pour « Outline » et changer la couleur de la courbe : </li>
  <p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex7.png"/> </p>
  <li>  On va sauvegarder cette visualisation sans l’ajouter à un Dashboard, cela permettra plus tard, si on le souhaite de l’insérer à plusieurs Dashboards. En effet, quand on sauvegarde seulement une vue dans une Dashboard, cela ne permet pas de l’insérer à d’autres Dashboards par la suite : </li>
  <p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex8.PNG"/> </p>
  <li>  Nommer la visualisation « Evolution du nombre d’items vendus par mois » et la sauvegarder dans son espace personnel. </li>
</ul>
<br/>
<br/>



<h3 style="color:purple">   3.6. Visualisation et modification du Dashboard </h3>
<p> On va insérer la visualisation « Evolution du nombre de commandes », que nous avions sauvegardé dans notre espace personnel, au Dashboard  que nous avions créé dans ce même espace : <p>

<ul>
  <li>  Aller dans l’onglet « Browse » → « YourName’s Space ».
    <i> <b style="text-decoration:underline">Remarque :</b> Dans cette espace (ou n’importe quel autre espace), on peut créer un nouveau Dashboard en allant sur « New » → « Dashboard » en haut à droite. On peut aussi créer des sous-espace (sorte de dossier) en allant sur « New » → « Space ». C’est aussi dans cet espace qu’on retrouve la visualisation « Evolution du nombre de commandes ». </i>
  </li>
  <li>  Cliquer sur le Dashboard pour l’ouvrir; </li>
  <li>  Cliquer sur « Edit » en haut à droite puis sur « Looks » et cliquer sur « Add » à côté du nom de la visualisation puis sur « Update Dashboard ». </li>
</ul>

<p> On va ajouter un filtre sur le pays de l’utilisateur sur l’ensemble du Dashboard : </p>
<ul>
  <li>  Cliquer sur « Filters » et indiquer les informations du filtre, c’est le champs « Country » de la vue « Utilisateur » qui est filtré et la valeur par défaut est « USA ». On applique le filtre aux 2 visualisations du Dashboard : </li>
  <p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex9.PNG"/> </p>
  <li>  Demander que le Dashboard ne puisse pas s’exécuter s’il n’y a pas de valeur sur ce filtre et à ce que les valeurs multiples soient autorisées : </li>
  <p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex11.png"/> </p>
  <li>  Cliquer sur « Save ». </li>
  <li>  Cliquer sur « Done Editing » en haut à droite pour enregistrer les modifications effectuées. </li>
  <li>  Cliquer sur « Run » pour appliquer le filtre aux visualisations du Dashboard. </li>
</ul>
<br/>
<br/>



<h3 style="color:purple">  3.7. Planifier l’envoi du Dashboard </h3>
<p> Il est possible de planifier l’envoi d’une visualisation ou d’un Dashboard. On va planifier l’envoi du Dashboard tous les jours du lundi au vendredi à 9h : </p>

<ul>
<li>  Ouvrir le Dashboard : onglet « Browse  → « YourName’s Space ». </li>
<li>  Une fois le Dashboard ouvert, cliquer sur la roue dentée en haut à droite puis sur « Schedule ». </li>
<li>  Choisir les options qu’on veut, les destinataires… : </li>
<p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex13.png"/> </p>
<li>  Cliquer sur « Save All ». </li>
</ul>
