
<h1 style="color:indigo;text-decoration:underline;text-align:center"> Présentation de l'outil "Looker" </h1>
<br/>
<br/>

<h2 style="color:indigo"> Introduction </h2>
Ce document a pour but de découvrir et d’apprendre à utiliser Looker, un outil de visualisation et d’accès aux données.
L’outil est introduit par la présentation de ses points forts et de ses points faibles et par la définition des termes techniques. Un exemple d’utilisation ainsi que quelques exemples de fonctionnalités sont expliqués afin de guider son utilisation.
<br/>
<br/>
<br/>

<h2 style="color:indigo"> Documents utiles </h2>
<h3 style="color:purple"> Documentation générale </h3>
Toute la documentation est disponible directement sur looker, on y trouve des liens un peu partout. On peut y accéder directement en passant par ce lien : https://docs.looker.com/.
Looker propose des cours en lignes gratuits : https://training.looker.com/.
<br/>
<br/>

<h3 style="color:purple"> Base de données de l’exemple </h3>
Diagramme de la base de données « snowlooker » utilisée pour le projet qui sert de modèle sur Looker (« Welcome to looker »), c’est cette connexion qui sera utilisée dans l’exemple de démonstration de ce rapport : https://dbdiagram.io/d/5cc6e504f7c5bb70c72fcb4d.
<br/>
<br/>
<br/>

<h2 style="color:indigo"> Introduction à Looker </h2>
<h3 style="color:purple">   Points forts et points faibles </h3>
Liste non exhaustive des points forts et des points faibles de Looker :

<table>
  <tr> <th style="color:green;text-align:center"> + </th> <th style="color:red;text-align:center"> - </th> </tr>
  <tr> <td> L’utilisation de <b> Git </b> permet à plusieurs développeurs de travailler en même temps sur le même projet. Les modifications apportées par chacun des développeurs au projet sont combinées. De plus, cela permet de garder une sauvegarde des versions du projet. </td> <td> On ne peut pas utiliser les données provenant d’un fichier <b> Excel </b> (ni csv, txt...) mais seulement celles provenant de bases de données (beaucoup de dialectes possibles).
  On peut quand même inclure une table provenant d’Excel en « bricolant » mais cela n’est possible que pour des tableaux avec peu de lignes et de colonnes : <br/>
  <ul>
  <li> En utilisant la fonction Excel « concatenate » : https://discourse.looker.com/t/uploading-spreadsheet-excel-google-sheets-data-into-looker/8529 </li>
  <li> Ou en passant par GoogleSheet et une connexion BigQuery : https://discourse.looker.com/t/import-excel-data-into-looker/958/7 </li>
  </ul>
 </td> </tr>
  <tr> <td> Le <b> self-service </b> : La création, modification et exploration des visualisations est simple donc les utilisateurs métiers peuvent s’en servir sans l’aide d’un analyste. De plus, la couche de modélisation de Looker (lookML) garantie la cohérence des analyses. </td> <td> Il y a <b> moins de graphiques et moins d’options </b> que sur d’autres outils (comme Tableau). On remarque entre autres qu’on ne peut pas représenter les données sur une carte lorsqu’on travaille sur les régions françaises, les villes… Il est seulement possible de faire des cartes pour les pays, les états, comtés et zip-code des Etats-Unis, les codes postaux d’Angleterre ainsi que les coordonnées GPS. Si on veut vraiment travailler sur les régions par exemple, il faut créer ou télécharger un fichier de données spatiales au format TopoJSON: https://docs.looker.com/reference/model-params/map_layer.  </td> </tr>
  <tr> <td> On peut <b> explorer les données </b> (naviguer, zoomer) de manière assez complète contrairement aux outils habituels. </td> <td>  </td> </tr>
  <tr> <td> On peut <b> limiter l’accès aux données et les rôles </b> des utilisateurs. </td> <td>  </td> </tr>
  <tr> <td> On peut partager les liens de contenus (graphique, Dashboard…) avec d’autres utilisateurs ainsi que <b> planifier l’envoi </b> (ponctuel ou régulier) de ces contenus par mail. </td> <td>  </td> </tr>
  <tr> <td> Looker <b> interroge directement la base de données </b>  à chaque requête sans jamais importer/copier les données. </td> <td>  </td> </tr>
  <tr> <td> Il y a beaucoup de <b> documentation </b> ainsi que des cours (vidéos) pour apprendre à utiliser Looker. Donc il est possible de se former à Looker seul. </td> <td>  </td> </tr>
</table>
<br/>
<br/>
<br/>
