package storeapp

import storeapp.Product
import storeapp.Warehouse

class WarehouseProduct {
    Warehouse warehouse
    Product product
    int quantity  // Add quantity field

    static belongsTo = [warehouse: Warehouse, product: Product]
    static constraints = {
        warehouse nullable: false
        product nullable: false
        quantity min: 0  // Quantity should not be negative
    }
}
