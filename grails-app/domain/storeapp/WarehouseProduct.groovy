package storeapp

import storeapp.Product
import storeapp.Warehouse

class WarehouseProduct {
    Warehouse warehouse
    Product product

    static belongsTo = [warehouse: Warehouse, product: Product]

    static constraints = {
        warehouse nullable: false
        product nullable: false
    }
}
