package storeapp

import storeapp.Product
import storeapp.Warehouse
class WarehouseProduct {

    Warehouse warehouse
    Product product
    int quantity

    static belongsTo = [warehouse: Warehouse, product: Product]

    static constraints = {
        quantity nullable: false, min: 0
    }
}