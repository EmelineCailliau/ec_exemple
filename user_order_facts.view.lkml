view: user_order_facts {
  derived_table: {
    sql:
      SELECT user_id as utilisateur,
            COUNT(*) as lifetime_order
      FROM orders
      GROUP BY user_id;;
  }

  #Créer des dimensions pour les champs de la table dérivée
  dimension: utilisateur {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.utilisateur ;;
  }

  dimension: lifetime_order {
    label: "Nombre d’items commandés"
    type: number
    sql: ${TABLE}.lifetime_orders ;;
  }
}
