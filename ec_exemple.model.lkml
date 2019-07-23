connection: "snowlooker"
include: "*.view"

#access_grant: center {
#  allowed_values: ["Chicago IL", "Philadelphia PA"]
#  user_attribute: distribution_center
#}

explore: order_items {       # vue inclue dans l’Explore
  label: "Commandes et utilisateurs"    # nom affiché dans le menu Explore
  view_label: "Commandes"           # optionnel : nom de la vue qui apparaitra dans l’Explore

  #access_filter: {
  #  field: distribution_centers.name            # nom du champs (nom_vue.nom_dimension)
  #  user_attribute: distribution_center      # nom de l’attribut utilisateur
  #}

  join: users {           # vue inclue dans l’Explore
    view_label: "Utilisateurs"
    type: left_outer
    sql_on: ${order_items.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: user_order_facts {
    view_label: "Utilisateurs"
    relationship: many_to_one
    sql_on: ${user_order_facts.utilisateur} = ${order_items.user_id} ;;
  }}
