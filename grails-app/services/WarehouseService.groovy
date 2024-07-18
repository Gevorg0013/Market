// grails-app/services/com/example/WarehouseService.groovy

import grails.gorm.transactions.Transactional
import storeapp.Product
import storeapp.Warehouse
import storeapp.WarehouseProduct

@Transactional
class WarehouseService {

    def addToWarehouse(Warehouse warehouse, Product product, int quantity) {
        def warehouseProduct = WarehouseProduct.findByWarehouseAndProduct(warehouse, product)
        if (warehouseProduct) {
            warehouseProduct.quantity += quantity
        } else {
            warehouse.addToProducts(new WarehouseProduct(product: product, quantity: quantity))
        }
    }

    def removeFromWarehouse(Warehouse warehouse, Product product, int quantity) {
        def warehouseProduct = WarehouseProduct.findByWarehouseAndProduct(warehouse, product)
        if (warehouseProduct) {
            if (warehouseProduct.quantity >= quantity) {
                warehouseProduct.quantity -= quantity
            } else {
                throw new IllegalArgumentException("Not enough quantity in warehouse")
            }
        } else {
            throw new IllegalArgumentException("Product not found in warehouse")
        }
    }

    def sendToOtherWarehouse(Warehouse fromWarehouse, Warehouse toWarehouse, Product product, int quantity) {
        removeFromWarehouse(fromWarehouse, product, quantity)
        addToWarehouse(toWarehouse, product, quantity)
    }
}
