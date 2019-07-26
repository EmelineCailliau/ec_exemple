
<h1 style="color:indigo;text-decoration:underline;text-align:center"> Présentation de l'outil "Looker" </h1>
<br/>
<br/>


<h2 style="color:indigo"> Table des matières </h2>

<ol style="list-style-type : none">
  <li> <a href="#1"> Documents utiles </a>
    <ol>
      <li> <a href="#1.1"> Documentation générales </a> </li>
      <li> <a href="#1.2"> Base de données de l’exemple </a> </li>
    </ol>
  </li>
  <li> <a href="#2"> Introduction à Lookers </a>
    <ol>
      <li> <a href="#2.1"> Points forts et points faibles </a> </li>
      <li> <a href="#2.2"> Termes techniques </a> </li>
      <li> <a href="#2.3"> Prise en main </a> </li>
    </ol>
  </li>
  <li> <a href="#3"> Exemple d'utilisation simple avec la base SnowLooker </a>
    <ol>
      <li> <a href="#3.1"> Ajout d'une connexion </a> </li>
      <li> <a href="#3.2"> Création d'un projet </a> </li>
      <li> <a href="#3.3"> Création du modèle et des vues </a>
        <ol>
          <li> <a href="#3.3.1"> Création et modifications des vues </a> </li>
          <li> <a href="#3.3.2"> Création du modèle </a> </li>
        </ol>
      </li>
      <li> <a href="#3.4"> Partager le projet sur Git </a> </li>
      <li> <a href="#3.5"> Création de visualisations dans un Dashboard </a> </li>
      <li> <a href="#3.6"> Visualisation et modification du Dashboard </a> </li>
    </ol>
  </li>
  <li> <a href="#4"> Bon à savoir </a>
    <ol>
      <li> <a href="#4.1"> La création des vues et du modèle </a> </li>
      <li> <a href="#4.2"> La création des visualisations </a>
        <ol>
          <li> <a href="#4.2.1"> Général </a> </li>
          <li> <a href="#4.2.2"> Les valeurs </a> </li>
          <li> <a href="#4.2.3"> Les tableaux </a> </li>
          <li> <a href="#4.2.4"> Les histogrammes (colonnes ou barres) </a> </li>
          <li> <a href="#4.2.5"> Les diagrammes circulaires ("Pie") </a> </li>
          <li> <a href="#4.2.6"> Les cartes </a> </li>
        </ol>
      </li>
      <li> <a href="#4.3"> Pour les administrateurs </a> </li>
    </ol>
  </li>
  <li> <a href="#5"> Autres fonctionnalités de Looker </a>
    <ol>
      <li> <a href="#5.1"> Exploration des données </a>
        <ol>
          <li> <a href="#5.1.1"> Avec le paramètre "drill_fields"  </a> </li>
          <li> <a href="#5.1.2"> A partir d'une visualisation </a> </li>
          <li> <a href="#5.1.3"> Liens </a> </li>
          <li> <a href="#5.1.4"> Actions </a> </li>
        </ol>
      </li>
      <li> <a href="#5.2"> Gérer l'accès aux modèles, esapces, données... </a>
        <ol>
          <li> <a href="#5.2.1"> Limiter l'accès aux données </a> </li>
          <li> <a href="#5.2.2"> Limiter l'accès à un ou plusieurs modèles </a> </li>
          <li> <a href="#5.2.3"> Bloquer ou limiter l’accès à son espace personnel </a> </li>
          <li> <a href="#5.2.4"> Vérifier l’accès aux données d’un utilisateur </a> </li>
        </ol>
      </li>
    </ol>
  </li>
</ol>
<br/>
<br/>
<br/>

<h2 style="color:indigo"> Introduction </h2>
<p> Ce document a pour but de découvrir et d’apprendre à utiliser Looker, un outil de visualisation et d’accès aux données.
L’outil est introduit par la présentation de ses points forts et de ses points faibles et par la définition des termes techniques. Un exemple d’utilisation ainsi que quelques exemples de fonctionnalités sont expliqués afin de guider son utilisation. </p>
<br/>
<br/>
<br/>



<h2 style="color:indigo" id="1"> 1. Documents utiles </h2>
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

<h2 style="color:indigo" id="2"> 2. Introduction à Looker </h2>
<h3 style="color:purple" id="2.1">   2.1. Points forts et points faibles </h3>
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




<h3 style="color:purple" id="2.2">   2.2. Termes techniques </h3>
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




<h3 style="color:purple" id="2.3">   2.3. Prise en main </h3>
<p> En fonction de ses droits, un utilisateur a accès aux onglets suivants : </p>
<p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/Onglet.png"/> </p>
<p> Pour exemple, un administrateur a accès à ces 4 onglets, un développeur a accès à tous les onglets sauf « Admin » et ainsi de suite. </p>
<br/>
<br/>
<br/>



<h2 style="color:indigo" id="3"> 3. Exemple d'utilisation simple avec la base SnowLooker </h2>
<p> Le modèle et le Dashboard que nous allons créer n’est qu’un simple exemple, Looker permet de faire plus de choses et certaines choses peuvent être faites de plusieurs façons. </p>
<p> Les résultats de cet exemple sont présents sur Looker : </p>

<ul>
  <li>  Nom du projet : ec_exemple </li>
  <li>  Emplacement du Dashboard et des visualisations : « Browse » → « Shared Space » → « Exemple Rapport ». </li>
</ul>

<p> Les résultats que vous obtiendrez si vous réaliser cet exemple ne seront sûrement pas les mêmes que sur les captures d’écran de ce rapport puisque la base de données est mise à jour quotidiennement. </p>
<br/>
<br/>




<h3 style="color:purple" id="3.1">   3.1. Ajout d'une connexion </h3>
<p> Avant d’établir une connexion, il faut configurer sa base de données pour Looker.
Documentation : <a href="https://docs.Looker.com/setup-and-management/Looker-hosted-install"> https://docs.Looker.com/setup-and-management/Looker-hosted-install </a> </p>
<p> Ici, on n’ajoutera pas de connexion puisqu’on va travailler avec une connexion déjà existante. </p>
<p> Pour la suite, il faut activer le mode développement : dans le menu du haut, cliquer sur « Develop » → « Development Mode ». </p>
<br/>
<br/>




<h3 style="color:purple" id="3.2">   3.2. Création d'un projet </h3>

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




<h3 style="color:purple" id="3.3">   3.3. Création du modèle et des vues </h3>
<p> Une fois le projet créé, une vue est automatiquement créée pour la table « order_items ». Si on avait choisi « All Tables », une vue aurait été créé pour chacune des tables de la base. </p>
<p> On va améliorer cette vue, en ajouter une nouvelle et créer le modèle. </p>
<p> <i> <b style="text-decoration:underline">Remarque :</b> Au fur et à mesure qu’on écrit le code des vues et du modèle, on le test en cliquant sur « Validate Again » sur la gauche de l’écran. S’il y a des erreurs, on les corrige avant de continuer. </i> </p>


<h4 style="color:plum" id="3.3.1">   3.3.1. Création et modifications des vues </h4>
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


<h4 style="color:plum" id="3.3.2">  3.3.2. Création du modèle </h4>
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



<h3 style="color:purple" id="3.4">   3.4. Partager le projet sur Git </h3>
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



<h3 style="color:purple" id="3.5">   3.5. Création de visualisations dans un Dashboard </h3>

<h4 style="color:plum" id="3.5.1">   3.5.1. Une valeur </h4>
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


<h4 style="color:plum" id="3.5.2">   3.5.2. Un graphique </h4>
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



<h3 style="color:purple" id="3.6">   3.6. Visualisation et modification du Dashboard </h3>
<p> On va insérer la visualisation « Evolution du nombre de commandes », que nous avions sauvegardé dans notre espace personnel, au Dashboard  que nous avions créé dans ce même espace : <p>

<ul>
  <li>  Aller dans l’onglet « Browse » → « YourName’s Space ».
    <p> <i> <b style="text-decoration:underline">Remarque :</b> Dans cette espace (ou n’importe quel autre espace), on peut créer un nouveau Dashboard en allant sur « New » → « Dashboard » en haut à droite. On peut aussi créer des sous-espace (sorte de dossier) en allant sur « New » → « Space ». C’est aussi dans cet espace qu’on retrouve la visualisation « Evolution du nombre de commandes ». </i> </p>
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
<br/>
<br/>
<br/>




<h2 style="color:indigo" id="4"> 4. Bon à savoir </h2>



<h3 style="color:purple" id="4.1">  4.1. La création des vues et du modèle </h3>

<h4>  &nbsp;&nbsp;&nbsp;&nbsp; - CLES PRIMAIRES : </h4>
<p> Chaque vue doit contenir une dimension qui est clé primaire. Si la clé primaire est une combinaison de plusieurs dimensions alors il faut créer une dimension dans laquelle on va concaténer les différentes dimensions qui composent la clé primaire : </p>
<p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex14.png"/> </p>
<br/>
<br/>


<h4>  &nbsp;&nbsp;&nbsp;&nbsp; - ORGANISER LE SELECTEUR DE CHAMPS : </h4>
<p> Pour rendre la création de visualisations plus facile aux utilisateurs, on peut organiser les champs du sélecteur de champs grâce à des labels : </p>

<ul>
  <li>  Tout d’abord, on peut mettre des labels (et des descriptions si nécessaire) aux dimensions et aux mesures. </li>
  <li>  On peut créer des groupes de champs à l’intérieur d’une vue. Pour rassembler plusieurs champs on leur ajoute la propriété « group_label » en leur donnant le même label. Par exemple, pour créer un groupe « Lieu » qui rassemble les dimensions « Country », « City », « State » et « Zip » en leur ajoutant la propriété « group_label:  "Lieu" ». Dans un explore, on obtient donc le groupe qu’on peut plier ou déplier : </li>
  <p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex15.PNG"/> </p>
  <li>  Dans le modèle, lors de la création d’un explore on peut donner un label à chaque vue que l’on joint avec le paramètre « view_label ». Si on met le même label pour plusieurs vues alors les champs de ces vues seront rassemblés sous ce même label dans le sélecteur de champs. </li>
</ul>

<p> Pour ne pas encombrer le sélecteur de champs, on peut cacher les champs inutiles à la création des visualisations afin qu’il n’apparaissent pas dans le sélecteur en leur ajoutant le propriété « hidden: "yes" ». Les champs cachés peuvent toujours être référencés dans d’autres champs. </p>
<br/>
<br/>


<h4>  &nbsp;&nbsp;&nbsp;&nbsp; - COORDONNEES GPS : </h4>
<p> Si on possède une dimension latitude et une dimension longitude et qu’on souhaite pouvoir représenter ces coordonnées sur une carte, il faut créer une dimension de type « location » : </p>
<p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex16.png"/> </p>
<p> Pour avoir la localisation approximative : </p>
<p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex17.png"/> </p>
<br/>
<br/>


<h4>  &nbsp;&nbsp;&nbsp;&nbsp; - CHAMP GEOGRAPHIQUE : </h4>
<p> Lorsqu’une dimension représente une donnée géographique, il faut lui attribuer un « map_layer » si on veut pouvoir l’utiliser pour des représentations cartographiques : </p>
<p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex18.png"/> </p>
<p> Looker propose peut de « map_layer » donc si notre dimension de correspond à aucun « map_layer » prédéfinit alors on peut le définir nous même (en important un fichier de données spatiales au format topojson). </p>
<br/>
<br/>


<h4>  &nbsp;&nbsp;&nbsp;&nbsp; - UTILISER PLUSIEURS FOIS LA MEME VUE DANS UN EXPLORE : </h4>
<p> Il est possible d’utiliser plusieurs fois la même vue dans un explore en lui donnant des noms différents. Pour cela, il faut utiliser le paramètre « from » (c’est ce paramètre qui contient le vrai nom de la vue) : </p>
<p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex19.png"/> </p>
<br/>
<br/>



<h3 style="color:purple" id="4.2">  4.2. La création des visualisations </h3>
<p> Cette partie présente quelques fonctionnalités et options intéressantes qu’on peut appliquer aux visualisations. </p>

<h4 style="color:plum" id="4.2.1">  4.2.1. Général </h4>
<h4>  &nbsp;&nbsp;&nbsp;&nbsp; - PIVOT : </h4>
<p> Les dimensions peuvent être placés en pivot : </p>
<p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex20.png"/> </p>
<br/>
<br/>

<h4>  &nbsp;&nbsp;&nbsp;&nbsp; - CALCULATIONS : </h4>
<p> On peut ajouter des colonnes calculées à partir des autres colonnes sélectionnées en cliquant sur « CALCULATIONS » : </p>
<p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex21.PNG"/> </p>
<p> Puis créer la colonne calculée en lui donnant un nom, un type et une formule (cliquer sur « Add Table Calculation » en haut à gauche si on veut créer une deuxième colonne ou plus et sur le lien en bas de la fenêtre pour accéder à la documentation si on a besoin d’aide pour la syntaxe) : </p>
<p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex22.png"/> </p>
<p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex23.png"/> </p>
<br/>
<br/>

<h4>  &nbsp;&nbsp;&nbsp;&nbsp; - COLONNE MASQUEE : </h4>
<p> On peut masquer une colonne qu’on a sélectionné afin qu’elle n’apparaisse pas dans la visualisation : </p>
<p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex24.PNG"/> </p>
<p> Cela permet notamment d’utiliser des champs pour créer des colonnes calculées (« Calculations »). </p>
<br/>
<br/>

<h4>  &nbsp;&nbsp;&nbsp;&nbsp; - LIMITER LE NOMBRE DE LIGNES + ODRE CROISSANT ET DECROISSANT : </h4>
<p> On peut limiter le nombre de lignes résultats de la requête pour ne garder que les meilleures ou les moins bonnes. Par exemple, si on veut afficher les 10 villes où il y le plus d’utilisateurs (le TOP 10), on indique que le nombre limite de lignes est 10 (par défaut il est à 500 mais on peut le faire varier de 1 à 5 000) : </p>
<p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex25.PNG"/> </p>
<p> Si on veut les 10 villes où il y a le moins d’utilisateur, il suffit d’ordonner la mesure dans l’ordre croissant : </p>
<p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex26.PNG"/> </p>
<p> On peut ordonner selon plusieurs colonnes (mesures ou dimensions) en maintenant la touche Shift et revenir à l’ordre décroissant en cliquant à nouveau sur la flèche. </p>
<br/>
<br/>

<h4 style="color:plum" id="4.2.2">  4.2.2. Les valeurs </h4>
<h4>  &nbsp;&nbsp;&nbsp;&nbsp; - MISE EN FORME : </h4>
<p> Pour modifier la mise en forme d’une valeur, on peut changer la couleur d’affichage de la valeur et lui ajouter un titre de description en allant dans le volet d’options « Style » : </p>
<p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex27.png"/> </p>
<br/>
<br/>

<h4>  &nbsp;&nbsp;&nbsp;&nbsp; - AJOUTER UNE COMPARAISON : </h4>
<p> Pour ajouter une comparaison sous la valeur, il faut activer l’option « Show Comparison » dans le volet « Comparison ». Il y a 4 styles de comparaisons, il faut choisir celle la mieux adaptée au contexte (si on choisit mal, il est possible que ça n’ait aucun sens). La valeur sera comparée à une cellule de la même ligne : </p>
<p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex28.PNG"/> </p>
<br/>
<br/>

<h4 style="color:plum" id="4.2.3">  4.2.3. Les tableaux </h4>
<h4>  &nbsp;&nbsp;&nbsp;&nbsp; - MISE EN FORME CONDITIONNELLE : </h4>
<p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex29.PNG"/> </p>
<br/>
<br/>

<h4>  &nbsp;&nbsp;&nbsp;&nbsp; - SOUS-TOTAUX : </h4>
<p> Il est possible d’obtenir un tableau contenant les sous-totaux : cocher la case « Subtotals » et choisir la visualisation « TABLE-NEXT (BETA) ». Cette fonctionnalité n’est pas disponible dans tous les dialectes ainsi que si on filtre sur une mesure. On peut aussi cocher la case « Totals » si on veut afficher le total général. </p>
<p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex30.PNG"/> </p>
<br/>
<br/>

<h4 style="color:plum" id="4.2.4">  4.2.4. Les histogrammes (colonnes ou barres) </h4>
<h4>  &nbsp;&nbsp;&nbsp;&nbsp; - HISTOGRAMME EMPILE : </h4>
<p> Dans le cas où l’on a un champ en pivot, l’histogramme par défaut est le suivant : </p>
<p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex31.png"/> </p>
<p> Dans cet exemple, les barres représentant les hommes et les femmes sont regroupées côtes à côtes selon le pays. Si on veut empiler les genres pour n’avoir qu’une seule barre par pays, on choisit l’option « Stacked » : </p>
<p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex32.PNG"/> </p>
<p> On choisira l’option « Satcked Percentage » si on veut comparer les proportions hommes/femmes dans chaque pays : </p>
<p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex33.PNG"/> </p>
<br/>
<br/>

<h4>  &nbsp;&nbsp;&nbsp;&nbsp; - AFFICHER LES VALEURS : </h4>
<p> Pour afficher les valeurs, il faut activer l’option « Value Labels » dans le volet « Values » : </p>
<p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex34.PNG"/> </p>
<br/>
<br/>

<h4>  &nbsp;&nbsp;&nbsp;&nbsp; - AJOUTER UNE LIGNE DE REFERENCE : </h4>
<p> Une ligne de référence peut représenter la moyenne, le maximum, minimum… Il est possible d’en ajouter plusieurs sur un même graphique.  <br/>
Pour ajouter une ligne de référence (ou une ligne de tendance), aller dans le volet « Y » des options puis cliquer sur « Add a Reference Line » (ou « Add a Trend Line ») tout en bas puis paramétrer la ligne : </p>
<p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex35.PNG"/> </p>
<p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex36.PNG"/> </p>
<br/>
<br/>

<h4>  &nbsp;&nbsp;&nbsp;&nbsp; - AJOUTER L'EVOLUTION EN POURCENTAGE : </h4>
<p> Une dernière option intéressante sur les histogrammes est qu’on peut afficher l’évolution en pourcentage en activant l’option « Show Percent of Previous » : </p>
<p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex37.PNG"/> </p>
<p> <i> <b style="text-decoration:underline"> Remarque : </b> Comme pour tous les types de graphiques, le volet d’options « Series » permet de modifier les couleurs, le nom des axes… </i> </p>
<p> <i> <b style="text-decoration:underline"> Remarque : </b>  Mise à part cette dernière options, toutes les options présentées sur les histogrammes sont aussi valables pour les courbes. </i> </p>
<br/>
<br/>

<h4 style="color:plum" id="4.2.5">  4.2.5. Les diagramme circulaires ("Pie") </h4>
<h4>  &nbsp;&nbsp;&nbsp;&nbsp; - MODIFIER LA FORME DU DIAGRAMME : </h4>
<p> Il est possible de modifier l’affichage du diagramme circulaire pour qu’il apparaisse sous forme de donnut. Il faut indiquer la taille de l’espace intérieur blanc dans la case « Inner Radius » :  </p>
<p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex38.PNG"/> </p>
<p> On peut aussi ne faire apparaître qu’une portion de cercle en indiquant l’angle de début du cercle « Start Angle » et l’angle de fin du cercle « End Angle » : </p>
<p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex39.PNG"/> </p>
<br/>
<br/>

<h4>  &nbsp;&nbsp;&nbsp;&nbsp; - REMPLACER LA LEGENDE PAR DES LABELS : </h4>
<p> Si on veut que les valeurs soient affichées par des labels plutôt que dans une légende, il suffit de modifier la valeur de l’option « Value Labels » (on peut ensuite modifier le « Label Type » : </p>
<p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex40.PNG"/> </p>
<br/>
<br/>

<h4 style="color:plum" id="4.2.6">  4.2.6. Les cartes </h4>
<p> Pour représenter des données sur une carte, il faut utiliser un champ géographique. Cela peut être un champ de type « location » (coordonnées GPS) ou un champ auquel on a attribué un « map_layer ». </p>
<h4>  &nbsp;&nbsp;&nbsp;&nbsp; - CARTE AVEC DES COORDONNEES GPS : </h4>
<p> Par défaut, lorsqu’on représente des coordonnées GPS (de type location), la carte affiche simplement des points sans mise en forme. Si on veut que la couleur et/ou la taille des points soient proportionnelles aux valeurs de la mesure, aller dans le volet « Points », indiquer que les couleurs sont basées sur la valeur de la mesure (« Based on Value ») et si nécessaire indiquer que
</p>
<p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex41.PNG"/> </p>
<p> Dans le volet « Value », on peut ensuite modifier les couleurs de l’échelle (« Value Colors »), son amplitude (« Minimum Value » et « Maximum Value »), si on active l’option « Quantitize Color » alors l’échelle n’est plus un dégradé de couleurs mais elle est divisée en paliers : </p>
<p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex42.PNG"/> </p>
<p> <i> <b style="text-decoration:underline"> Remarques : </b> Ces dernières options sont aussi valables pour les cartes possédant un « map_layer ». </i> </p>
<p> On peut remplacer les points par des icones en modifiant le type des points dans le volet « Point » puis choisir l’icône : </p>
<p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex43.PNG"/> </p>
<br/>
<br/>



<h3 style="color:purple" id="4.3">  4.3. Pour les administrateurs </h3>
<h4>  &nbsp;&nbsp;&nbsp;&nbsp; - AJOUT D'UN UTILISATEUR : </h4>
<p> Pour ajouter un nouvel utilisateur, aller dans l’onglet « Admin » → « Users » puis cliquer sur « Add User ». Indiquer son adresse email, lui attribuer un ou plusieurs rôles et éventuellement l’ajouter à un ou plusieurs groupes d’utilisateurs.
Il est possible à tout moment de modifier un utilisateur en allant dans « Admin » → « Users »  puis en cliquant sur « Edit » à droite de l’utilisateur. La modification permet de modifier des paramètres qui ne sont pas présent lors de l’ajout de l’utilisateur comme par exemple la valeur des attributs. </p>
<br/>
<br/>

<h4>  &nbsp;&nbsp;&nbsp;&nbsp; - CREATION D'UN GROUPE D'UTILISATEURS : </h4>
<p> On peut créer des groupes d’utilisateurs qui regroupent des utilisateurs qui auront des rôles, droits d’accès… en commun. Pour cela, aller dans l’onglet « Admin » → « Groups » puis cliquer sur « Add Group ». </p>
<br/>
<br/>

<h4>  &nbsp;&nbsp;&nbsp;&nbsp; - TYPES DE VISUALISATIONS SUPPLEMENTAIRES : </h4>
<p> Il est possible d’ajouter des types visualisations supplémentaires dans Looker. On en trouve sur ce site : <a href="https://looker.com/platform/blocks/directory#viz"> https://looker.com/platform/blocks/directory#viz </a>. Pour ajouter l’une de ces visualisations à son instance Looker : </p>

<ul>
  <li>  Aller sur le site et cliquer sur la visualisation qu’on veut ajouter. </li>
  <li>  Cliquer sur « See the Code » puis copier le lien qui apparaît. </li>
  <li>  Sur Looker, aller dans l’onglet « Admin » → « Visualizations ». </li>
  <li>  Vérifier que le type de visualisations n’a pas déjà été ajouté puis cliquer sur « Add Visualization ». </li>
  <li>  Compléter les informations et coller le lien : </li>
</ul>
<p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex44.png"/> </p>
<br/>
<br/>

<h4>  &nbsp;&nbsp;&nbsp;&nbsp; - FORMAT DE NOMBRES : </h4>
<p> On peut modifier le format d’affichage des nombres si celui par défaut de convient pas. Si on veut modifier le format d’affichage pour tous les utilisateurs alors on modifie le format par défaut. Pour cela, aller dans « Admin » → « User Attributes » puis cliquer sur « Edit » pour l’attribut « number_format » avant de modifier sa valeur par défaut : </p>
<p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex45.PNG"/> </p>
<p> Si on veut le modifier pour un utilisateur en particulier, aller dans « Admin » → « Users »  puis cliquer sur « Edit » sur la droite de l’utilisateur, changer la valeur de l’attribut « number_format » et sauvegarder. </p>
<br/>
<br/>

<h4>  &nbsp;&nbsp;&nbsp;&nbsp; - DASHBOARDS INSTANTANNES : </h4>
<p> Si les dashboards sont trop long à charger, on peut activer une option qui permet d’afficher les résultats du précédent rafraichissement du dashboard pendant l’exécution des requêtes. Les informations apparaissent donc instantanément sur le dashboard.
Pour cela, aller dans l’onglet « Admin » → « Lab » puis activer l’option « Instant Dashboards ».
Cette page contient d’autre fonctionnalités qu’on peut activer/désactiver. </p>
<br/>
<br/>

<h4>  &nbsp;&nbsp;&nbsp;&nbsp; - COULEURS PAR DEFAUT : </h4>
<p> Pour choisir la palette de couleurs par défaut des visualisations, aller dans « Admin » → « Settings » puis dans la partie « Default Visualization Colors » (ne pas oublier de cliquer que « Update » pour enregistrer les modifications).
Au même endroit, on peut créer une palette de couleurs personnalisées, si la palette personnalisée est déjà créée, on peut la modifier. </p>
<br/>
<br/>
<br/>




<h2 style="color:indigo" id="5"> 5. Autres fonctionnalités de Looker </h2>

<h3 style="color:purple" id="5.1">  5.1. Exploration des données </h3>
<h4 style="color:plum" id="5.1.1">  5.1.1. Avec le paramètre "drill_fields" </h4>
<p> Le paramètre « drill-fields » permet de gérer l’exploration des données pour une mesure ou une dimension. </p>

<ul>
  <li> Ce paramètre est surtout utile pour les mesures de type « count » ou « count distinct » afin d’afficher les enregistrements qui composent cette donnée.
  Exemple : Pour la mesure « count » dans la table « users » qui calcul le nombre d’utilisateurs :
  <p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex46.PNG"/> </p>
  ou si on compte utiliser cette liste de champs plusieurs fois, on peut créer une collection de champs :
  <p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex47.PNG"/> </p>
  Si on clique sur une valeur de cette mesure dans cette visualisation, on obtient la liste des utilisateurs :
  <p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex48.PNG"/> </p>
  </li>
  <li> Ce paramètre est surtout utilisé pour les dimensions qui possèdent une hiérarchie afin de remplacer la dimension par une autre dimension d’un niveau hiérarchique inférieur.
  Exemple : Si on représente le nombre d’utilisateurs par pays, on clique sur le pays « USA » pour l’explorer et on sélectionne « by State ». On obtient une représentation du nombre d’utilisateurs par état pour les USA :
  <p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex49.PNG"/> </p>
  </li>
</ul>

<p> Plus de détails sur ce paramètre : <a href="https://docs.looker.com/reference/field-params/drill_fields"> https://docs.looker.com/reference/field-params/drill_fields </a> </p>
<br/>
<br/>

<h4 style="color:plum" id="5.1.2">  5.1.2. A partir d'une visualisation </h4>
<p> Il est possible d’explorer les données en accédant à la page « Explore » d’une visualisation afin d’y ajouter/enlever des champs, des filtres… pour obtenir les informations que l’on souhaite. Pour cela, cliquer sur les 3 points en haut à droite d’une visualisation puis sur « Explore From Here ». Par exemple, en allant dans le dashboard qu’on avait créé : </p>
<p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex50.PNG"/> </p>
<br/>
<br/>

<h4 style="color:plum" id="5.1.3">  5.1.3. Lien </h4>
<p> Une autre façon d’explorer les données est d’insérer un lien vers un dashboard, une visualisation, un explore ou un lien extérieur à Looker.
Pour cela, on peut utiliser le paramètre « link » : <a href="https://docs.Looker.com/reference/field-params/link"> https://docs.Looker.com/reference/field-params/link </a> </p>
<p> Un exemple de lien vers un dashboard est présent dans la vue « 02_users » du projet « welcome to Looker » pour la dimension « email » (ou encore dans la vue « 04_product » pour la dimension « brand ») : </p>
<p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex56.png"/> </p>
<p> L’url du lien permet aussi de conserver les valeurs des filtres lors de l’exploration, par exemple si on veut conserver la valeur du filtre sur la dimension « created_date » de la table « order_items » en l’affectant au filtre « Période » (du dashboard « customer_lookup ») : </p>
<p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex58.PNG"/> </p>
<br/>
<br/>

<h4 style="color:plum" id="5.1.4">  5.1.4. Actions </h4>
<p> Il existe des actions permettant par exemple d’envoyer un mail à la personne en cliquant sur son adresse email. On peut retrouver la liste des actions possibles dans l’onglet « Admin » → « Actions » et l’activer en cliquant sur « Enable ». </p>
<p> Un exemple d’utilisation de l’action « SendGrid » permettant d’envoyer des mails est présent dans la vue « 02_users » du projet « welcome to Looker » pour la dimension « email ».
Documentation utile pour l’action « SendGrid » : <a href="https://docs.Looker.com/reference/field-params/action"> https://docs.Looker.com/reference/field-params/action </a> et <a href="https://discourse.Looker.com/t/Looker-actions-sendgrid/6821"> https://discourse.Looker.com/t/Looker-actions-sendgrid/6821 </a> </p>
<br/>
<br/>



<h3 style="color:purple" id="5.2">  5.2. Gérer l'accès aux modèles, esapces, données... </h3>
<p> Les exemples sont ici présents à titre indicatif, le modèle qu’on a créé et utilisé jusqu’ici ne permet pas de tester les accès sur les centres de distributions. Vous pouvez les tester sur le projet « welcome to looker » mais veillez à tout effacer/supprimer les attributs utilisateurs, filtres d’accès, rôles… afin de ne pas encombrer Looker avec des choses inutiles et de ne pas bloquer les accès de certains utilisateurs. </p>
<br/>

<h4 style="color:plum" id="5.2.1">  5.2.1. Limiter l'accès aux données </h4>
<p> Par exemple si on veut que les managers des centres de distributions n’est accès qu’aux données de leur centre de distribution : </p>
<ul>
  <li> Créer un attribut qui contiendra le nom de son centre de distribution. Aller dans l’onglet « Admin » → « User Attributes » puis cliquer sur « Create User Attribute » : </li>
  <p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex51.PNG"/> </p>
  <p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex52.PNG"/> </p>
  <p> <i> <b style="text-decoration:underline"> Remarque : </b> Dans les attributs utilisateurs, il y a un attribut permettant de définir le format d’affichage des nombres : « number_format ». On peut changer ce format d’affichage pour tous les utilisateurs en modifiant la valeur par défaut de cet attribut. </i> </p>
  <li> Affecter une valeur aux utilisateurs pour cet attribut, par exemple pour le manager du centre de distribution « Chicago IL », on va lui affecter la valeur « Chicago IL » pour qu’il n’est accès qu’aux données de ce centre (si on ne lui affecte pas de valeur il aura la valeur par défaut donc il aura accès à tout).
  Aller dans l’onglet « Admin » → « Users » puis cliquer sur « Edit » sur la droite d’un utilisateur, lui affecter une valeur pour l’attribut et sauvegarder : </li>
  <p style="text-align:center"> <img src="https://raw.githubusercontent.com/EmelineCailliau/ec_exemple/master/Images/ex53.png"/> </p>
  <p> On peut affecter plusieurs valeurs en les séparant par une virgule. </p>
  <li>  Aller dans l’onglet « Develop » → « Nom du projet » puis aller dans le modèle pour filtrer l’accès aux données d’un explore : </li>

  <table> <tr> <td>
  access_filter: { <br/>
    &nbsp;&nbsp;field: distribution_centers.name         <i style="color:dodgerblue"> # nom du champs (nom_vue.nom_dimension) </i> <br/>
    &nbsp;&nbsp;user_attribute: distribution_center      <i style="color:dodgerblue"> # nom de l’attribut utilisateur </i>  <br/>
  }
  </td> </tr> </table>

  <p> Documentation : <a href="https://docs.Looker.com/reference/explore-params/access_filter"> https://docs.Looker.com/reference/explore-params/access_filter </a> </p>
</ul>
<br/>
<br/>

<h4 style="color:plum" id="5.2.2">  5.2.2. Limiter l'accès à un ou plusieurs modèles </h4>
<p> Eventuellement, on ajoute un utilisateur : onglet « Admin » → « Users » puis cliquer sur « Add Users » en haut à gauche. </p>
<p> Pour qu’un utilisateur n’est accès qu’à un seul ou plusieurs modèles et pas aux autres : </p>
<ul>
  <li>  Créer un ensemble de modèle : aller dans l’onglet « Admin » → « Roles » puis cliquer sur « New Model Set », sélectionner le ou les modèle(s) pour lesquels on veut donner l’accès. </li>
  <li>  Créer un rôle : aller dans l’onglet « Admin » → « Roles » puis cliquer sur « New Role », choisir les permissions que l’on souhaite accorder (« Permission Set ») et le « Model Set » que l’on vient de créer. Si l’on veut, on peut aussi sélectionner les utilisateurs ou/et groupes d’utilisateurs qui auront ce rôle.
  Attention : même si on a attribué ce rôle à un utilisateur, il est possible qu’il ait quand même accès aux autres modèles s’il a aussi, par exemple, le rôle d’administrateur (qui lui donne tous les droits). </li>
  <li>  On peut ensuite attribuer ce rôle à un utilisateur lors de sa création ou à un utilisateur déjà existant (aller dans l’onglet « Admin » → « Users » puis cliquer sur le bouton « Edit » à droite de l’utilisateur). </li>
</ul>

<p> Une autre manière de limiter l’accès à un modèle est de définir les conditions d’accès selon un attribut utilisateur directement dans le modèle. Par exemple, si on veut que seuls les manager des centres de distributions de « Chicago IL » et « Philadelphia PA » aient accès à ce modèle : </p>
<ul>
  <li>  Créer l’attribut utilisateur « distribution_center » (voir <a href="#5.2.1"> 5.2.1 </a>). </li>
  <li>  Limiter l’accès au modèle : aller dans l’onglet « Develop » → « Nom du projet » puis dans le modèle : </li>

  <table> <tr> <td>
  access_grant: center { <br/>
   &nbsp;&nbsp; allowed_values: ["Chicago IL", "Philadelphia PA"] <br/>
   &nbsp;&nbsp; user_attribute: distribution_center <br/>
  }
  </td> </tr> </table>

</ul>

<p> Documentation (aussi pour limiter l’accès à une vue ou une dimension) : <a href="https://docs.Looker.com/reference/model-params/access_grant?version=6.14&lookml=new"> https://docs.Looker.com/reference/model-params/access_grant?version=6.14&lookml=new </a> </p>
</br>
</br>

<h4 style="color:plum" id="5.2.3"> 5.2.3. Bloquer ou limiter l’accès à son espace personnel  </h4>
<ul>
  <li>  Aller dans l’onglet « Browse » → « YourName’Space ». </li>
  <li>  Cliquer sur la roue dentée en haut à droite puis « Manage Access… ». </li>
  <li>  A partir de là, on peut supprimer ou ajouter des utilisateurs ou des groupes qui auront accès à l’espace. </li>
  <li>  On peut aussi créer différents sous-espaces (comme des dossiers) dans notre espace et limiter l’accès de façon différente pour chacun d’entre eux. </li>
</ul>
</br>
</br>

<h4 style="color:plum" id="5.2.4">  5.2.4.  Vérifier l’accès aux données d’un utilisateur </h4>
<p> On peut vérifier qu’on a bien limité l’accès aux données d’un utilisateur en substituant sont compte, c’est-à-dire utiliser Looker en tant que cet utilisateur. Pour cela aller dans l’onglet « Admin » → « Users » puis cliquer sur « Sudo » à droite d’un utilisateur. </p>
