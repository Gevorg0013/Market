package storeapp

import storeapp.Product
import storeapp.Warehouse

class WarehouseProduct {
    Warehouse warehouse
    Product product
    Integer quantity

    static constraints = {
        quantity nullable: false, min: 0
    }


    static mapping = {
        warehouse cascade: "all"
        product cascade: "all"
    }
}