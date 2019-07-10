connection: "snowlooker"
include: "*.view"

explore: order_items {       # vue inclue dans l’Explore
  label: "Commandes et utilisateurs"    # nom affiché dans le menu Explore
  view_label: "Commandes"           # optionnel : nom de la vue qui apparaitra dans l’Explore

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
