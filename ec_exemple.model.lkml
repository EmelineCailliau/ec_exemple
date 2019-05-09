connection: "snowlooker"

# include all the views
include: "*.view"


explore: order_items {
  label: "Commandes et utilisateurs"    # nom affiché dans le menu Explore
  join: users {       # vue inclue dans le Explore
    type: left_outer
    sql_on: ${order_items.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: user_order_facts {       # vue inclue dans le Explore
    type: left_outer
    sql_on: ${order_items.user_id} = ${user_order_facts.utilisateur} ;;
    relationship: many_to_one
  }
}
